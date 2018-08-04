SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE PROCEDURE [wrk].[sp_Contact_Custom_bkp]
AS 


DECLARE @CurrentYear INT = 2018
DECLARE @PriorYear INT = 2017


MERGE INTO dbo.Contact_Custom Target
USING dbo.Contact source
ON source.[SSB_CRMSYSTEM_CONTACT_ID] = target.[SSB_CRMSYSTEM_CONTACT_ID]
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SSB_CRMSYSTEM_ACCT_ID], [SSB_CRMSYSTEM_CONTACT_ID]) VALUES (source.[SSB_CRMSYSTEM_ACCT_ID], Source.[SSB_CRMSYSTEM_CONTACT_ID])
WHEN NOT MATCHED BY SOURCE THEN
DELETE ;

EXEC dbo.sp_CRMProcess_ConcatIDs 'Contact'

/*=============================================================================================================
												 TICKETING BASE
=============================================================================================================*/


SELECT SSB_CRMSYSTEM_CONTACT_ID	
	  ,seasonYear	
	  ,dimEventID
	  ,dimTicketTypeID	
	  ,dimPlanTypeID	
	  ,dimSeatTypeID	  
	  ,TicketBuyerType	
	  ,IsRenewal
	  ,QTY
	  ,REV
	  ,Rank() OVER(Partition By SSB_CRMSYSTEM_CONTACT_ID ORDER BY SeasonYear DESC, BuyerTypeRank) BuyerTypeRank
INTO #Ticketing
FROM (
		select  ssbid.SSB_CRMSYSTEM_CONTACT_ID
				,seasonYear
				,DimEventID
				,dimTicketTypeID
				,dimPlanTypeID
				,dimSeatTypeID
				,case when dimSeattypeID = 4 THEN 'Suite'
					 WHEN dimTickettypeid IN (1,2,3) THEN 'Season'
					 WHEN dimTickettypeid = 4 THEN 'Mini'
					 WHEN dimTickettypeid IN (6,7,8)  THEN 'Group'
					 ELSE 'Single'
				END  TicketBuyerType
				,case when dimplantypeid IN (2,3) THEN 1 ELSE 0 END AS IsRenewal
				,CASE WHEN fts.dimeventid = 0 THEN CASE WHEN dupes.dimcustomerid IS NOT NULL THEN 0 
	  												    ELSE 9*qtyseat
	  											   END
	  				 ELSE qtyseat
	  			END qty
				,CASE WHEN fts.dimeventid = 0 and dupes.dimcustomerid is not null THEN 0 ELSE BlockPurchasePrice END rev
		from Jaguars.dbo.factticketsales fts (NOLOCK)
			JOIN Jaguars.dbo.dimseason ds (NOLOCK) on ds.dimseasonid = fts.dimseasonid
			JOIN Jaguars.dbo.dimcustomerssbid ssbid (NOLOCK) on ssbid.dimcustomerid = fts.dimcustomerid
			LEFT JOIN (  select fts.dimseasonid, fts.dimcustomerid
						 from Jaguars.dbo.factticketsales fts (NOLOCK)
			 				 JOIN  (select DISTINCT fts.dimseasonid, dimcustomerid
			 						from Jaguars.dbo.factticketsales fts (NOLOCK)
			 							 JOIN Jaguars.dbo.dimseason ds (NOLOCK) on ds.dimseasonid = fts.dimseasonid
			 						 where dimeventid = 0
			  							  AND (seasonname = concat(seasonyear,' Jaguars Season Tickets')
											   OR seasonname = concat(seasonyear,' Jaguars Manifest')
											   OR (ds.SeasonName LIKE '%playoffs%' AND ds.SeasonName NOT LIKE '%parking%')
											   )
			 						)unexpanded on unexpanded.dimseasonid = fts.dimseasonid
			 									   AND unexpanded.dimcustomerid = fts.dimcustomerid
						 GROUP BY fts.dimseasonid, fts.dimcustomerid
						 HAVING COUNT(distinct dimeventid) > 1
						)dupes on dupes.dimcustomerid = fts.dimcustomerid
		where IsComp = 0
			  AND (seasonname = concat(seasonyear,' Jaguars Season Tickets')
					OR seasonname = concat(seasonyear,' Jaguars Manifest')
					OR (ds.SeasonName LIKE '%playoffs%' AND ds.SeasonName NOT LIKE '%parking%')
					)

		UNION ALL

		SELECT SSB_CRMSYSTEM_CONTACT_ID
			  ,seasonYear
			  ,DimEventID
			  ,-1 dimTicketTypeID
			  ,-1 dimPlanTypeID
			  ,-1 dimSeatTypeID
			  , 'Single' TicketBuyerType
			  , 0 AS IsRenewal
			  , tex.num_seats qty
			  , tex.te_purchase_price rev
		FROM jaguars.ods.tm_tex tex
			JOIN dbo.vwDimCustomer_ModAcctId dc ON dc.AccountId = tex.assoc_acct_id
			JOIN jaguars.dbo.dimseason dimseason ON dimseason.SSID_season_id = tex.season_id
			JOIN jaguars.dbo.DimEvent dimevent ON dimevent.SSID_event_id = tex.event_id
		WHERE dc.SourceSystem = 'tm'
			  AND tex.activity_name IN ('TE Resale','Forward')
			  AND (seasonname = concat(seasonyear,' Jaguars Season Tickets')
				OR seasonname = concat(seasonyear,' Jaguars Manifest')
				OR (dimseason.SeasonName LIKE '%playoffs%' AND dimseason.SeasonName NOT LIKE '%parking%')
				)
	 )x
	 JOIN (select 'Suite' as BuyerType, 1 as BuyerTypeRank
		   UNION ALL Select 'Season', 2
		   UNION ALL Select 'Mini', 3
		   UNION ALL Select 'Group', 4
		   UNION ALL Select 'Single', 5
		   )y on y.Buyertype = x.TicketBuyerType

CREATE NONCLUSTERED INDEX IX_SSB_CRMSYSTEM_CONTACT_ID ON #Ticketing (SSB_CRMSYSTEM_CONTACT_ID)
CREATE NONCLUSTERED INDEX IX_TicketBuyerType ON #Ticketing (TicketBuyerType)

/*=============================================================================================================
												 UPDATES
=============================================================================================================*/

UPDATE contact 
SET SSID_Winner										= dc.SSID
   ,contact.new_ssbcrmsystemssidwinnersourcesystem	= dc.SourceSystem
   ,contact.emailaddress1							= dc.EmailPrimary	
   ,contact.emailaddress2							= dc.EmailOne		
   ,contact.emailaddress3							= dc.EmailTwo		
   ,contact.mobilephone								= dc.PhoneCell		
   ,contact.telephone2								= dc.PhoneBusiness	
FROM dbo.contact_custom contact
	JOIN dbo.vwCompositeRecord_ModAcctID dc ON dc.SSB_CRMSYSTEM_CONTACT_ID = Contact.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
				Current STH
==========================================*/

UPDATE c
SET New_CurrentSTH = 0
FROM dbo.contact_custom c

UPDATE c
SET New_CurrentSTH = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE SeasonYear = @CurrentYear 
				and TicketBuyerType = 'Season'
		 )sth on sth.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
					Group
==========================================*/

UPDATE c
SET New_GroupBuyer = 0
FROM dbo.contact_custom c

UPDATE c
SET New_GroupBuyer = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE SeasonYear = @CurrentYear 
				and TicketBuyerType = 'Group'
		 )grp on grp.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
					MINI
==========================================*/

UPDATE c
SET New_MiniBuyer = 0
FROM dbo.contact_custom c

UPDATE c
SET New_MiniBuyer = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE SeasonYear = @CurrentYear 
				and TicketBuyerType = 'Mini'
		 )single on single.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
			Non Ticket Buyer
==========================================*/

UPDATE c
SET New_NonTicketBuyer = 0
FROM dbo.contact_custom c

UPDATE c
SET New_NonTicketBuyer = 1
FROM dbo.contact_custom c
	LEFT JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
			   FROM #ticketing 
			  )x on x.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID
WHERE x.SSB_CRMSYSTEM_CONTACT_ID IS NULL

/*==========================================
				 Prior STH
==========================================*/

UPDATE c
SET New_PriorSTH = 0
FROM dbo.contact_custom c

UPDATE c
SET New_PriorSTH = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE seasonYear < @CurrentYear 
				and TicketBuyerType = 'Season'
		 )sth on sth.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
				Renewed CY
==========================================*/

UPDATE c
SET New_RenewedCY = 0
FROM dbo.contact_custom c

UPDATE c
SET New_RenewedCY = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE SeasonYear = @CurrentYear 
				and IsRenewal = 1
		 )sth on sth.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
				Rooke STH
==========================================*/

UPDATE c
SET New_RookieSTH = 0
FROM dbo.contact_custom c

UPDATE c
SET New_RookieSTH = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE SeasonYear = @CurrentYear 
				and TicketBuyerType = 'Season'
		 )cy on cy.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID
	LEFT JOIN ( Select distinct SSB_CRMSYSTEM_CONTACT_ID 
				FROM #ticketing 
				WHERE seasonYear < @CurrentYear
					and TicketBuyerType = 'Season'
			  )py on py.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID
where py.SSB_CRMSYSTEM_CONTACT_ID IS NULL

/*==========================================
				Single Game
==========================================*/

UPDATE c
SET New_SingleBuyer = 0
FROM dbo.contact_custom c

UPDATE c
SET New_SingleBuyer = 1
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID 
		  FROM #ticketing 
		  WHERE SeasonYear = @CurrentYear 
				and TicketBuyerType = 'Single'
		 )sth on sth.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID


/*==========================================
			Ticket Buyer Type
==========================================*/

UPDATE c
SET New_TicketBuyerType = BuyerType.TicketBuyerType
FROM dbo.contact_custom c
	JOIN (Select distinct SSB_CRMSYSTEM_CONTACT_ID, TicketBuyerType	
		  FROM #ticketing 
		  WHERE BuyerTypeRank = 1
		 )BuyerType on BuyerType.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID

/*==========================================
			  Turnkey Fields
==========================================*/

UPDATE c
SET  New_Turnkey_Age				 =  CASE WHEN AgeInTwoYearIncrements_InputIndividual = 'Age greater than 99' THEN 99
											 ELSE NULLIF(TRY_CAST(SUBSTRING(ta.AgeInTwoYearIncrements_InputIndividual,5,2) AS INT),0) 
										END
	,New_Turnkey_ChildrenPresent	 = ta.PresenceofChildren
	,New_Turnkey_DiscretionaryIncome = ta.DiscretionaryIncomeIndex
	,New_Turnkey_Gender				 = ta.Gender_InputIndividual
	,New_Turnkey_HouseholdIncome	 = ta.Income_EstimatedHousehold
	,New_Race						 = NULLIF(ta.RaceCode,'')
FROM dbo.contact_custom c
	JOIN (  SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID
				  ,ta.*
				  ,RANK() OVER(Partition By SSB_CRMSYSTEM_CONTACT_ID ORDER BY ta.ETL_UpdatedDate DESC, ta.ETL_CreatedDate	DESC, ta.ProspectID) Priority
			FROM dimcustomerssbid ssbid
			JOIN jaguars.[ods].[Turnkey_Acxiom] ta on ssbid.ssid = CONCAT(ta.abilitecID,':',ta.ProspectID)
			WHERE	ETL_IsDeleted = 0
		 )ta  on ta.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID
where ta.Priority = 1

/*==========================================
			  Ticketing Fields
==========================================*/


UPDATE c
SET c.New_NumTickets_CY			= ticketing.NumTickets_CY      
   ,c.New_NumEvents_CY			= ticketing.NumEvents_CY       
   ,c.New_TicketsPerEvent_CY	= ticketing.TicketsPerEvent_CY 
   ,c.New_TotalSpend_CY			= ticketing.TotalSpend_CY      
   ,c.New_AvgSpend_CY			= ticketing.AvgSpend_CY
   ,c.New_AvgPrice_CY			= ticketing.AvgPrice_CY
   ,c.New_NumTickets_PY			= ticketing.NumTickets_PY      
   ,c.New_NumEvents_PY			= ticketing.NumEvents_PY       
   ,c.New_TicketsPerEvent_PY	= ticketing.TicketsPerEvent_PY 
   ,c.New_TotalSpend_PY			= ticketing.TotalSpend_PY      
   ,c.New_AvgSpend_PY			= ticketing.AvgSpend_PY
   ,c.New_AvgPrice_PY			= ticketing.AvgPrice_PY
   ,c.New_NumTickets_PY2		= ticketing.NumTickets_PY2		 --"PY2" fields are lifetime totals. business rules were altered after naming convention was created
   ,c.New_NumEvents_PY2			= ticketing.NumEvents_PY2      	 --"PY2" fields are lifetime totals. business rules were altered after naming convention was created
   ,c.New_TicketsPerEvent_PY2	= ticketing.TicketsPerEvent_PY2	 --"PY2" fields are lifetime totals. business rules were altered after naming convention was created
   ,c.New_TotalSpend_PY2		= ticketing.TotalSpend_PY2     	 --"PY2" fields are lifetime totals. business rules were altered after naming convention was created
   ,c.New_AvgSpend_PY2			= ticketing.AvgSpend_PY2		 --"PY2" fields are lifetime totals. business rules were altered after naming convention was created
   ,c.New_AvgPrice_PY2			= ticketing.AvgPrice_PY2		 --"PY2" fields are lifetime totals. business rules were altered after naming convention was created
FROM dbo.contact_custom c
	JOIN (
			SELECT SSB_CRMSYSTEM_CONTACT_ID
				  ,SUM(CASE WHEN SeasonYear = @CurrentYear THEN QTY END)																			AS NumTickets_CY                     
				  ,SUM(CASE WHEN SeasonYear = @CurrentYear THEN NumEvents END)																		AS NumEvents_CY                 
				  ,1.0*SUM(CASE WHEN SeasonYear = @CurrentYear THEN QTY END)/NULLIF(SUM(CASE WHEN SeasonYear = @CurrentYear THEN NumEvents END),0)	AS TicketsPerEvent_CY                 
				  ,SUM(CASE WHEN SeasonYear = @CurrentYear THEN REV END)																			AS TotalSpend_CY                 
				  ,1.0*SUM(CASE WHEN SeasonYear = @CurrentYear THEN REV END)/NULLIF(SUM(CASE WHEN SeasonYear = @CurrentYear THEN NumEvents END),0)	AS AvgSpend_CY
				  ,1.0*SUM(CASE WHEN SeasonYear = @CurrentYear THEN REV END)/NULLIF(SUM(CASE WHEN SeasonYear = @CurrentYear THEN QTY END),0)		AS AvgPrice_CY
				  ,SUM(CASE WHEN SeasonYear = @PriorYear THEN QTY END)																				AS NumTickets_PY                     
				  ,SUM(CASE WHEN SeasonYear = @PriorYear THEN NumEvents END)																		AS NumEvents_PY                 
				  ,1.0*SUM(CASE WHEN SeasonYear = @PriorYear THEN QTY END)/NULLIF(SUM(CASE WHEN SeasonYear = @PriorYear THEN NumEvents END),0)		AS TicketsPerEvent_PY                 
				  ,SUM(CASE WHEN SeasonYear = @PriorYear THEN REV END)																				AS TotalSpend_PY                 
				  ,1.0*SUM(CASE WHEN SeasonYear = @PriorYear THEN REV END)/NULLIF(SUM(CASE WHEN SeasonYear = @PriorYear THEN NumEvents END),0)		AS AvgSpend_PY
				  ,1.0*SUM(CASE WHEN SeasonYear = @PriorYear THEN REV END)/NULLIF(SUM(CASE WHEN SeasonYear = @PriorYear THEN QTY END),0)			AS AvgPrice_PY
				  ,SUM(QTY)																															AS NumTickets_PY2                     
				  ,SUM(NumEvents)																													AS NumEvents_PY2                 
				  ,1.0*SUM(QTY)/NULLIF(SUM(NumEvents),0)																							AS TicketsPerEvent_PY2                 
				  ,SUM(REV)																															AS TotalSpend_PY2                 
				  ,1.0*SUM(REV)/NULLIF(SUM(NumEvents),0)																							AS AvgSpend_PY2
				  ,1.0*SUM(REV)/NULLIF(SUM(NumEvents),0)																							AS AvgPrice_PY2
			FROM (
					SELECT SSB_CRMSYSTEM_CONTACT_ID
						  ,SeasonYear
						  ,SUM(QTY) QTY
						  ,COUNT(DISTINCT dimEventID) NumEvents
						  ,SUM(REV) REV
					FROM #ticketing
					GROUP BY SSB_CRMSYSTEM_CONTACT_ID
						  ,SeasonYear
				 )x
			GROUP BY SSB_CRMSYSTEM_CONTACT_ID
		  ) ticketing ON ticketing.SSB_CRMSYSTEM_CONTACT_ID = c.SSB_CRMSYSTEM_CONTACT_ID




--Primary TM ID
UPDATE a 
SET  new_ssb_primaryarchticsid = ma.AccountId
FROM contact_custom a
INNER JOIN dbo.vwCompositeRecord_ModAcctID ma
ON ma.SSB_CRMSYSTEM_CONTACT_ID = a.SSB_CRMSYSTEM_CONTACT_ID AND ma.SourceSystem = 'tm' AND ma.CustomerType = 'primary'



UPDATE dbo.Contact_Custom
SET TM_Ids =  LEFT(TM_Ids,CHARINDEX(',',TM_Ids,490)-1)
FROM dbo.Contact_Custom
WHERE LEN(TM_Ids) > 500

EXEC [dbo].[sp_CRMLoad_Contact_ProcessLoad_Criteria]




DROP TABLE #Ticketing



GO
