SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vwCRMLoad_Contact_Custom_Update_DEV]
AS

SELECT  z.[crm_id] contactid
, SSID_Winner new_ssbcrmsystemssidwinner
, DimCustIDs new_ssbcrmsystemdimcustomerids
, b.TM_Ids [new_ssbcrmsystemarchticsids]
, b.AccountId [str_number]																										  --,c.[str_number]
, b.MDMProcess_UpdatedDate																										  --
, CASE WHEN b.New_Turnkey_ChildrenPresent = 'No Children Present' THEN 0 														  --
	WHEN b.New_Turnkey_ChildrenPresent = 'Child(ren) Present' THEN 1 															  --
	ELSE NULL END AS str_externalchildrenpresent																				  --,c.str_externalchildrenpresent
, b.New_Turnkey_DiscretionaryIncome AS str_externaldii																			  --,c.str_externaldii
, b.New_Turnkey_Age AS str_externalage																							  --,c.str_externalage
, CASE WHEN  b.New_Turnkey_Gender = 'Male' THEN 1 																				  --
	WHEN b.New_Turnkey_Gender = 'Female' THEN 2 																				  --
	ELSE NULL END AS gendercode																									  --,c.gendercode
, ISNULL(b.New_Turnkey_HouseholdIncome, c.str_externalhouseholdincome) str_externalhouseholdincome								  --,c.str_externalhouseholdincome
, b.New_CurrentSTH AS str_clientstm 																							  --,c.str_clientstm
, b.New_RookieSTH AS str_clientrookiestm																						  --,c.str_clientrookiestm
, b.New_PriorSTH AS str_clientpaststm																							  --,c.str_clientpaststm
, b.New_TicketBuyerType AS str_clientticketbuyertype																			  --,c.str_clientticketbuyertype
, b.New_RenewedCY AS str_clientrenewedcurrentyear																				  --,c.str_clientrenewedcurrentyear
, b.New_MiniBuyer AS str_clientminipackbuyer																					  --,c.str_clientminipackbuyer
, b.New_SingleBuyer AS str_clientsinglegameticketbuyer																			  --,c.str_clientsinglegameticketbuyer
, b.New_GroupBuyer AS str_clientgroupbuyer																						  --,c.str_clientgroupbuyer
, b.New_NonTicketBuyer AS str_clientnonticketbuyer																				  --,c.str_clientnonticketbuyer
, b.New_NumTickets_CY AS str_ticketnumbertotalthis																				  --,c.str_ticketnumbertotalthis
, b.New_NumEvents_CY AS str_ticketeventtotalthis																				  --,c.str_ticketeventtotalthis
, b.New_TicketsPerEvent_CY AS str_ticketnumberaveragethis																		  --,c.str_ticketnumberaveragethis
, b.New_TotalSpend_CY AS str_ticketspendtotalthis																				  --,c.str_ticketspendtotalthis
, b.New_AvgSpend_CY AS str_ticketpriceaveragethis																				  --,c.str_ticketpriceaveragethis
, b.New_AvgPrice_CY AS str_ticketspendaveragethis																				  --,c.str_ticketspendaveragethis
, b.New_NumTickets_PY AS str_ticketnumbertotallast																				  --,c.str_ticketnumbertotallast
, b.New_NumEvents_PY AS str_ticketeventtotallast																				  --,c.str_ticketeventtotallast
, b.New_TicketsPerEvent_PY AS str_ticketnumberaveragelast																		  --,c.str_ticketnumberaveragelast
, b.New_TotalSpend_PY AS str_ticketspendtotallast																				  --,c.str_ticketspendtotallast
, b.New_AvgSpend_PY AS str_ticketspendaveragelast																				  --,c.str_ticketspendaveragelast
, b.New_AvgPrice_PY AS str_ticketpriceaveragelast																				  --,c.str_ticketpriceaveragelast
, b.New_NumTickets_PY2 AS str_ticketnumbertotalall																				  --,c.str_ticketnumbertotalall
, b.New_NumEvents_PY2 AS str_ticketeventtotalall																				  --,c.str_ticketeventtotalall
, b.New_TicketsPerEvent_PY2 AS str_ticketnumberaverageall																		  --,c.str_ticketnumberaverageall
, b.New_TotalSpend_PY2 AS str_ticketspendtotalall																				  --,c.str_ticketspendtotalall
, b.New_AvgSpend_PY2 AS str_ticketspendaverageall																				  --,c.str_ticketspendaverageall
, b.New_AvgPrice_PY2 AS str_ticketpriceaverageall																				  --,c.str_ticketpriceaverageall
, b.new_ssbcrmsystemssidwinnersourcesystem																						  --,c.new_ssbcrmsystemssidwinnersourcesystem
, COALESCE(NULLIF(b.emailaddress1	,''),c.emailaddress1)	AS emailaddress1													  --,c.emailaddress1
, COALESCE(NULLIF(b.emailaddress2	,''),c.emailaddress2)	AS emailaddress2													  --,c.emailaddress2
, COALESCE(NULLIF(b.emailaddress3	,''),c.emailaddress3)	AS emailaddress3													  --,c.emailaddress3
, COALESCE(NULLIF(b.mobilephone		,''),c.mobilephone	)	AS mobilephone														  --,c.mobilephone
, COALESCE(NULLIF(b.telephone2	 	,''),c.telephone2	)	AS telephone2														  --,c.telephone2
, b.new_ssb_primaryarchticsid																									  --,c.new_ssb_primaryarchticsid
, b.new_race

--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.SSID_Winner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 		  then 1 else 0 end as new_ssbcrmsystemssidwinner
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 		  then 1 else 0 end as new_ssbcrmsystemdimcustomerids
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.TM_Ids)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[new_ssbcrmsystemarchticsids] AS VARCHAR(MAX)))),''))		  then 1 else 0 end as [new_ssbcrmsystemarchticsids]
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[str_number] AS VARCHAR(MAX)))),''))		  then 1 else 0 end as [str_number]
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CASE WHEN b.New_Turnkey_ChildrenPresent = 'No Children Present' THEN 0 WHEN b.New_Turnkey_ChildrenPresent = 'Child(ren) Present' THEN 1 ELSE NULL END)),0) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalchildrenpresent AS int))),0))		  then 1 else 0 end as str_externalchildrenpresent
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_DiscretionaryIncome)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externaldii AS NVARCHAR(MAX)))),''))							  then 1 else 0 end as str_externaldii
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_Age)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalage AS NVARCHAR(MAX)))),''))			  then 1 else 0 end as str_externalage
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CASE WHEN  b.New_Turnkey_Gender = 'Male' THEN 1 WHEN b.New_Turnkey_Gender = 'Female' THEN 2 ELSE NULL END)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.gendercode AS INT))),''))											  then 1 else 0 end as gendercode
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_HouseholdIncome)),c.str_externalhouseholdincome) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalhouseholdincome AS nVARCHAR(MAX)))),''))					then 1 else 0 end as str_externalhouseholdincome
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_CurrentSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientstm  AS BIT))),''))						  then 1 else 0 end as str_clientstm
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_RookieSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientrookiestm AS BIT))),''))							  then 1 else 0 end as str_clientrookiestm
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_PriorSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientpaststm AS BIT))),''))						  then 1 else 0 end as str_clientpaststm
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(b.New_TicketBuyerType AS NVARCHAR(100)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientticketbuyertype AS NVARCHAR(MAX)))),''))		  then 1 else 0 end as str_clientticketbuyertype
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_RenewedCY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientrenewedcurrentyear AS BIT))),''))												  then 1 else 0 end as str_clientrenewedcurrentyear
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_MiniBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientminipackbuyer AS BIT))),''))											  then 1  else 0 end as str_clientminipackbuyer
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_SingleBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientsinglegameticketbuyer AS INT))),''))												  	then 1 else 0 end as str_clientsinglegameticketbuyer
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_GroupBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientgroupbuyer AS INT))),''))										then 1 else 0 end as str_clientgroupbuyer
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NonTicketBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientnonticketbuyer AS BIT))),''))												then 1 else 0 end as str_clientnonticketbuyer
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalthis AS INT))),''))												then 1 else 0 end as str_ticketnumbertotalthis
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketeventtotalthis AS INT))),''))												THEN 1 else 0 end as str_ticketeventtotalthis
--, CASE WHEN	ISNULL(CAST(b.New_TicketsPerEvent_CY AS INT),0)  <> ISNULL(c.str_ticketnumberaveragethis,0)																												   THEN 1 ELSE 0 END AS str_ticketnumberaveragethis
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotalthis AS VARCHAR(MAX)))),''))														  then 1 else 0 end as str_ticketspendtotalthis
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaveragethis AS MONEY))),''))													  then 1 else 0 end as str_ticketpriceaveragethis
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaveragethis AS MONEY))),''))													  then 1 else 0 end as str_ticketspendaveragethis
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotallast AS VARCHAR(MAX)))),''))															  then 1 else 0 end as str_ticketnumbertotallast
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketeventtotallast AS VARCHAR(MAX)))),''))														  then 1 else 0 end as str_ticketeventtotallast
--, CASE WHEN	ISNULL(FLOOR(b.New_TicketsPerEvent_PY),0)   <> ISNULL(c.str_ticketnumberaveragelast,0)												  then 1 else 0 end as str_ticketnumberaveragelast
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotallast AS MONEY))),''))								  then 1 else 0 end as str_ticketspendtotallast
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaveragelast AS MONEY))),''))								  then 1 else 0 end as str_ticketspendaveragelast
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaveragelast AS MONEY))),''))								  then 1 else 0 end as str_ticketpriceaveragelast
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalall AS INT))),''))							  then 1 else 0 end as str_ticketnumbertotalall
--, CASE WHEN	ISNULL(b.New_NumEvents_PY2,'')   <> ISNULL(c.str_ticketeventtotalall,'')																												  then 1 else 0 end as str_ticketeventtotalall
--, CASE WHEN	ISNULL(CAST(b.New_TicketsPerEvent_PY2 AS INT),0)  <> ISNULL(c.str_ticketnumberaverageall,0)																								  then 1 else 0 end as str_ticketnumberaverageall
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotalall AS MONEY))),''))								  then 1 else 0 end as str_ticketspendtotalall
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(NULLIF(c.str_ticketspendaverageall,0) AS MONEY))),''))								  then 1 else 0 end as str_ticketspendaverageall
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(NULLIF(c.str_ticketpriceaverageall,0) AS MONEY))),''))									  then 1 else 0 end as str_ticketpriceaverageall
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinnersourcesystem)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinnersourcesystem AS NVARCHAR(MAX)))),''))									  then 1 else 0 end as new_ssbcrmsystemssidwinnersourcesystem
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress1)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress1 AS NVARCHAR(MAX)))),''))								  then 1 else 0 end as emailaddress1
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.mobilephone)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.mobilephone AS NVARCHAR(MAX)))),''))							  then 1 else 0 end as mobilephone
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.telephone2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS NVARCHAR(MAX)))),''))						  then 1 else 0 end as telephone2
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress2 AS NVARCHAR(MAX)))),''))								  then 1 else 0 end as emailaddress2
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress3)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress3 AS NVARCHAR(MAX)))),''))									  then 1 else 0 end as emailaddress3
--, CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssb_primaryarchticsid)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssb_primaryarchticsid AS NVARCHAR(MAX)))),''))								  then 1 else 0 end as new_ssb_primaryarchticsid
	
	
--	SELECT SUM( CASE WHEN	HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.SSID_Winner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),''))																																													  then 1 else 0 end) as new_ssbcrmsystemssidwinner
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 																																											  then 1 else 0 end) as new_ssbcrmsystemdimcustomerids
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.TM_Ids)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[new_ssbcrmsystemarchticsids] AS VARCHAR(MAX)))),''))																																											  then 1 else 0 end) as [new_ssbcrmsystemarchticsids]
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[str_number] AS VARCHAR(MAX)))),''))																																																  then 1 else 0 end) as [str_number]
----,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CASE WHEN b.New_Turnkey_ChildrenPresent = 'No Children Present' THEN 0 WHEN b.New_Turnkey_ChildrenPresent = 'Child(ren) Present' THEN 1 ELSE NULL end)),0) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalchildrenpresent AS bit))),''))												  then 1 else 0 end) as str_externalchildrenpresent
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_DiscretionaryIncome)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externaldii AS NVARCHAR(100)))),''))																																										  then 1 else 0 end) as str_externaldii
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_Age)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalage AS NVARCHAR(100)))),''))																																														then 1 else 0 end) as str_externalage
----,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CASE WHEN  b.New_Turnkey_Gend)er = 'Male' THEN 1 WHEN b.New_Turnkey_Gend)er = 'Female' THEN 2 ELSE NULL end),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.gend)ercode AS int))),''))																																	  then 1 else 0 end) as gend)ercode
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_HouseholdIncome)),c.str_externalhouseholdincome) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalhouseholdincome AS NVARCHAR(MAX)))),''))																															  then 1 else 0 end) as str_externalhouseholdincome
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_CurrentSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientstm  AS bit))),''))																																																  then 1 else 0 end) as str_clientstm
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_RookieSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientrookiestm AS bit))),''))																																																  then 1 else 0 end) as str_clientrookiestm
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_PriorSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientpaststm AS bit))),''))																																																  then 1 else 0 end) as str_clientpaststm
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TicketBuyerType)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientticketbuyertype AS NVARCHAR(MAX)))),''))																																														  then 1 else 0 end) as str_clientticketbuyertype
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_RenewedCY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientrenewedcurrentyear AS bit))),''))																																														  then 1 else 0 end) as str_clientrenewedcurrentyear
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_MiniBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientminipackbuyer AS bit))),''))																																														  then 1  else 0 end) as str_clientminipackbuyer
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_SingleBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientsinglegameticketbuyer AS int))),''))																																													  	then 1 else 0 end) as str_clientsinglegameticketbuyer
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_GroupBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientgroupbuyer AS int))),''))																																																	then 1 else 0 end) as str_clientgroupbuyer
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NonTicketBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientnonticketbuyer AS bit))),''))																																																	then 1 else 0 end) as str_clientnonticketbuyer
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalthis AS int))),''))																																																	then 1 else 0 end) as str_ticketnumbertotalthis
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketeventtotalthis AS int))),''))																																																	THEN 1 else 0 end) as str_ticketeventtotalthis
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TicketsPerEvent_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumberaveragethis AS DECIMAL(28,0)))),''))																																														  then 1 else 0 end) as str_ticketnumberaveragethis
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotalthis AS VARCHAR(MAX)))),''))																																														  then 1 else 0 end) as str_ticketspendtotalthis
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaveragethis AS money))),''))																																														  then 1 else 0 end) as str_ticketpriceaveragethis
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaveragethis AS money))),''))																																														  then 1 else 0 end) as str_ticketspendaveragethis
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotallast AS VARCHAR(MAX)))),''))																																														  then 1 else 0 end) as str_ticketnumbertotallast
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketeventtotallast AS VARCHAR(MAX)))),''))																																														  then 1 else 0 end) as str_ticketeventtotallast
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TicketsPerEvent_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumberaveragelast AS DECIMAL(28,0)))),''))																																														  then 1 else 0 end) as str_ticketnumberaveragelast
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotallast AS money))),''))																																														  then 1 else 0 end) as str_ticketspendtotallast
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaveragelast AS money))),''))																																														  then 1 else 0 end) as str_ticketspendaveragelast
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaveragelast AS money))),''))																																														  then 1 else 0 end) as str_ticketpriceaveragelast
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalall AS int))),''))																																														  then 1 else 0 end) as str_ticketnumbertotalall
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalall AS int))),''))																																														  then 1 else 0 end) as str_ticketeventtotalall
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TicketsPerEvent_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumberaverageall AS DECIMAL(28,0)))),''))																																														  then 1 else 0 end) as str_ticketnumberaverageall
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotalall AS money))),''))																																														  then 1 else 0 end) as str_ticketspendtotalall
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaverageall AS money))),''))																																														  then 1 else 0 end) as str_ticketspendaverageall
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaverageall AS money))),''))																																														  then 1 else 0 end) as str_ticketpriceaverageall
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinnersourcesystem)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinnersourcesystem AS NVARCHAR(MAX)))),''))																																							  then 1 else 0 end) as new_ssbcrmsystemssidwinnersourcesystem
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress1)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress1 AS NVARCHAR(MAX)))),''))																																																				  then 1 else 0 end) as emailaddress1
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.mobilephone)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.mobilephone AS NVARCHAR(MAX)))),''))																																																				  then 1 else 0 end) as mobilephone
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.telephone2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS NVARCHAR(MAX)))),''))																																																				  then 1 else 0 end) as telephone2
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress2 AS NVARCHAR(MAX)))),''))																																																				  then 1 else 0 end) as emailaddress2
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress3)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress3 AS NVARCHAR(MAX)))),''))																																																				  then 1 else 0 end) as emailaddress3
--,sum( CASE WHEN			HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssb_primaryarchticsid)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssb_primaryarchticsid AS NVARCHAR(MAX)))),''))																																														  then 1 else 0 end) as new_ssb_primaryarchticsid																																																										   
																																																											   
-- SELECT *
-- SELECT COUNT(*) 
FROM dbo.[Contact_Custom] b 
INNER JOIN dbo.Contact z ON b.SSB_CRMSYSTEM_CONTACT_ID = z.[SSB_CRMSYSTEM_CONTACT_ID]
--INNER JOIN  dbo.temp_initialdataset temp ON temp.ssb_crmsystem_contact_id = b.SSB_CRMSYSTEM_CONTACT_ID
LEFT JOIN  prodcopy.vw_contact c ON z.[crm_id] = c.contactID
WHERE z.[SSB_CRMSYSTEM_CONTACT_ID] <> z.[crm_id]
AND  (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.SSID_Winner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.TM_Ids)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[new_ssbcrmsystemarchticsids] AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.AccountId)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.[str_number] AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CASE WHEN b.New_Turnkey_ChildrenPresent = 'No Children Present' THEN 0 WHEN b.New_Turnkey_ChildrenPresent = 'Child(ren) Present' THEN 1 ELSE NULL END)),0) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalchildrenpresent AS INT))),0))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_DiscretionaryIncome)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externaldii AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_Age)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalage AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CASE WHEN  b.New_Turnkey_Gender = 'Male' THEN 1 WHEN b.New_Turnkey_Gender = 'Female' THEN 2 ELSE NULL END)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.gendercode AS INT))),''))	
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_Turnkey_HouseholdIncome)),c.str_externalhouseholdincome) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_externalhouseholdincome AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_CurrentSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientstm  AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_RookieSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientrookiestm AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_PriorSTH)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientpaststm AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(b.New_TicketBuyerType AS NVARCHAR(100)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientticketbuyertype AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_RenewedCY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientrenewedcurrentyear AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_MiniBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientminipackbuyer AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_SingleBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientsinglegameticketbuyer AS INT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_GroupBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientgroupbuyer AS INT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NonTicketBuyer)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_clientnonticketbuyer AS BIT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalthis AS INT))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketeventtotalthis AS INT))),''))
	OR ISNULL(CAST(b.New_TicketsPerEvent_CY AS INT),0)  <> ISNULL(c.str_ticketnumberaveragethis,0)
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotalthis AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaveragethis AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_CY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaveragethis AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotallast AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumEvents_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketeventtotallast AS VARCHAR(MAX)))),''))
	OR ISNULL(FLOOR(b.New_TicketsPerEvent_PY),0)   <> ISNULL(c.str_ticketnumberaveragelast,0)
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotallast AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendaveragelast AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_PY)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketpriceaveragelast AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_NumTickets_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketnumbertotalall AS INT))),''))
	OR ISNULL(b.New_NumEvents_PY2,'')   <> ISNULL(c.str_ticketeventtotalall,'')
	OR ISNULL(CAST(b.New_TicketsPerEvent_PY2 AS INT),0)  <> ISNULL(c.str_ticketnumberaverageall,0)
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_TotalSpend_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_ticketspendtotalall AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgSpend_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(NULLIF(c.str_ticketspendaverageall,0) AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.New_AvgPrice_PY2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(NULLIF(c.str_ticketpriceaverageall,0) AS MONEY))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinnersourcesystem)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinnersourcesystem AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress1)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress1 AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.mobilephone)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.mobilephone AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.telephone2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress2 AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.emailaddress3)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress3 AS NVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssb_primaryarchticsid)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssb_primaryarchticsid AS NVARCHAR(MAX)))),''))
	OR ISNULL(b.new_race,'') != ISNULL(c.new_race,'')
	
	)





GO
