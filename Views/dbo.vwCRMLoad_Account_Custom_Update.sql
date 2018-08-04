SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO










CREATE VIEW [dbo].[vwCRMLoad_Account_Custom_Update]
AS

SELECT  z.[crm_id] Accountid
, SSID_Winner new_ssbcrmsystemssidwinner													  --,c.new_ssbcrmsystemssidwinner
, DimCustIDs new_ssbcrmsystemdimcustomerids													  --,c.new_ssbcrmsystemdimcustomerids
, b.TM_Ids str_number																		  --,c.str_number
, b.new_ssbcrmsystemssidwinnersourcesystem													  --,c.new_ssbcrmsystemssidwinnersourcesystem
, NULLIF(b.emailaddress1,'') emailaddress1													  --,c.emailaddress1
, b.telephone2																				  --,c.telephone2
, b.new_ssb_primaryarchticsid																  --,c.new_ssb_primaryarchticsid


	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.SSID_Winner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS nVARCHAR(MAX)))),'')) 											   then 1 else 0 end as new_ssbcrmsystemssidwinner
	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS nVARCHAR(MAX)))),'')) 										   then 1 else 0 end as new_ssbcrmsystemdimcustomerids
	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.TM_Ids)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_number AS nVARCHAR(MAX)))),''))																	   then 1 else 0 end as str_number
	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinnersourcesystem)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinnersourcesystem AS nVARCHAR(MAX)))),''))		   then 1 else 0 end as new_ssbcrmsystemssidwinnersourcesystem
	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(NULLIF(b.emailaddress1,''))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress1 AS nVARCHAR(MAX)))),''))											   then 1 else 0 end as emailaddress1
	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.telephone2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS nVARCHAR(MAX)))),''))																   then 1 else 0 end as telephone2
	--,case when  HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssb_primaryarchticsid)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssb_primaryarchticsid AS nVARCHAR(MAX)))),''))								   then 1 else 0 end as new_ssb_primaryarchticsid
-- SELECT *																																																						   
-- SELECT COUNT(*) 
FROM dbo.[Account_Custom] b 
INNER JOIN dbo.Account z ON b.SSB_CRMSYSTEM_Acct_ID = z.[SSB_CRMSYSTEM_Acct_ID]
--INNER JOIN  dbo.temp_initialdataset temp ON temp.ssb_crmsystem_Account_id = b.SSB_CRMSYSTEM_Account_ID
LEFT JOIN  prodcopy.vw_Account c ON z.[crm_id] = c.AccountID
WHERE z.[SSB_CRMSYSTEM_Acct_ID] <> z.[crm_id]
AND  (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.SSID_Winner)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinner AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.DimCustIDs)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemdimcustomerids AS nVARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.TM_Ids)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.str_number AS nVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssbcrmsystemssidwinnersourcesystem)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssbcrmsystemssidwinnersourcesystem AS nVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(NULLIF(b.emailaddress1,''))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.emailaddress1 AS nVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.telephone2)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.telephone2 AS nVARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(b.new_ssb_primaryarchticsid)),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST(c.new_ssb_primaryarchticsid AS nVARCHAR(MAX)))),''))
	)



	





GO
