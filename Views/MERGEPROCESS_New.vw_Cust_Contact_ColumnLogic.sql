SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [MERGEPROCESS_New].[vw_Cust_Contact_ColumnLogic]
AS

SELECT  q.Winning_ID AS targetid 
       ,Losing_ID AS subordinateid             
       ,1 AS CoalesceNonEmptyValues --New Kingsway feature to bring values from loser where winning record is null

	   ,/*donotbulkemail								 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotbulkemail,0) = 1 OR ISNULL(loser.donotbulkemail,0) = 1 THEN 1 ELSE 0 END																		 AS [donotbulkemail]
	   ,/*donotbulkpostalmail							 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotbulkpostalmail,0) = 1 OR ISNULL(loser.donotbulkpostalmail,0) = 1 THEN 1 ELSE 0 END																 AS [donotbulkpostalmail]
	   ,/*donotemail									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotemail,0) = 1 OR ISNULL(loser.donotemail,0) = 1 THEN 1 ELSE 0 END																				 AS [donotemail]
	   ,/*donotfax										 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotfax,0) = 1 OR ISNULL(loser.donotfax,0) = 1 THEN 1 ELSE 0 END																					 AS [donotfax]
	   ,/*donotphone									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotphone,0) = 1 OR ISNULL(loser.donotphone,0) = 1 THEN 1 ELSE 0 END																				 AS [donotphone]
	   ,/*donotpostalmail								 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotpostalmail,0) = 1 OR ISNULL(loser.donotpostalmail,0) = 1 THEN 1 ELSE 0 END																		 AS [donotpostalmail]
	   ,/*donotsendmm									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.donotsendmm,0) = 1 OR ISNULL(loser.donotsendmm,0) = 1 THEN 1 ELSE 0 END																				 AS [donotsendmm]
	   ,/*isbackofficecustomer							 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.isbackofficecustomer,0) = 1 OR ISNULL(loser.isbackofficecustomer,0) = 1 THEN 1 ELSE 0 END															 AS [isbackofficecustomer]
	   ,/*new_donotalltexts								 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.new_donotalltexts,0) = 1 OR ISNULL(loser.new_donotalltexts,0) = 1 THEN 1 ELSE 0 END																	 AS [new_donotalltexts]
	   ,/*new_doyoutailgateatjaguarsgames				 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.new_doyoutailgateatjaguarsgames,0) = 1 OR ISNULL(loser.new_doyoutailgateatjaguarsgames,0) = 1 THEN 1 ELSE 0 END										 AS [new_doyoutailgateatjaguarsgames]
	   ,/*new_haveyoubeentoajaguarsgame					 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.new_haveyoubeentoajaguarsgame,0) = 1 OR ISNULL(loser.new_haveyoubeentoajaguarsgame,0) = 1 THEN 1 ELSE 0 END											 AS [new_haveyoubeentoajaguarsgame]
	   ,/*new_haveyoueverbeentoeverbankfield			 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.new_haveyoueverbeentoeverbankfield,0) = 1 OR ISNULL(loser.new_haveyoueverbeentoeverbankfield,0) = 1 THEN 1 ELSE 0 END								 AS [new_haveyoueverbeentoeverbankfield]
	   ,/*participatesinworkflow						 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.participatesinworkflow,0) = 1 OR ISNULL(loser.participatesinworkflow,0) = 1 THEN 1 ELSE 0 END														 AS [participatesinworkflow]
	   ,/*str_client_companydecisionmaker				 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_client_companydecisionmaker,0) = 1 OR ISNULL(loser.str_client_companydecisionmaker,0) = 1 THEN 1 ELSE 0 END										 AS [str_client_companydecisionmaker]
	   ,/*str_musicclassical							 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_musicclassical,0) = 1 OR ISNULL(loser.str_musicclassical,0) = 1 THEN 1 ELSE 0 END																 AS [str_musicclassical]
	   ,/*str_musiccountry								 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_musiccountry,0) = 1 OR ISNULL(loser.str_musiccountry,0) = 1 THEN 1 ELSE 0 END																	 AS [str_musiccountry]
	   ,/*str_musicpop									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_musicpop,0) = 1 OR ISNULL(loser.str_musicpop,0) = 1 THEN 1 ELSE 0 END																			 AS [str_musicpop]
	   ,/*str_musicrap									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_musicrap,0) = 1 OR ISNULL(loser.str_musicrap,0) = 1 THEN 1 ELSE 0 END																			 AS [str_musicrap]
	   ,/*str_musicrock									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_musicrock,0) = 1 OR ISNULL(loser.str_musicrock,0) = 1 THEN 1 ELSE 0 END																			 AS [str_musicrock]
	   ,/*str_openticketcase							 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_openticketcase,0) = 1 OR ISNULL(loser.str_openticketcase,0) = 1 THEN 1 ELSE 0 END																 AS [str_openticketcase]
	   ,/*str_openticketopportunity						 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_openticketopportunity,0) = 1 OR ISNULL(loser.str_openticketopportunity,0) = 1 THEN 1 ELSE 0 END													 AS [str_openticketopportunity]
	   ,/*str_rbmusic									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_rbmusic,0) = 1 OR ISNULL(loser.str_rbmusic,0) = 1 THEN 1 ELSE 0 END																				 AS [str_rbmusic]
	   ,/*str_select									 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_select,0) = 1 OR ISNULL(loser.str_select,0) = 1 THEN 1 ELSE 0 END																				 AS [str_select]
	   ,/*str_showsfamily								 - Check yes if Either Record is Yes				*/	CASE WHEN ISNULL(winner.str_showsfamily,0) = 1 OR ISNULL(loser.str_showsfamily,0) = 1 THEN 1 ELSE 0 END																		 AS [str_showsfamily]
	   ,/*lastusedincampaign							 - Most recent from both records					*/	CASE WHEN winner.lastusedincampaign < loser.lastusedincampaign THEN loser.lastusedincampaign ELSE winner.lastusedincampaign END							 AS [lastusedincampaign]
	   ,/*str_lastactivitydate							 - Most recent from both records					*/	CASE WHEN winner.str_lastactivitydate < loser.str_lastactivitydate THEN loser.str_lastactivitydate ELSE winner.str_lastactivitydate END					 AS [str_lastactivitydate]
	   ,/*str_nextactivitydate							 - Earliest from both records						*/	CASE WHEN winner.str_nextactivitydate > loser.str_nextactivitydate THEN loser.str_nextactivitydate ELSE winner.str_nextactivitydate END					 AS [str_nextactivitydate]
	   ,/*donotbulkemailname							 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.donotbulkemailname,'Allow') = 'Do Not Allow' OR ISNULL(loser.donotbulkemailname,'Allow') = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END					 AS [donotbulkemailname]	   
	   ,/*donotemailname								 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.donotemailname,'Allow') = 'Do Not Allow' OR ISNULL(loser.donotemailname,'Allow') = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END							 AS [donotemailname]
	   ,/*donotfaxname									 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.donotfaxname,'Allow') = 'Do Not Allow' OR ISNULL(loser.donotfaxname,'Allow') = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END								 AS [donotfaxname]
	   ,/*donotphonename								 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.donotphonename,'Allow') = 'Do Not Allow' OR ISNULL(loser.donotphonename,'Allow') = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END							 AS [donotphonename]
	   ,/*donotpostalmailname							 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.donotpostalmailname,'Allow') = 'Do Not Allow' OR ISNULL(loser.donotpostalmailname,'Allow') = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END				 AS [donotpostalmailname]
	   ,/*new_donotalltextsname							 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.new_donotalltextsname,'Allow') = 'Do Not Allow' OR ISNULL(loser.new_donotalltextsname,'Allow') = 'Do Not Allow' THEN 'Do Not Allow' ELSE 'Allow' END			 AS [new_donotalltextsname]
	   ,/*donotbulkpostalmailname						 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.donotbulkpostalmailname,'No') = 'No' OR ISNULL(loser.donotbulkpostalmailname,'No') = 'No' THEN 'No' ELSE 'Yes' END										 AS [donotbulkpostalmailname]
	   ,/*new_doyoutailgateatjaguarsgamesname			 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.new_doyoutailgateatjaguarsgamesname,'No') = 'No' OR ISNULL(loser.new_doyoutailgateatjaguarsgamesname,'No') = 'No' THEN 'No' ELSE 'Yes' END				 AS [new_doyoutailgateatjaguarsgamesname]
	   ,/*new_haveyoubeentoajaguarsgamename				 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.new_haveyoubeentoajaguarsgamename,'No') = 'No' OR ISNULL(loser.new_haveyoubeentoajaguarsgamename,'No') = 'No' THEN 'No' ELSE 'Yes' END					 AS [new_haveyoubeentoajaguarsgamename]
	   ,/*new_haveyoueverbeentoeverbankfieldname		 - Check yes if Either Record is Yes (String)		*/	CASE WHEN ISNULL(winner.new_haveyoueverbeentoeverbankfieldname,'No') = 'No' OR ISNULL(loser.new_haveyoueverbeentoeverbankfieldname,'No') = 'No' THEN 'No' ELSE 'Yes' END			 AS [new_haveyoueverbeentoeverbankfieldname]

FROM [MERGEPROCESS_New].[Queue] q
	JOIN mergeprocess_new.tmp_pcContact winner ON q.Winning_ID = winner.Contactid
	JOIN mergeprocess_new.tmp_pcContact loser ON q.Losing_ID = loser.Contactid
WHERE q.ObjectType = 'Contact'










GO
