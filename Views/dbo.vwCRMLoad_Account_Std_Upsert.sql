SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vwCRMLoad_Account_Std_Upsert] AS
SELECT a.new_ssbcrmsystemacctid, Name, address1_line1, address1_city, address1_stateorprovince, address1_postalcode, address1_country, telephone1, LoadType
--SELECT * 
FROM [dbo].[vwCRMLoad_Account_Std_Prep] a
--left join (select new_ssbcrmsystemacctid from coyotes_reporting.prodcopy.contact) b on a.new_ssbcrmsystemacctid = b.new_ssbcrmsystemacctid
WHERE LoadType = 'Upsert'
--and b.new_ssbcrmsystemacctid is null
and a.name is not null

GO
