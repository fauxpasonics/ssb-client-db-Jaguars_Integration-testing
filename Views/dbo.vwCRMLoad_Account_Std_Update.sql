SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vwCRMLoad_Account_Std_Update] AS
SELECT 
  p.new_ssbcrmsystemacctid								   --,pca.new_ssbcrmsystemacctid
, p.Name												   --,pca.Name
, p.address1_line1										   --,pca.address1_line1
, p.address1_city										   --,pca.address1_city				
, p.address1_stateorprovince							   --,pca.address1_stateorprovince	
, p.address1_postalcode									   --,pca.address1_postalcode		
, p.address1_country									   --,pca.address1_country			
, ISNULL(p.telephone1,pca.telephone1) telephone1		   --,pca.telephone1				
, p.accountid											   --,pca.accountid					
, p.LoadType											   
FROM [dbo].[vwCRMLoad_Account_Std_Prep] p
LEFT JOIN prodcopy.Account pca 
ON p.accountid = CAST(pca.accountid AS NVARCHAR(100)) --AND pca.statecode = 0
WHERE LoadType = 'Update'
AND (1=2
	OR ISNULL(p.name,'') != ISNULL(pca.name,'')
	OR ISNULL(p.address1_line1			,'') != ISNULL(pca.address1_line1			,'')
	OR ISNULL(p.address1_city			,'') != ISNULL(pca.address1_city			,'')
	OR ISNULL(p.address1_stateorprovince,'') != ISNULL(pca.address1_stateorprovince,'')
	OR ISNULL(p.address1_postalcode		,'') != ISNULL(pca.address1_postalcode		,'')
	--OR ISNULL(p.address1_country		,'') != ISNULL(pca.address1_country		,'')
	OR ISNULL(p.telephone1				,pca.telephone1) != ISNULL(pca.telephone1				,'')
	)

GO
