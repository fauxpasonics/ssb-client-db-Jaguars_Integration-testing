SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [MERGEPROCESS_New].[vw_Cust_Contact_ColumnLogic_QA]
AS

SELECT targetid Contactid_group
	  ,targetid Contactid
	  ,'Winner' RecordType
	  ,1 SortOrder
	  ,winner.donotbulkemail
	  ,winner.donotbulkpostalmail
	  ,winner.donotemail
	  ,winner.donotfax
	  ,winner.donotphone
	  ,winner.donotpostalmail
	  ,winner.donotsendmm
	  ,winner.isbackofficecustomer
	  ,winner.new_donotalltexts
	  ,winner.new_doyoutailgateatjaguarsgames
	  ,winner.new_haveyoubeentoajaguarsgame
	  ,winner.new_haveyoueverbeentoeverbankfield
	  ,winner.participatesinworkflow
	  ,winner.str_client_companydecisionmaker
	  ,winner.str_musicclassical
	  ,winner.str_musiccountry
	  ,winner.str_musicpop
	  ,winner.str_musicrap
	  ,winner.str_musicrock
	  ,winner.str_openticketcase
	  ,winner.str_openticketopportunity
	  ,winner.str_rbmusic
	  ,winner.str_select
	  ,winner.str_showsfamily
	  ,winner.lastusedincampaign
	  ,winner.str_lastactivitydate
	  ,winner.str_nextactivitydate
	  ,winner.donotbulkemailname
	  ,winner.donotemailname
	  ,winner.donotfaxname
	  ,winner.donotphonename
	  ,winner.donotpostalmailname
	  ,winner.new_donotalltextsname
	  ,winner.donotbulkpostalmailname
	  ,winner.new_doyoutailgateatjaguarsgamesname
	  ,winner.new_haveyoubeentoajaguarsgamename
	  ,winner.new_haveyoueverbeentoeverbankfieldname
FROM MERGEPROCESS_New.vw_Cust_Contact_ColumnLogic vw
	JOIN Jaguars_Reporting.prodcopy.Contact	 winner ON winner.Contactid = vw.targetid

UNION ALL

SELECT targetid Contactid_group
	  ,loser.Contactid
	  ,'loser' RecordType
	  ,2 SortOrder
	  ,loser.donotbulkemail
	  ,loser.donotbulkpostalmail
	  ,loser.donotemail
	  ,loser.donotfax
	  ,loser.donotphone
	  ,loser.donotpostalmail
	  ,loser.donotsendmm
	  ,loser.isbackofficecustomer
	  ,loser.new_donotalltexts
	  ,loser.new_doyoutailgateatjaguarsgames
	  ,loser.new_haveyoubeentoajaguarsgame
	  ,loser.new_haveyoueverbeentoeverbankfield
	  ,loser.participatesinworkflow
	  ,loser.str_client_companydecisionmaker
	  ,loser.str_musicclassical
	  ,loser.str_musiccountry
	  ,loser.str_musicpop
	  ,loser.str_musicrap
	  ,loser.str_musicrock
	  ,loser.str_openticketcase
	  ,loser.str_openticketopportunity
	  ,loser.str_rbmusic
	  ,loser.str_select
	  ,loser.str_showsfamily
	  ,loser.lastusedincampaign
	  ,loser.str_lastactivitydate
	  ,loser.str_nextactivitydate
	  ,loser.donotbulkemailname
	  ,loser.donotemailname
	  ,loser.donotfaxname
	  ,loser.donotphonename
	  ,loser.donotpostalmailname
	  ,loser.new_donotalltextsname
	  ,loser.donotbulkpostalmailname
	  ,loser.new_doyoutailgateatjaguarsgamesname
	  ,loser.new_haveyoubeentoajaguarsgamename
	  ,loser.new_haveyoueverbeentoeverbankfieldname
FROM MERGEPROCESS_New.vw_Cust_Contact_ColumnLogic vw
	JOIN Jaguars_Reporting.prodcopy.Contact	 loser ON loser.Contactid = vw.subordinateid

UNION ALL

SELECT targetid Contactid_group
	  ,targetid Contactid
	  ,'Result' RecordType
	  ,3 SortOrder
	  ,donotbulkemail
	  ,donotbulkpostalmail
	  ,donotemail
	  ,donotfax
	  ,donotphone
	  ,donotpostalmail
	  ,donotsendmm
	  ,isbackofficecustomer
	  ,new_donotalltexts
	  ,new_doyoutailgateatjaguarsgames
	  ,new_haveyoubeentoajaguarsgame
	  ,new_haveyoueverbeentoeverbankfield
	  ,participatesinworkflow
	  ,str_client_companydecisionmaker
	  ,str_musicclassical
	  ,str_musiccountry
	  ,str_musicpop
	  ,str_musicrap
	  ,str_musicrock
	  ,str_openticketcase
	  ,str_openticketopportunity
	  ,str_rbmusic
	  ,str_select
	  ,str_showsfamily
	  ,lastusedincampaign
	  ,str_lastactivitydate
	  ,str_nextactivitydate
	  ,donotbulkemailname
	  ,donotemailname
	  ,donotfaxname
	  ,donotphonename
	  ,donotpostalmailname
	  ,new_donotalltextsname
	  ,donotbulkpostalmailname
	  ,new_doyoutailgateatjaguarsgamesname
	  ,new_haveyoubeentoajaguarsgamename
	  ,new_haveyoueverbeentoeverbankfieldname
FROM MERGEPROCESS_New.vw_Cust_Contact_ColumnLogic


GO
