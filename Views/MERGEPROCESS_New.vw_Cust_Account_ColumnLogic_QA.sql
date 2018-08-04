SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [MERGEPROCESS_New].[vw_Cust_Account_ColumnLogic_QA]
AS

SELECT targetid accountid_group
	  ,targetid accountid
	  ,'Winner' RecordType
	  ,1 SortOrder
	  ,winner.donotbulkemail
	  ,winner.donotbulkpostalmail
	  ,winner.donotemail
	  ,winner.donotfax
	  ,winner.donotphone
	  ,winner.donotpostalmail
	  ,winner.donotsendmm
	  ,winner.participatesinworkflow
	  ,winner.donotbulkemailname
	  ,winner.donotemailname
	  ,winner.donotfaxname
	  ,winner.donotphonename
	  ,winner.donotpostalmailname
	  ,winner.donotbulkpostalmailname
	  ,winner.lastusedincampaign
FROM MERGEPROCESS_New.vw_Cust_Account_ColumnLogic vw
	JOIN Jaguars_Reporting.prodcopy.account	 winner ON winner.accountid = vw.targetid

UNION ALL

SELECT targetid accountid_group
	  ,loser.accountid
	  ,'loser' RecordType
	  ,2 SortOrder
	  ,loser.donotbulkemail
	  ,loser.donotbulkpostalmail
	  ,loser.donotemail
	  ,loser.donotfax
	  ,loser.donotphone
	  ,loser.donotpostalmail
	  ,loser.donotsendmm
	  ,loser.participatesinworkflow
	  ,loser.donotbulkemailname
	  ,loser.donotemailname
	  ,loser.donotfaxname
	  ,loser.donotphonename
	  ,loser.donotpostalmailname
	  ,loser.donotbulkpostalmailname
	  ,loser.lastusedincampaign
FROM MERGEPROCESS_New.vw_Cust_Account_ColumnLogic vw
	JOIN Jaguars_Reporting.prodcopy.account	 loser ON loser.accountid = vw.subordinateid

UNION ALL

SELECT targetid accountid_group
	  ,targetid accountid
	  ,'Result' RecordType
	  ,3 SortOrder
	  ,donotbulkemail
	  ,donotbulkpostalmail
	  ,donotemail
	  ,donotfax
	  ,donotphone
	  ,donotpostalmail
	  ,donotsendmm
	  ,participatesinworkflow
	  ,donotbulkemailname
	  ,donotemailname
	  ,donotfaxname
	  ,donotphonename
	  ,donotpostalmailname
	  ,donotbulkpostalmailname
	  ,lastusedincampaign
FROM MERGEPROCESS_New.vw_Cust_Account_ColumnLogic
GO
