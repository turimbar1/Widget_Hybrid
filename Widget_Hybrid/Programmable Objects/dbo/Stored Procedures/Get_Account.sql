IF OBJECT_ID('[dbo].[Get_Account]') IS NOT NULL
	DROP PROCEDURE [dbo].[Get_Account];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[Get_Account] AS
BEGIN
SELECT Id, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Description, IsDeleted, MasterRecordId, Type, RecordTypeId, ParentId, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, BillingStateCode, BillingCountryCode, BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, BillingAddress, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingStateCode, ShippingCountryCode, ShippingLatitude, ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Phone, Website, PhotoUrl, CCBU_Support_Level__c, CSM_Units__c, Company_Size__c, Credit_Limit__c, Customer_Phase_Commercial_Date__c, Customer_Phase_Setup_Date__c, Customer_Phase_Trial_Date__c, Customer_Phase__c, Customer_Reference_ID__c, Data_Quality_Description__c, Data_Quality_Score__c, Default_Price_Book__c, Duplicate_Group__c, Duplicate_Score__c, Enable_Bandwidth_Throttling__c, Enterprise__c, External_ID__c, Finance_Approved__c, Global_Strategic_Account__c, Inco_Terms__c, JDE_Address__c, Joint_External_Id__c, Last_Case_That_Consumed_Token__c
FROM Account;
END

GO
