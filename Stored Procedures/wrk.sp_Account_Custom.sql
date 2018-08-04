SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [wrk].[sp_Account_Custom]
AS


MERGE INTO dbo.Account_Custom Target
USING dbo.Account source
ON source.[SSB_CRMSYSTEM_ACCT_ID] = target.[SSB_CRMSYSTEM_ACCT_ID]
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SSB_CRMSYSTEM_ACCT_ID]) VALUES (Source.[SSB_CRMSYSTEM_ACCT_ID])
WHEN NOT MATCHED BY SOURCE THEN
DELETE ;



--==========================================================
--ConcatIDs
--==========================================================

EXEC dbo.sp_CRMProcess_ConcatIDs 'Account'

--==========================================================
--CompositeRecord Fields
--==========================================================

UPDATE account
SET SSID_Winner = dc.SSID
, new_ssbcrmsystemssidwinnersourcesystem = dc.SourceSystem
, emailaddress1 = dc.EmailPrimary
, mobilephone = dc.PhoneCell
, telephone2 = dc.PhoneBusiness
, [new_SSB_PrimaryArchticsID] = CASE WHEN dc.SourceSystem = 'tm' THEN dc.AccountId ELSE NULL END
FROM dbo.Account_custom account
	JOIN dbo.vwCompositeRecord_ModAcctID dc ON dc.SSB_CRMSYSTEM_ACCT_ID = account.SSB_CRMSYSTEM_ACCT_ID
WHERE dc.SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG = 1

--==========================================================
--Process Load Criteria
--==========================================================

EXEC [dbo].[sp_CRMLoad_Account_ProcessLoad_Criteria]

GO
