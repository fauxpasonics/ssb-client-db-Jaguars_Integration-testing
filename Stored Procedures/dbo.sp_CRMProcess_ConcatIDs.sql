SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[sp_CRMProcess_ConcatIDs] -- 'contact'
@ObjectType VARCHAR(50)
AS

--DECLARE @ObjectType varchar(50) SET @ObjectType = 'contact'


/*
EXEC [dbo].[sp_CRMProcess_ConcatIDs] 'Account'
Select * from wrk.customerWorkingList
EXEC [dbo].[sp_CRMProcess_ConcatIDs] 'Contact'
Select * from stg.Contact
*/

SELECT        CASE WHEN @ObjectType = 'Account' THEN SSB_CRMSYSTEM_ACCT_ID ELSE [SSB_CRMSYSTEM_CONTACT_ID] END GUID, CAST(DimCustomerId AS VARCHAR(100)) AS DimCustomerID, CAST(SSID AS VARCHAR(50)) AS SSID, accountid AS accountid
, a.SourceSystem
INTO #tmpDimCustIDs
--DROP table #tmpDimCustIDs
FROM            dbo.vwDimCustomer_ModAcctId AS a-- where [SSB_CRMSYSTEM_CONTACT_ID] is null
WHERE        (1 = 1) 
AND a.[SSB_CRMSYSTEM_Contact_ID] IN (SELECT SSB_CRMSYSTEM_Contact_ID FROM dbo.contact)
AND SourceSystem NOT LIKE '%SFDC%' AND SourceSystem NOT LIKE '%CRM%'


TRUNCATE TABLE stg.tbl_CRMProcess_NonWinners

INSERT INTO [stg].tbl_CRMProcess_NonWinners
        ( [GUID] ,
          [DimCustomerID] ,
          [SourceSystem] ,
          [SSID],
		  CustomID1
        )
SELECT GUID, a.DimCustomerID, a.[SourceSystem], CAST(a.SSID as varchar(50)) AS SSID, b.AccountId CustomID1
FROM #tmpDimCustIDs a 
INNER JOIN dbo.[vwDimCustomer_ModAcctId] b ON [b].[DimCustomerId] = [a].[DimCustomerID]
WHERE 1=1
--AND [a].[SSB_CRMSYSTEM_ACCT_ID] = '7509A514-BB5F-42E7-8891-2EB8A1399ED3'

TRUNCATE TABLE stg.[tbl_CRMProcess_ConcatIDs]

INSERT INTO stg.tbl_CRMProcess_ConcatIDs (GUID, ConcatIDs1, ConcatIDs2, ConcatIDs3, ConcatIDs4, ConcatIDs5, DimCust_ConcatIDs)
SELECT [GUID]
,ISNULL(LEFT(STUFF((    SELECT  ', ' + TM.SSID  AS [text()]
FROM stg.tbl_CRMProcess_NonWinners TM
WHERE TM.[GUID] = z.[GUID] AND tm.[SourceSystem] = 'TM'
ORDER BY SSID
FOR XML PATH('')), 1, 1, ''),8000),'') AS ConcatIDs1
,ISNULL(LEFT(STUFF((    SELECT  DISTINCT ', ' + CustomID1  AS [text()]
FROM stg.tbl_CRMProcess_NonWinners acct
WHERE acct.[GUID] = z.[GUID] AND acct.[SourceSystem] = 'TM'
ORDER BY ', ' + CustomID1
FOR XML PATH('')), 1, 1, ''),8000),'') AS ConcatIDs2
, '' AS ConcatIDs3
, '' ConcatIDs4
, '' ConcatIDs5
,LEFT(STUFF((    SELECT  ', ' + DimCustomerID  AS [text()]
FROM #tmpDimCustIDs DimCust
WHERE DimCust.GUID = z.GUID
ORDER BY [DimCustomerID]
FOR XML PATH('')), 1, 1, '' ),8000) as DimCustID_LoserString
--INTO #tmpA
FROM (SELECT DISTINCT GUID FROM [stg].tbl_CRMProcess_NonWinners
--WHERE GUID IN ('000001EC-E616-49AE-981A-A9B82F293D8B')
) z
-- Drop Table #LoserSSIDs
-- SELECT * FROM #tmpA Where Len(ConcatIDs1) > 8000
--SELECT * FROM stg.[tbl_CRMProcess_ConcatIDs] WHERE GUID = '4EAEED5A-E90E-4733-9AD5-07B1AF6E9724'

IF @ObjectType = 'Account'
UPDATE a
SET TM_Ids = ISNULL(LTRIM([b].[ConcatIDs1]),'')
--, Account_Ids = ISNULL(LTRIM([b].[ConcatIDs2]),'')
, DimCustIDs = ISNULL(LTRIM([b].[DimCust_ConcatIDs]),'')
-- SELECT b.* 
FROM dbo.Account_Custom a
INNER JOIN stg.[tbl_CRMProcess_ConcatIDs] b ON a.SSB_CRMSYSTEM_ACCT_ID = b.GUID

IF @ObjectType = 'Contact'
UPDATE a
SET TM_Ids = ISNULL(LTRIM([b].[ConcatIDs1]),'')
, [a].AccountId = ISNULL(LTRIM([b].[ConcatIDs2]),'')
, DimCustIDs = ISNULL(LTRIM([b].[DimCust_ConcatIDs]),'')
-- SELECT b.* 
FROM dbo.[Contact_Custom] a
INNER JOIN stg.[tbl_CRMProcess_ConcatIDs] b ON a.[SSB_CRMSYSTEM_CONTACT_ID] = b.GUID


GO
