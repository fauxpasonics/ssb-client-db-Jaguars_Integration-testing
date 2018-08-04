SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
CREATE PROC [MERGEPROCESS_New].[PreMerge]
    AS
Declare @LogDate datetime = (Select getdate())
 
INSERT INTO MERGEPROCESS_New.LogPreMergeAccount
Select a.FK_MergeID,ObjectType, 'Winner' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
		accountcategorycode,	accountcategorycodename,	accountclassificationcode,	accountclassificationcodename,	accountid,	accountnumber,	accountratingcode,	accountratingcodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	businesstypecode,	businesstypecodename,	createdby,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	emailaddress1,	emailaddress2,	emailaddress3,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	fax,	ftpsiteurl,	importsequencenumber,	industrycode,	industrycodename,	isprivatename,	lastusedincampaign,	marketcap,	marketcap_base,	masteraccountidname,	masteraccountidyominame,	masterid,	merged,	mergedname,	modifiedby,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	name,	numberofemployees,	opendeals,	opendeals_date,	opendeals_state,	openrevenue,	openrevenue_base,	openrevenue_date,	openrevenue_state,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	ownershipcode,	ownershipcodename,	owningbusinessunit,	owningteam,	owninguser,	parentaccountid,	parentaccountidname,	parentaccountidyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	primarycontactid,	primarycontactidname,	primarycontactidyominame,	processid,	revenue,	revenue_base,	sharesoutstanding,	shippingmethodcode,	shippingmethodcodename,	sic,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	stockexchange,	str_category,	str_client_sicdesc,	str_custom1,	str_custom2,	str_custom3,	str_custom4,	str_id,	str_idtext,	str_leadsourcecode,	str_leadsourcecodename,	str_league1,	str_league2,	str_league3,	str_league4,	str_league5,	str_league6,	str_league7,	str_league8,	str_marketingaccountindustryid,	str_marketingaccountindustryidname,	str_marketingaccountsourceid,	str_marketingaccountsourceidname,	str_partnersalesperson,	str_partnersalespersonname,	str_partnersalespersonyominame,	str_partnerserviceperson,	str_partnerservicepersonname,	str_partnerservicepersonyominame,	str_premiumsalesperson,	str_premiumsalespersonname,	str_premiumsalespersonyominame,	str_premiumserviceperson,	str_premiumservicepersonname,	str_premiumservicepersonyominame,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_serviceperson2,	str_serviceperson2name,	str_serviceperson2yominame,	str_servicepersonname,	str_servicepersonyominame,	str_source,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	territoryid,	territoryidname,	tickersymbol,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yominame,	CopyLoadDate,	new_ssbcrmsystemacctid,	new_ssbcrmsystemarchticsids,	new_ssbcrmsystemdimcustomerids,	new_ssbcrmsystemssidwinner,	new_ssb_primaryarchticsid,	new_ssbcrmsystemssidwinnersourcesystem,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_lastactivitydate,	str_nextactivitydate,	str_number,	str_partnershipclosedate,	str_partnershipcloseprobability,	str_partnershipcomments,	str_partnershipphase,	str_partnershiprevenue,	str_partnershiprevenue_base,	str_partnershipstatus
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pcaccount b
    ON a.Winning_ID = b.Accountid
UNION ALL
Select a.FK_MergeID,ObjectType, 'Loser' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
		accountcategorycode,	accountcategorycodename,	accountclassificationcode,	accountclassificationcodename,	accountid,	accountnumber,	accountratingcode,	accountratingcodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	businesstypecode,	businesstypecodename,	createdby,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	emailaddress1,	emailaddress2,	emailaddress3,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	fax,	ftpsiteurl,	importsequencenumber,	industrycode,	industrycodename,	isprivatename,	lastusedincampaign,	marketcap,	marketcap_base,	masteraccountidname,	masteraccountidyominame,	masterid,	merged,	mergedname,	modifiedby,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	name,	numberofemployees,	opendeals,	opendeals_date,	opendeals_state,	openrevenue,	openrevenue_base,	openrevenue_date,	openrevenue_state,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	ownershipcode,	ownershipcodename,	owningbusinessunit,	owningteam,	owninguser,	parentaccountid,	parentaccountidname,	parentaccountidyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	primarycontactid,	primarycontactidname,	primarycontactidyominame,	processid,	revenue,	revenue_base,	sharesoutstanding,	shippingmethodcode,	shippingmethodcodename,	sic,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	stockexchange,	str_category,	str_client_sicdesc,	str_custom1,	str_custom2,	str_custom3,	str_custom4,	str_id,	str_idtext,	str_leadsourcecode,	str_leadsourcecodename,	str_league1,	str_league2,	str_league3,	str_league4,	str_league5,	str_league6,	str_league7,	str_league8,	str_marketingaccountindustryid,	str_marketingaccountindustryidname,	str_marketingaccountsourceid,	str_marketingaccountsourceidname,	str_partnersalesperson,	str_partnersalespersonname,	str_partnersalespersonyominame,	str_partnerserviceperson,	str_partnerservicepersonname,	str_partnerservicepersonyominame,	str_premiumsalesperson,	str_premiumsalespersonname,	str_premiumsalespersonyominame,	str_premiumserviceperson,	str_premiumservicepersonname,	str_premiumservicepersonyominame,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_serviceperson2,	str_serviceperson2name,	str_serviceperson2yominame,	str_servicepersonname,	str_servicepersonyominame,	str_source,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	territoryid,	territoryidname,	tickersymbol,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yominame,	CopyLoadDate,	new_ssbcrmsystemacctid,	new_ssbcrmsystemarchticsids,	new_ssbcrmsystemdimcustomerids,	new_ssbcrmsystemssidwinner,	new_ssb_primaryarchticsid,	new_ssbcrmsystemssidwinnersourcesystem,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_lastactivitydate,	str_nextactivitydate,	str_number,	str_partnershipclosedate,	str_partnershipcloseprobability,	str_partnershipcomments,	str_partnershipphase,	str_partnershiprevenue,	str_partnershiprevenue_base,	str_partnershipstatus
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pcaccount b
    ON a.Losing_ID = b.Accountid
 
INSERT INTO MERGEPROCESS_New.LogPreMergeContact
SELECT a.FK_MergeID,ObjectType, 'Winner' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
		accountid,	accountidname,	accountidyominame,	accountrolecode,	accountrolecodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	address3_addressid,	address3_addresstypecode,	address3_addresstypecodename,	address3_city,	address3_composite,	address3_country,	address3_county,	address3_fax,	address3_freighttermscode,	address3_freighttermscodename,	address3_latitude,	address3_line1,	address3_line2,	address3_line3,	address3_longitude,	address3_name,	address3_postalcode,	address3_postofficebox,	address3_primarycontactname,	address3_shippingmethodcode,	address3_shippingmethodcodename,	address3_stateorprovince,	address3_telephone1,	address3_telephone2,	address3_telephone3,	address3_upszone,	address3_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	anniversary,	annualincome,	annualincome_base,	assistantname,	assistantphone,	birthdate,	business2,	callback,	childrensnames,	company,	contactid,	createdby,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	department,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	educationcode,	educationcodename,	emailaddress1,	emailaddress2,	emailaddress3,	employeeid,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	externaluseridentifier,	familystatuscode,	familystatuscodename,	fax,	firstname,	ftpsiteurl,	fullname,	gendercode,	gendercodename,	governmentid,	haschildrencode,	haschildrencodename,	home2,	importsequencenumber,	isbackofficecustomer,	isbackofficecustomername,	isprivatename,	jobtitle,	lastname,	lastusedincampaign,	leadsourcecode,	leadsourcecodename,	managername,	managerphone,	mastercontactidname,	mastercontactidyominame,	masterid,	merged,	mergedname,	middlename,	mobilephone,	modifiedby,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	nickname,	numberofchildren,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	owningbusinessunit,	owningteam,	owninguser,	pager,	parentcontactid,	parentcontactidname,	parentcontactidyominame,	parentcustomerid,	parentcustomeridname,	parentcustomeridtype,	parentcustomeridyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	processid,	salutation,	shippingmethodcode,	shippingmethodcodename,	spousesname,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	str_agerange,	str_category,	str_client_companydecisionmaker,	str_client_companydecisionmakername,	str_clientbirthdayadjusted,	str_clientbirthdaynumber,	str_clientbirthmonth,	str_clientbirthyear,	str_clientemailoptin,	str_clientgroupbuyer,	str_clientminipackbuyer,	str_clientminipackbuyername,	str_clientnonticketbuyer,	str_clientnonticketbuyername,	str_clientpaststm,	str_clientpaststmname,	str_clientrenewedcurrentyear,	str_clientrenewedcurrentyearname,	str_clientrookiestm,	str_clientrookiestmname,	str_clientsinglegameticketbuyer,	str_clientstm,	str_clientstmname,	str_clientticketbuyertype,	str_college,	str_concertinterests,	str_datawarehouseid,	str_externalage,	str_externalcapacitymodel,	str_externalchildrenpresent,	str_externalchildrenpresentname,	str_externalclustername,	str_externaldii,	str_externaldistancetovenue,	str_externalfootballpropensity,	str_externalhouseholdincome,	str_externalhouseholdincomenarrow,	str_externaloccupationfirstindiv,	str_externaloccupationinputindiv,	str_externaloccupationsecondindiv,	str_externalpersonicxcluster,	str_externalpersonicxgroup,	str_externalprioritymodel,	str_favoritedestination,	str_favoriteplayer,	str_favoriterestaurant,	str_favoriteteam,	str_hobbies,	str_hometown,	str_householdincome,	str_householdincome_base,	str_id,	str_idtext,	str_lastactivitydate,	str_marketingcontactsourceid,	str_marketingcontactsourceidname,	str_marketingcontacttypeid,	str_marketingcontacttypeidname,	str_musicclassical,	str_musicclassicalname,	str_musiccountry,	str_musiccountryname,	str_musicpop,	str_musicpopname,	str_musicrap,	str_musicrapname,	str_musicrock,	str_musicrockname,	str_nextactivitydate,	str_nextactivitysubject,	str_number,	str_openactivitycount,	str_openticketcase,	str_openticketcasename,	str_openticketopportunity,	str_openticketopportunityname,	str_oppdaysinstage,	str_oppproduct,	str_oppsource,	str_oppstage,	str_otherinformation,	str_partnerid,	str_partneridname,	str_partneridyominame,	str_premiumtype,	str_premiumtypename,	str_priority,	str_rating,	str_ratingname,	str_score,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_servicepersonname,	str_servicepersonyominame,	str_showsfamily,	str_showsfamilyname,	str_since,	str_source,	str_sportsinterests,	str_test,	str_test_date,	str_test_state,	str_ticketeventtotalall,	str_ticketeventtotalarena,	str_ticketeventtotallast,	str_ticketeventtotalthis,	str_ticketnumberaverageall,	str_ticketnumberaveragearena,	str_ticketnumberaveragelast,	str_ticketnumberaveragethis,	str_ticketnumbertotalall,	str_ticketnumbertotalarena,	str_ticketnumbertotallast,	str_ticketnumbertotalthis,	str_ticketpriceaverageall,	str_ticketpriceaverageall_base,	str_ticketpriceaveragearena,	str_ticketpriceaveragearena_base,	str_ticketpriceaveragelast,	str_ticketpriceaveragelast_base,	str_ticketpriceaveragethis,	str_ticketpriceaveragethis_base,	str_ticketspendaverageall,	str_ticketspendaverageall_base,	str_ticketspendaveragearena,	str_ticketspendaveragearena_base,	str_ticketspendaveragelast,	str_ticketspendaveragelast_base,	str_ticketspendaveragethis,	str_ticketspendaveragethis_base,	str_ticketspendtotalall,	str_ticketspendtotalall_base,	str_ticketspendtotalarena,	str_ticketspendtotalarena_base,	str_ticketspendtotallast,	str_ticketspendtotallast_base,	str_ticketspendtotalthis,	str_ticketspendtotalthis_base,	suffix,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yomifirstname,	yomifullname,	yomilastname,	yomimiddlename,	CopyLoadDate,	new_ssbcrmsystemacctid,	new_ssbcrmsystemarchticsids,	new_ssbcrmsystemcontactid,	new_ssbcrmsystemdimcustomerids,	new_ssbcrmsystemssidwinner,	new_ssbcrmsystemssidwinnersourcesystem,	str_allspendtotal,	str_allspendtotal_base,	str_casesource,	str_casestatus,	str_casesubject,	str_casetype,	str_dwcompanies,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_facebookhandle,	str_instagramhandle,	str_linkedin,	str_neglectmeter,	str_neglectreason,	str_opportunityrevenue,	str_opportunityrevenue_base,	str_opptagcount,	str_rbmusic,	str_rbmusicname,	str_twitterhandle,	new_lastactivityowner,	new_lastactivityownername,	new_lastactivityowneryominame,	new_clientcategoryofinterest,	new_doyougotofollowingareasatjagsgames,	new_doyougotofollowingareasatjagsgamesname,	new_doyoutailgateatjaguarsgames,	new_doyoutailgateatjaguarsgamesname,	new_eloquascore,	new_haveyoubeentoajaguarsgame,	new_haveyoubeentoajaguarsgamename,	new_haveyoueverbeentoeverbankfield,	new_haveyoueverbeentoeverbankfieldname,	new_howmanyjagsroadgamesdoyouwatchperseason,	new_howmanyjagsroadgamesdoyouwatchperseasonname,	new_lasttimeyouattendedajaguarsgame,	new_lasttimeyouattendedajaguarsgamename,	new_spousebirthday,	new_ssb_primaryarchticsid,	new_ssbcrmsystemsssidwinner,	new_whenattendingjagsgamesdoyoupreferto,	new_whenattendingjagsgamesdoyouprefertoname,	new_whodoyouattendgameswith,	new_whodoyouattendgameswithname,	createdbyexternalparty,	createdbyexternalpartyname,	createdbyexternalpartyyominame,	followemail,	followemailname,	lastonholdtime,	marketingonly,	marketingonlyname,	modifiedbyexternalparty,	modifiedbyexternalpartyname,	modifiedbyexternalpartyyominame,	new_donotalltexts,	new_donotalltextsname,	new_race,	onholdtime,	slaid,	slainvokedid,	slainvokedidname,	slaname,	timespentbymeonemailandmeetings
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pccontact b
    ON a.Winning_ID = b.contactid
UNION ALL
SELECT a.FK_MergeID,ObjectType, 'Loser' MergeRecordType, @LogDate LogDate,
        -- updateme add all columns from prodcopy.
		accountid,	accountidname,	accountidyominame,	accountrolecode,	accountrolecodename,	address1_addressid,	address1_addresstypecode,	address1_addresstypecodename,	address1_city,	address1_composite,	address1_country,	address1_county,	address1_fax,	address1_freighttermscode,	address1_freighttermscodename,	address1_latitude,	address1_line1,	address1_line2,	address1_line3,	address1_longitude,	address1_name,	address1_postalcode,	address1_postofficebox,	address1_primarycontactname,	address1_shippingmethodcode,	address1_shippingmethodcodename,	address1_stateorprovince,	address1_telephone1,	address1_telephone2,	address1_telephone3,	address1_upszone,	address1_utcoffset,	address2_addressid,	address2_addresstypecode,	address2_addresstypecodename,	address2_city,	address2_composite,	address2_country,	address2_county,	address2_fax,	address2_freighttermscode,	address2_freighttermscodename,	address2_latitude,	address2_line1,	address2_line2,	address2_line3,	address2_longitude,	address2_name,	address2_postalcode,	address2_postofficebox,	address2_primarycontactname,	address2_shippingmethodcode,	address2_shippingmethodcodename,	address2_stateorprovince,	address2_telephone1,	address2_telephone2,	address2_telephone3,	address2_upszone,	address2_utcoffset,	address3_addressid,	address3_addresstypecode,	address3_addresstypecodename,	address3_city,	address3_composite,	address3_country,	address3_county,	address3_fax,	address3_freighttermscode,	address3_freighttermscodename,	address3_latitude,	address3_line1,	address3_line2,	address3_line3,	address3_longitude,	address3_name,	address3_postalcode,	address3_postofficebox,	address3_primarycontactname,	address3_shippingmethodcode,	address3_shippingmethodcodename,	address3_stateorprovince,	address3_telephone1,	address3_telephone2,	address3_telephone3,	address3_upszone,	address3_utcoffset,	aging30,	aging30_base,	aging60,	aging60_base,	aging90,	aging90_base,	anniversary,	annualincome,	annualincome_base,	assistantname,	assistantphone,	birthdate,	business2,	callback,	childrensnames,	company,	contactid,	createdby,	createdbyname,	createdbyyominame,	createdon,	createdonbehalfby,	createdonbehalfbyname,	createdonbehalfbyyominame,	creditlimit,	creditlimit_base,	creditonhold,	creditonholdname,	customersizecode,	customersizecodename,	customertypecode,	customertypecodename,	defaultpricelevelid,	defaultpricelevelidname,	department,	description,	donotbulkemail,	donotbulkemailname,	donotbulkpostalmail,	donotbulkpostalmailname,	donotemail,	donotemailname,	donotfax,	donotfaxname,	donotphone,	donotphonename,	donotpostalmail,	donotpostalmailname,	donotsendmarketingmaterialname,	donotsendmm,	educationcode,	educationcodename,	emailaddress1,	emailaddress2,	emailaddress3,	employeeid,	entityimage,	entityimage_timestamp,	entityimage_url,	entityimageid,	exchangerate,	externaluseridentifier,	familystatuscode,	familystatuscodename,	fax,	firstname,	ftpsiteurl,	fullname,	gendercode,	gendercodename,	governmentid,	haschildrencode,	haschildrencodename,	home2,	importsequencenumber,	isbackofficecustomer,	isbackofficecustomername,	isprivatename,	jobtitle,	lastname,	lastusedincampaign,	leadsourcecode,	leadsourcecodename,	managername,	managerphone,	mastercontactidname,	mastercontactidyominame,	masterid,	merged,	mergedname,	middlename,	mobilephone,	modifiedby,	modifiedbyname,	modifiedbyyominame,	modifiedon,	modifiedonbehalfby,	modifiedonbehalfbyname,	modifiedonbehalfbyyominame,	nickname,	numberofchildren,	originatingleadid,	originatingleadidname,	originatingleadidyominame,	overriddencreatedon,	ownerid,	owneridname,	owneridtype,	owneridyominame,	owningbusinessunit,	owningteam,	owninguser,	pager,	parentcontactid,	parentcontactidname,	parentcontactidyominame,	parentcustomerid,	parentcustomeridname,	parentcustomeridtype,	parentcustomeridyominame,	participatesinworkflow,	participatesinworkflowname,	paymenttermscode,	paymenttermscodename,	preferredappointmentdaycode,	preferredappointmentdaycodename,	preferredappointmenttimecode,	preferredappointmenttimecodename,	preferredcontactmethodcode,	preferredcontactmethodcodename,	preferredequipmentid,	preferredequipmentidname,	preferredserviceid,	preferredserviceidname,	preferredsystemuserid,	preferredsystemuseridname,	preferredsystemuseridyominame,	processid,	salutation,	shippingmethodcode,	shippingmethodcodename,	spousesname,	stageid,	statecode,	statecodename,	statuscode,	statuscodename,	str_agerange,	str_category,	str_client_companydecisionmaker,	str_client_companydecisionmakername,	str_clientbirthdayadjusted,	str_clientbirthdaynumber,	str_clientbirthmonth,	str_clientbirthyear,	str_clientemailoptin,	str_clientgroupbuyer,	str_clientminipackbuyer,	str_clientminipackbuyername,	str_clientnonticketbuyer,	str_clientnonticketbuyername,	str_clientpaststm,	str_clientpaststmname,	str_clientrenewedcurrentyear,	str_clientrenewedcurrentyearname,	str_clientrookiestm,	str_clientrookiestmname,	str_clientsinglegameticketbuyer,	str_clientstm,	str_clientstmname,	str_clientticketbuyertype,	str_college,	str_concertinterests,	str_datawarehouseid,	str_externalage,	str_externalcapacitymodel,	str_externalchildrenpresent,	str_externalchildrenpresentname,	str_externalclustername,	str_externaldii,	str_externaldistancetovenue,	str_externalfootballpropensity,	str_externalhouseholdincome,	str_externalhouseholdincomenarrow,	str_externaloccupationfirstindiv,	str_externaloccupationinputindiv,	str_externaloccupationsecondindiv,	str_externalpersonicxcluster,	str_externalpersonicxgroup,	str_externalprioritymodel,	str_favoritedestination,	str_favoriteplayer,	str_favoriterestaurant,	str_favoriteteam,	str_hobbies,	str_hometown,	str_householdincome,	str_householdincome_base,	str_id,	str_idtext,	str_lastactivitydate,	str_marketingcontactsourceid,	str_marketingcontactsourceidname,	str_marketingcontacttypeid,	str_marketingcontacttypeidname,	str_musicclassical,	str_musicclassicalname,	str_musiccountry,	str_musiccountryname,	str_musicpop,	str_musicpopname,	str_musicrap,	str_musicrapname,	str_musicrock,	str_musicrockname,	str_nextactivitydate,	str_nextactivitysubject,	str_number,	str_openactivitycount,	str_openticketcase,	str_openticketcasename,	str_openticketopportunity,	str_openticketopportunityname,	str_oppdaysinstage,	str_oppproduct,	str_oppsource,	str_oppstage,	str_otherinformation,	str_partnerid,	str_partneridname,	str_partneridyominame,	str_premiumtype,	str_premiumtypename,	str_priority,	str_rating,	str_ratingname,	str_score,	str_search,	str_select,	str_selectname,	str_serviceperson,	str_servicepersonname,	str_servicepersonyominame,	str_showsfamily,	str_showsfamilyname,	str_since,	str_source,	str_sportsinterests,	str_test,	str_test_date,	str_test_state,	str_ticketeventtotalall,	str_ticketeventtotalarena,	str_ticketeventtotallast,	str_ticketeventtotalthis,	str_ticketnumberaverageall,	str_ticketnumberaveragearena,	str_ticketnumberaveragelast,	str_ticketnumberaveragethis,	str_ticketnumbertotalall,	str_ticketnumbertotalarena,	str_ticketnumbertotallast,	str_ticketnumbertotalthis,	str_ticketpriceaverageall,	str_ticketpriceaverageall_base,	str_ticketpriceaveragearena,	str_ticketpriceaveragearena_base,	str_ticketpriceaveragelast,	str_ticketpriceaveragelast_base,	str_ticketpriceaveragethis,	str_ticketpriceaveragethis_base,	str_ticketspendaverageall,	str_ticketspendaverageall_base,	str_ticketspendaveragearena,	str_ticketspendaveragearena_base,	str_ticketspendaveragelast,	str_ticketspendaveragelast_base,	str_ticketspendaveragethis,	str_ticketspendaveragethis_base,	str_ticketspendtotalall,	str_ticketspendtotalall_base,	str_ticketspendtotalarena,	str_ticketspendtotalarena_base,	str_ticketspendtotallast,	str_ticketspendtotallast_base,	str_ticketspendtotalthis,	str_ticketspendtotalthis_base,	suffix,	telephone1,	telephone2,	telephone3,	territorycode,	territorycodename,	timezoneruleversionnumber,	transactioncurrencyid,	transactioncurrencyidname,	traversedpath,	utcconversiontimezonecode,	versionnumber,	websiteurl,	yomifirstname,	yomifullname,	yomilastname,	yomimiddlename,	CopyLoadDate,	new_ssbcrmsystemacctid,	new_ssbcrmsystemarchticsids,	new_ssbcrmsystemcontactid,	new_ssbcrmsystemdimcustomerids,	new_ssbcrmsystemssidwinner,	new_ssbcrmsystemssidwinnersourcesystem,	str_allspendtotal,	str_allspendtotal_base,	str_casesource,	str_casestatus,	str_casesubject,	str_casetype,	str_dwcompanies,	str_dwduplicate,	str_dwduplicatename,	str_dwid,	str_dwmodifiedon,	str_facebookhandle,	str_instagramhandle,	str_linkedin,	str_neglectmeter,	str_neglectreason,	str_opportunityrevenue,	str_opportunityrevenue_base,	str_opptagcount,	str_rbmusic,	str_rbmusicname,	str_twitterhandle,	new_lastactivityowner,	new_lastactivityownername,	new_lastactivityowneryominame,	new_clientcategoryofinterest,	new_doyougotofollowingareasatjagsgames,	new_doyougotofollowingareasatjagsgamesname,	new_doyoutailgateatjaguarsgames,	new_doyoutailgateatjaguarsgamesname,	new_eloquascore,	new_haveyoubeentoajaguarsgame,	new_haveyoubeentoajaguarsgamename,	new_haveyoueverbeentoeverbankfield,	new_haveyoueverbeentoeverbankfieldname,	new_howmanyjagsroadgamesdoyouwatchperseason,	new_howmanyjagsroadgamesdoyouwatchperseasonname,	new_lasttimeyouattendedajaguarsgame,	new_lasttimeyouattendedajaguarsgamename,	new_spousebirthday,	new_ssb_primaryarchticsid,	new_ssbcrmsystemsssidwinner,	new_whenattendingjagsgamesdoyoupreferto,	new_whenattendingjagsgamesdoyouprefertoname,	new_whodoyouattendgameswith,	new_whodoyouattendgameswithname,	createdbyexternalparty,	createdbyexternalpartyname,	createdbyexternalpartyyominame,	followemail,	followemailname,	lastonholdtime,	marketingonly,	marketingonlyname,	modifiedbyexternalparty,	modifiedbyexternalpartyname,	modifiedbyexternalpartyyominame,	new_donotalltexts,	new_donotalltextsname,	new_race,	onholdtime,	slaid,	slainvokedid,	slainvokedidname,	slaname,	timespentbymeonemailandmeetings
FROM MERGEPROCESS_New.Queue a
JOIN mergeprocess_new.tmp_pccontact b
    ON a.Losing_ID = b.contactid
 
 
 
GO