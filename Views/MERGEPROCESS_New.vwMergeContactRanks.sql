SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



 
CREATE VIEW [MERGEPROCESS_New].[vwMergeContactRanks]
 
AS
 
SELECT a.SSBID
    , c.contactid ID
    --Add in custom ranking here
    ,ROW_NUMBER() OVER(PARTITION BY SSBID ORDER BY CASE WHEN c.owneridname = 'svc SSBCRMService' THEN 0 
														WHEN c.owneridname = 'CRM CRM' THEN 1
														ELSE 99 END DESC, c.createdon, c.Modifiedon DESC) xRank
FROM MERGEPROCESS_New.DetectedMerges a
JOIN mergeprocess_new.tmp_dimcust b ON a.SSBID = b.SSB_CRMSYSTEM_ACCT_ID 
									   AND b.SourceSystem = 'CRM_Contacts' 
									   AND a.[ObjectType] = 'Contact'
JOIN mergeprocess_new.tmp_pcContact c ON b.SSID = CAST(c.Contactid AS NVARCHAR(100))

WHERE MergeComplete = 0
 
 
GO
