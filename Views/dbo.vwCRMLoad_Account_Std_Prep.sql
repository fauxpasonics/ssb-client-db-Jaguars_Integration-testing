SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vwCRMLoad_Account_Std_Prep]
AS 
SELECT
	  a.[SSB_CRMSYSTEM_ACCT_ID] new_ssbcrmsystemacctid
      ,[FullName] Name
      ,NULLIF([AddressPrimaryStreet],'') address1_line1
      ,NULLIF([AddressPrimaryCity],'') address1_city
      ,NULLIF([AddressPrimaryState],'') address1_stateorprovince
      ,NULLIF([AddressPrimaryZip],'') address1_postalcode
      ,NULLIF([AddressPrimaryCountry],'') address1_country
      ,NULLIF([Phone],'') telephone1
      ,[crm_id] accountid
	  ,c.[LoadType]
  FROM [dbo].[Account] a 
INNER JOIN dbo.[CRMLoad_Account_ProcessLoad_Criteria] c ON [c].[SSB_CRMSYSTEM_ACCT_ID] = [a].[SSB_CRMSYSTEM_ACCT_ID]
WHERE 1=1



GO
