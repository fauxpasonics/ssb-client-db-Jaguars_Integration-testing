SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO













CREATE VIEW [dbo].[vwCRMLoad_Contact_Std_Upsert] AS
SELECT a.new_ssbcrmsystemacctid, a.new_ssbcrmsystemcontactid, Prefix, FirstName, LastName, Suffix, address1_line1, address1_city, address1_stateorprovince, address1_postalcode, address1_country
, telephone1, LoadType, emailaddress1
FROM [dbo].[vwCRMLoad_Contact_Std_Prep] a
--INNER JOIN [dbo].[temp_initialdataset] ids ON ids.ssb_crmsystem_contact_id = a.new_ssbcrmsystemcontactid
WHERE LoadType = 'Upsert'
AND (firstname IS NOT NULL AND lastname IS NOT NULL)
--and b.new_ssbcrmsystemcontactid is null
AND a.new_ssbcrmsystemcontactid NOT IN (
'3A7F424C-8694-435C-8A9C-4929F80789B0',
'A4B99C16-982A-49B8-891D-13061AE073C3',
'20902451-7D8C-4994-8C4C-AB81B0CBD49E',
'193CA576-C771-4258-BF4D-D07ECBBCE04D',
'1889AA81-A394-488A-AA74-463BCABA8EDD',
'DAE3F98E-71E8-4B57-A5CE-028856393685',
'0401E0CA-8E29-4695-A7E0-65CA32738C4D',
'787ABA44-EA72-4E94-ABAD-1839F52C9C3D',
'C09889C4-0743-4388-8C2C-3DD0C305FA18',
'2567C48F-AEE4-434B-BF92-C61008020A42',
'FC1FEA88-4005-4585-8222-1044D0AFD0FA',
'A688EDF4-15E5-45BE-9224-DE1DAD55E0A9',
'001FA1AB-71EE-4380-88D3-DD804A625A33',
'EAEAC54C-74EB-410E-8B11-572FD623940B',
'DC82D6CF-6D30-4B85-B7E3-E9A940AA8603',
'A0B06EDD-29FC-4EDF-B360-006BE41C4F01',
'67AD92B7-DB8F-4116-A264-9CCC4316EBA9',
'4A53C1A3-C845-4D17-98E1-802A1EFC2F09',
'E06BA495-B9B6-46C9-97A7-84F7862ACE4E',
'CD82C7DE-5867-4CFC-922A-E6347227AF71',
'F572B1BC-5626-47B7-971B-C9519A1120CB')










GO
