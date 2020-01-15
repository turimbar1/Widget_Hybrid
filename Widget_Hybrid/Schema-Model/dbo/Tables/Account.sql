CREATE TABLE [dbo].[Account]
(
[Id] [nvarchar] (18) NULL,
[Name] [nvarchar] (121) NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) NULL,
[SystemModstamp] [datetime] NULL,
[LastViewedDate] [datetime] NULL,
[LastReferencedDate] [datetime] NULL,
[Description] [nvarchar] (1000) NULL,
[IsDeleted] [bit] NULL,
[MasterRecordId] [nvarchar] (18) NULL,
[Type] [nvarchar] (40) NULL,
[RecordTypeId] [nvarchar] (18) NULL,
[ParentId] [nvarchar] (18) NULL,
[BillingStreet] [nvarchar] (255) NULL,
[BillingCity] [nvarchar] (40) NULL,
[BillingState] [nvarchar] (80) NULL,
[BillingPostalCode] [nvarchar] (20) NULL,
[BillingCountry] [nvarchar] (80) NULL,
[BillingStateCode] [nvarchar] (10) NULL,
[BillingCountryCode] [nvarchar] (10) NULL,
[BillingLatitude] [float] NULL,
[BillingLongitude] [float] NULL,
[BillingGeocodeAccuracy] [nvarchar] (40) NULL,
[BillingAddress] [nvarchar] (max) NULL,
[ShippingStreet] [nvarchar] (255) NULL,
[ShippingCity] [nvarchar] (40) NULL,
[ShippingState] [nvarchar] (80) NULL,
[ShippingPostalCode] [nvarchar] (20) NULL,
[ShippingCountry] [nvarchar] (80) NULL,
[ShippingStateCode] [nvarchar] (10) NULL,
[ShippingCountryCode] [nvarchar] (10) NULL,
[ShippingLatitude] [float] NULL,
[ShippingLongitude] [float] NULL,
[ShippingGeocodeAccuracy] [nvarchar] (40) NULL,
[ShippingAddress] [nvarchar] (max) NULL,
[Phone] [nvarchar] (40) NULL,
[Website] [nvarchar] (255) NULL,
[PhotoUrl] [nvarchar] (255) NULL,
[Industry] [nvarchar] (40) NULL,
[NumberOfEmployees] [int] NULL,
[CurrencyIsoCode] [nvarchar] (3) NULL,
[OwnerId] [nvarchar] (18) NULL,
[LastActivityDate] [date] NULL,
[IsPartner] [bit] NULL,
[IsCustomerPortal] [bit] NULL,
[Jigsaw] [nvarchar] (20) NULL,
[JigsawCompanyId] [nvarchar] (20) NULL,
[AccountSource] [nvarchar] (40) NULL,
[SicDesc] [nvarchar] (80) NULL,
[Support_level_ESBU__c] [nvarchar] (255) NULL,
[Support_Pin_Code__c] [nvarchar] (10) NULL,
[Accel_External_Id__c] [nvarchar] (100) NULL,
[Access_Level__c] [nvarchar] (255) NULL,
[Account_Number__c] [nvarchar] (30) NULL,
[Account_Owner_Full_Name__c] [nvarchar] (255) NULL,
[Approved_Agent__c] [bit] NULL,
[Billing_Contact__c] [nvarchar] (18) NULL,
[CCBU_Support_Level__c] [nvarchar] (255) NULL,
[CSM_Units__c] [nvarchar] (100) NULL,
[Company_Size__c] [nvarchar] (255) NULL,
[Credit_Limit__c] [nvarchar] (100) NULL,
[Customer_Phase_Commercial_Date__c] [date] NULL,
[Customer_Phase_Setup_Date__c] [date] NULL,
[Customer_Phase_Trial_Date__c] [date] NULL,
[Customer_Phase__c] [nvarchar] (255) NULL,
[Customer_Reference_ID__c] [nvarchar] (50) NULL,
[Data_Quality_Description__c] [nvarchar] (1300) NULL,
[Data_Quality_Score__c] [float] NULL,
[Default_Price_Book__c] [nvarchar] (18) NULL,
[Duplicate_Group__c] [float] NULL,
[Duplicate_Score__c] [float] NULL,
[Enable_Bandwidth_Throttling__c] [bit] NULL,
[Enterprise__c] [bit] NULL,
[External_ID__c] [nvarchar] (100) NULL,
[Finance_Approved__c] [bit] NULL,
[Global_Strategic_Account__c] [bit] NULL,
[Inco_Terms__c] [nvarchar] (100) NULL,
[JDE_Address__c] [nvarchar] (160) NULL,
[Joint_External_Id__c] [nvarchar] (100) NULL,
[Last_Case_That_Consumed_Token__c] [nvarchar] (100) NULL,
[Lead_Source_Most_Recent__c] [nvarchar] (100) NULL,
[Lead_Source_Original__c] [nvarchar] (100) NULL,
[Lead_Source_Sales__c] [nvarchar] (255) NULL,
[Legacy_External_ID__c] [nvarchar] (100) NULL,
[MCS_ID__c] [nvarchar] (18) NULL,
[MSA_Attached__c] [bit] NULL,
[Number_Of_Tokens__c] [float] NULL,
[Old_Billing_Country__c] [nvarchar] (80) NULL,
[Old_Billing_State__c] [nvarchar] (80) NULL,
[Oracle_External_Id__c] [nvarchar] (100) NULL,
[Primary_Sales_Owner__c] [nvarchar] (18) NULL,
[Primary_Support_Queue__c] [nvarchar] (255) NULL,
[Priority__c] [nvarchar] (255) NULL,
[Region__c] [nvarchar] (255) NULL,
[Sector_ESBU__c] [nvarchar] (255) NULL,
[Sierra_ID__c] [nvarchar] (100) NULL,
[Site_Location_ID__c] [nvarchar] (100) NULL,
[Sub_Type__c] [nvarchar] (255) NULL,
[Support_Queue_Override__c] [nvarchar] (255) NULL,
[Target_Account__c] [bit] NULL,
[Tax_ID__c] [nvarchar] (25) NULL,
[Usage_Alert_Email_Distribution__c] [nvarchar] (1023) NULL,
[Zuora__Active__c] [nvarchar] (255) NULL,
[Zuora__CustomerPriority__c] [nvarchar] (255) NULL,
[Zuora__NumberofLocations__c] [float] NULL,
[Zuora__SLAExpirationDate__c] [date] NULL,
[Zuora__SLASerialNumber__c] [nvarchar] (10) NULL,
[Zuora__SLA__c] [nvarchar] (255) NULL,
[Zuora__UpsellOpportunity__c] [nvarchar] (255) NULL,
[RED_Gate_ID] [nvarchar] (255) NULL,
[User_Modified_Date] [datetime2] NULL,
[Last_Changed_By] [nvarchar] (50) NULL
)
GO
ALTER TABLE [dbo].[Account] ADD CONSTRAINT [UQ__Account__7E0C69C9522A6707] UNIQUE NONCLUSTERED  ([RED_Gate_ID])
GO
