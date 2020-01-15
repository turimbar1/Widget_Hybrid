-- <Migration ID="170f3ba4-b975-415f-9ec0-3152ca330cde" />
GO

PRINT N'Creating [dbo].[DM_INVOICE_LINE]'
GO
CREATE TABLE [dbo].[DM_INVOICE_LINE]
(
[invoice_number] [varchar] (10) NOT NULL,
[inventory_item_id] [varchar] (10) NOT NULL,
[invoice_line_quantity] [int] NULL,
[invoice_line_sale_price] [decimal] (10, 2) NULL
)
GO
PRINT N'Creating primary key [PK__DM_INVOI__D69CED10776D57F5] on [dbo].[DM_INVOICE_LINE]'
GO
ALTER TABLE [dbo].[DM_INVOICE_LINE] ADD CONSTRAINT [PK__DM_INVOI__D69CED10776D57F5] PRIMARY KEY CLUSTERED  ([invoice_number], [inventory_item_id])
GO
PRINT N'Creating [dbo].[DM_INVOICE_LINE_HISTORY]'
GO
CREATE TABLE [dbo].[DM_INVOICE_LINE_HISTORY]
(
[identCol] [int] NOT NULL IDENTITY(1, 1),
[invoice_number] [varchar] (6) NOT NULL,
[item_id] [varchar] (6) NOT NULL,
[quantity] [int] NULL
)
GO
PRINT N'Creating primary key [PK__DM_INVOI__2DE3C94A40C5B18B] on [dbo].[DM_INVOICE_LINE_HISTORY]'
GO
ALTER TABLE [dbo].[DM_INVOICE_LINE_HISTORY] ADD CONSTRAINT [PK__DM_INVOI__2DE3C94A40C5B18B] PRIMARY KEY CLUSTERED  ([identCol])
GO
PRINT N'Creating trigger [dbo].[IL_trig1] on [dbo].[DM_INVOICE_LINE]'
GO
create trigger [dbo].[IL_trig1]
on [dbo].[DM_INVOICE_LINE] after insert, update
AS
BEGIN
  DECLARE @invNum integer
  DECLARE @itemID integer
  DECLARE @itemQty integer
  Select @invNum=invoice_number, @itemID=inventory_item_id, @itemQty=invoice_line_quantity from DM_INVOICE_LINE;
  insert into DM_INVOICE_LINE_HISTORY (invoice_number,item_id,quantity) 
     values (@invNum,@itemID,@itemQty);
END
GO
PRINT N'Creating [dbo].[DM_EMPLOYEE]'
GO
CREATE TABLE [dbo].[DM_EMPLOYEE]
(
[person_id] [int] NOT NULL,
[assignment_id] [int] NOT NULL,
[emp_id] [varchar] (50) NULL,
[first_name] [varchar] (40) NULL,
[last_name] [varchar] (40) NULL,
[full_name] [varchar] (40) NULL,
[birth_date] [datetime] NULL,
[gender] [varchar] (1) NULL,
[title] [varchar] (10) NULL,
[emp_data] [varchar] (100) NULL
)
GO
PRINT N'Creating index [empInd1] on [dbo].[DM_EMPLOYEE]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [empInd1] ON [dbo].[DM_EMPLOYEE] ([person_id], [emp_id])
GO
PRINT N'Creating [dbo].[DM_EMP_AUDIT]'
GO
CREATE TABLE [dbo].[DM_EMP_AUDIT]
(
[identCol] [int] NOT NULL IDENTITY(1, 1),
[person_id] [int] NOT NULL,
[assignment_id] [int] NOT NULL,
[emp_id] [varchar] (10) NULL,
[first_name] [varchar] (40) NULL,
[last_name] [varchar] (40) NULL,
[full_name] [varchar] (40) NULL
)
GO
PRINT N'Creating primary key [PK__DM_EMP_A__2DE3C94ABAC21776] on [dbo].[DM_EMP_AUDIT]'
GO
ALTER TABLE [dbo].[DM_EMP_AUDIT] ADD CONSTRAINT [PK__DM_EMP_A__2DE3C94ABAC21776] PRIMARY KEY CLUSTERED  ([identCol])
GO
PRINT N'Creating trigger [dbo].[EMP_trig1] on [dbo].[DM_EMPLOYEE]'
GO

create trigger [dbo].[EMP_trig1]
on [dbo].[DM_EMPLOYEE] after update
AS
BEGIN
  DECLARE @person_id integer
  DECLARE @assignment_id integer
  DECLARE @emp_id varchar(10)
  DECLARE @first_name varchar(40)
  DECLARE @last_name varchar(40)
  DECLARE @full_name varchar(40)
  Select @person_id=person_id, @assignment_id=assignment_id, @emp_id=emp_id, @first_name=first_name, @last_name=last_name, @full_name=full_name from DM_EMPLOYEE;
  insert into DM_EMP_AUDIT (person_id,assignment_id, emp_id,first_name,last_name,full_name) 
     values (@person_id,@assignment_id, @emp_id,@first_name,@last_name,@full_name);
END
GO
PRINT N'Creating [dbo].[DM_CUSTOMER]'
GO
CREATE TABLE [dbo].[DM_CUSTOMER]
(
[customer_id] [varchar] (10) NOT NULL,
[customer_firstname] [varchar] (60) NULL,
[customer_lastname] [varchar] (60) NULL,
[customer_gender] [varchar] (1) NULL,
[customer_company_name] [varchar] (60) NULL,
[customer_street_address] [varchar] (60) NULL,
[customer_region] [varchar] (60) NULL,
[customer_country] [varchar] (60) NULL,
[customer_email] [varchar] (60) NULL,
[customer_telephone] [varchar] (60) NULL,
[customer_zipcode] [varchar] (60) NULL,
[credit_card_type_id] [varchar] (2) NULL,
[customer_credit_card_number] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_CUSTO__CD65CB85436C7D10] on [dbo].[DM_CUSTOMER]'
GO
ALTER TABLE [dbo].[DM_CUSTOMER] ADD CONSTRAINT [PK__DM_CUSTO__CD65CB85436C7D10] PRIMARY KEY CLUSTERED  ([customer_id])
GO
PRINT N'Creating [dbo].[DM_CUSTOMER_NOTES]'
GO
CREATE TABLE [dbo].[DM_CUSTOMER_NOTES]
(
[customer_id] [varchar] (10) NOT NULL,
[customer_firstname] [varchar] (60) NULL,
[customer_lastname] [varchar] (60) NULL,
[customer_notes_entry_date] [datetime] NOT NULL,
[customer_note] [varchar] (2000) NULL
)
GO
PRINT N'Creating index [cnInd1] on [dbo].[DM_CUSTOMER_NOTES]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [cnInd1] ON [dbo].[DM_CUSTOMER_NOTES] ([customer_id], [customer_notes_entry_date])
GO
PRINT N'Creating [dbo].[DM_CREDIT_CARD_TYPE]'
GO
CREATE TABLE [dbo].[DM_CREDIT_CARD_TYPE]
(
[credit_card_type_id] [varchar] (2) NOT NULL,
[credit_card_type_name] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_CREDI__F765300880ED0187] on [dbo].[DM_CREDIT_CARD_TYPE]'
GO
ALTER TABLE [dbo].[DM_CREDIT_CARD_TYPE] ADD CONSTRAINT [PK__DM_CREDI__F765300880ED0187] PRIMARY KEY CLUSTERED  ([credit_card_type_id])
GO
PRINT N'Creating [dbo].[DM_INVOICE]'
GO
CREATE TABLE [dbo].[DM_INVOICE]
(
[invoice_number] [varchar] (10) NOT NULL,
[invoice_date] [datetime] NULL,
[invoice_customer_id] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_INVOI__8081A63B4A21B92F] on [dbo].[DM_INVOICE]'
GO
ALTER TABLE [dbo].[DM_INVOICE] ADD CONSTRAINT [PK__DM_INVOI__8081A63B4A21B92F] PRIMARY KEY CLUSTERED  ([invoice_number])
GO
PRINT N'Creating [dbo].[DM_INVENTORY_ITEM]'
GO
CREATE TABLE [dbo].[DM_INVENTORY_ITEM]
(
[inventory_item_id] [varchar] (10) NOT NULL,
[inventory_item_name] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_INVEN__61D4B2B40A95F27D] on [dbo].[DM_INVENTORY_ITEM]'
GO
ALTER TABLE [dbo].[DM_INVENTORY_ITEM] ADD CONSTRAINT [PK__DM_INVEN__61D4B2B40A95F27D] PRIMARY KEY CLUSTERED  ([inventory_item_id])
GO
PRINT N'Creating [dbo].[demotable]'
GO
CREATE TABLE [dbo].[demotable]
(
[DemoId] [bigint] NOT NULL,
[DemoDescription] [nvarchar] (50) NULL,
[FirstName] [nvarchar] (30) NULL,
[LastName] [nvarchar] (50) NULL,
[DemoDate] [datetime] NULL,
[DemoAddress] [nvarchar] (50) NULL,
[ModifiedDate] [date] NULL,
[LastModifiedBy] [nvarchar] (15) NULL,
[DemoAddress2] [nvarchar] (25) NULL,
[DemoNotes] [nvarchar] (50) NULL,
[DemoFeedback] [nvarchar] (200) NULL,
[TableDescription] [nvarchar] (1000) NULL
)
GO
PRINT N'Creating primary key [PK__demotabl__977B80755E2EBDD1] on [dbo].[demotable]'
GO
ALTER TABLE [dbo].[demotable] ADD CONSTRAINT [PK__demotabl__977B80755E2EBDD1] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[SSF_USP_DemoTable]'
GO
CREATE PROCEDURE [dbo].[SSF_USP_DemoTable] AS
BEGIN
SELECT DemoId
     , DemoDescription
     FROM dbo.demotable
END

GO
PRINT N'Creating [dbo].[Customer]'
GO
CREATE TABLE [dbo].[Customer]
(
[CustId] [bigint] NOT NULL,
[CustFirstname] [nvarchar] (25) NULL,
[CustLastname] [nvarchar] (25) NULL,
[CustDescription] [nchar] (10) NULL,
[CustAddress] [nvarchar] (50) NULL,
[Last_Modified] [nvarchar] (50) NULL,
[Last_Changed_By] [nvarchar] (15) NULL,
[CustEmailAddress] [nvarchar] (25) NULL
)
GO
PRINT N'Creating primary key [PK__Customer__049E3AA9B86CDE0B] on [dbo].[Customer]'
GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK__Customer__049E3AA9B86CDE0B] PRIMARY KEY CLUSTERED  ([CustId])
GO
PRINT N'Creating [dbo].[USP_SSF_CUSTOMERS]'
GO
CREATE PROCEDURE [dbo].[USP_SSF_CUSTOMERS] AS
BEGIN
SELECT CustId, CustFirstname, CustLastname, CustDescription, CustAddress, Last_Modified, Last_Changed_By
FROM dbo.Customer;
END

GO
PRINT N'Creating [dbo].[ObjectTest]'
GO
CREATE TABLE [dbo].[ObjectTest]
(
[ObjectID] [bigint] NOT NULL,
[ObjectName] [nvarchar] (25) NULL,
[ObjectDesc] [nvarchar] (50) NULL,
[ObjectAdd] [nvarchar] (50) NULL,
[TestDescription] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__ObjectTe__9A6192B18CF93115] on [dbo].[ObjectTest]'
GO
ALTER TABLE [dbo].[ObjectTest] ADD CONSTRAINT [PK__ObjectTe__9A6192B18CF93115] PRIMARY KEY CLUSTERED  ([ObjectID])
GO
PRINT N'Creating [dbo].[USP_SSFObjectTest]'
GO
CREATE PROCEDURE [dbo].[USP_SSFObjectTest] AS
BEGIN
SELECT ObjectID
     , ObjectName
     , ObjectDesc
     , ObjectAdd FROM  dbo.ObjectTest
END

GO
PRINT N'Creating [dbo].[USP_ObjectTestSel]'
GO
CREATE PROCEDURE [dbo].[USP_ObjectTestSel] AS
BEGIN
select ObjectID
     , ObjectName
     
from dbo.ObjectTest;
END

GO
PRINT N'Creating [dbo].[WidgetPurchases]'
GO
CREATE TABLE [dbo].[WidgetPurchases]
(
[PurchaseID] [int] NOT NULL IDENTITY(1, 1),
[WidgetPriceID] [int] NOT NULL,
[Quantity] [int] NOT NULL CONSTRAINT [DF__WidgetPur__Quant__267ABA7A] DEFAULT ((1)),
[InvoiceNumber] [nvarchar] (20) NULL,
[Date] [datetime] NOT NULL CONSTRAINT [DF__WidgetPurc__Date__276EDEB3] DEFAULT (getdate()),
[Description] [nvarchar] (50) NULL,
[Last_Changed_By] [nvarchar] (50) NULL
)
GO
PRINT N'Creating index [IX_WidgetPurchases] on [dbo].[WidgetPurchases]'
GO
CREATE UNIQUE CLUSTERED INDEX [IX_WidgetPurchases] ON [dbo].[WidgetPurchases] ([PurchaseID])
GO
PRINT N'Creating [dbo].[usp_SSFPurchases]'
GO
CREATE PROCEDURE [dbo].[usp_SSFPurchases] AS
BEGIN
SELECT PurchaseID
     , Quantity
     , InvoiceNumber
     , Date
     FROM dbo.WidgetPurchases
END

GO
PRINT N'Creating [dbo].[Widgets]'
GO
CREATE TABLE [dbo].[Widgets]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[Description] [varchar] (50) NULL,
[SKU] [varchar] (20) NULL,
[SKUDescritp] [varchar] (50) NULL,
[Name] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Widgets] on [dbo].[Widgets]'
GO
ALTER TABLE [dbo].[Widgets] ADD CONSTRAINT [PK_Widgets] PRIMARY KEY NONCLUSTERED  ([RecordID])
GO
PRINT N'Creating [dbo].[USP_SSFWidgets]'
GO
CREATE PROCEDURE [dbo].[USP_SSFWidgets] AS
BEGIN
SELECT RecordID
     , Description
     , SKU
     , SKUDescritp
      FROM dbo.Widgets
END

GO
PRINT N'Creating [dbo].[WidgetPrices]'
GO
CREATE TABLE [dbo].[WidgetPrices]
(
[RecordID] [int] NOT NULL IDENTITY(1, 1),
[WidgetID] [int] NULL,
[Price] [money] NULL,
[ValidFrom] [datetime] NULL CONSTRAINT [DF_WidgetPrices_ValidFrom] DEFAULT (getdate()),
[ValidTo] [datetime] NULL,
[Active] [char] (1) NULL CONSTRAINT [DF_WidgetPrices_Active] DEFAULT ('N'),
[Last_Modified] [datetime] NULL
)
GO
PRINT N'Creating primary key [PK_WidgetPrices] on [dbo].[WidgetPrices]'
GO
ALTER TABLE [dbo].[WidgetPrices] ADD CONSTRAINT [PK_WidgetPrices] PRIMARY KEY NONCLUSTERED  ([RecordID])
GO
PRINT N'Creating index [IX_WidgetPrices_1] on [dbo].[WidgetPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_WidgetPrices_1] ON [dbo].[WidgetPrices] ([ValidFrom])
GO
PRINT N'Creating index [IX_WidgetPrices_2] on [dbo].[WidgetPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_WidgetPrices_2] ON [dbo].[WidgetPrices] ([ValidTo])
GO
PRINT N'Creating index [IX_WidgetPrices] on [dbo].[WidgetPrices]'
GO
CREATE NONCLUSTERED INDEX [IX_WidgetPrices] ON [dbo].[WidgetPrices] ([WidgetID])
GO
PRINT N'Creating [dbo].[WidgetPriceList]'
GO


-- Create indexed view

CREATE VIEW [dbo].[WidgetPriceList]
WITH SCHEMABINDING 
AS
SELECT     dbo.Widgets.RecordID, dbo.Widgets.Description AS Widget, dbo.WidgetPrices.Price
FROM       dbo.Widgets INNER JOIN
           dbo.WidgetPrices ON dbo.Widgets.RecordID = dbo.WidgetPrices.RecordID
		   WHERE Price <= '$2:00'
GO
PRINT N'Creating [dbo].[USP_GetObject]'
GO
CREATE PROCEDURE [dbo].[USP_GetObject] AS
BEGIN
SELECT
    ObjectID,
    ObjectName,
    ObjectDesc,
    ObjectAdd
FROM
    dbo.ObjectTest;
END

GO
PRINT N'Creating [dbo].[project]'
GO
CREATE TABLE [dbo].[project]
(
[projectID] [bigint] NOT NULL,
[projectDescription] [nvarchar] (50) NULL,
[projectName] [nvarchar] (50) NULL,
[projectOwner] [nvarchar] (50) NULL,
[projectItem] [nvarchar] (100) NULL,
[lastModified] [datetime2] NULL
)
GO
PRINT N'Creating primary key [PK__project__11F14D8522BBD6BF] on [dbo].[project]'
GO
ALTER TABLE [dbo].[project] ADD CONSTRAINT [PK__project__11F14D8522BBD6BF] PRIMARY KEY CLUSTERED  ([projectID])
GO
PRINT N'Creating [dbo].[USP_GetProject]'
GO
CREATE PROCEDURE [dbo].[USP_GetProject] AS
BEGIN
SELECT projectID, projectDescription, projectOwner, projectItem, projectName, lastModified
FROM dbo.project;
END

GO
PRINT N'Creating [dbo].[usp_GetPurchase]'
GO
CREATE PROCEDURE [dbo].[usp_GetPurchase] AS
BEGIN
SELECT PurchaseID, WidgetPriceID, Quantity, InvoiceNumber, Date, Description FROM dbo.WidgetPurchases
END

GO
PRINT N'Creating [dbo].[USP_GetPurchases]'
GO
CREATE PROCEDURE [dbo].[USP_GetPurchases] AS
BEGIN
SELECT PurchaseID, WidgetPriceID, Quantity, InvoiceNumber, Date, Description
FROM dbo.WidgetPurchases;
END

GO
PRINT N'Creating [dbo].[Account]'
GO
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
PRINT N'Adding constraints to [dbo].[Account]'
GO
ALTER TABLE [dbo].[Account] ADD CONSTRAINT [UQ__Account__7E0C69C9522A6707] UNIQUE NONCLUSTERED  ([RED_Gate_ID])
GO
PRINT N'Creating [dbo].[Account_FF]'
GO
CREATE TABLE [dbo].[Account_FF]
(
[﻿ID] [nvarchar] (50) NULL,
[ISDELETED] [bit] NULL,
[MASTERRECORDID] [nvarchar] (50) NULL,
[NAME] [nvarchar] (255) NULL,
[TYPE] [nvarchar] (50) NULL,
[RECORDTYPEID] [nvarchar] (50) NULL,
[PARENTID] [nvarchar] (50) NULL,
[BILLINGSTREET] [nvarchar] (255) NULL,
[BILLINGCITY] [nvarchar] (50) NULL,
[BILLINGSTATE] [nvarchar] (80) NULL,
[BILLINGPOSTALCODE] [nvarchar] (50) NULL,
[BILLINGCOUNTRY] [nvarchar] (80) NULL,
[BILLINGSTATECODE] [nvarchar] (50) NULL,
[BILLINGCOUNTRYCODE] [nvarchar] (50) NULL,
[BILLINGLATITUDE] [int] NULL,
[BILLINGLONGITUDE] [int] NULL,
[BILLINGGEOCODEACCURACY] [nvarchar] (50) NULL,
[BILLINGADDRESS] [nvarchar] (1000) NULL,
[PHONE] [nvarchar] (50) NULL,
[FAX] [nvarchar] (50) NULL,
[ACCOUNTNUMBER] [nvarchar] (50) NULL,
[WEBSITE] [nvarchar] (255) NULL,
[PHOTOURL] [nvarchar] (255) NULL,
[INDUSTRY] [nvarchar] (50) NULL,
[ANNUALREVENUE] [nvarchar] (255) NULL,
[NUMBEROFEMPLOYEES] [nvarchar] (255) NULL,
[OWNERSHIP] [nvarchar] (50) NULL,
[TICKERSYMBOL] [nvarchar] (255) NULL,
[DESCRIPTION] [nvarchar] (1300) NULL,
[CURRENCYISOCODE] [nvarchar] (50) NULL,
[OWNERID] [nvarchar] (50) NULL,
[CREATEDDATE] [datetime] NULL,
[CREATEDBYID] [nvarchar] (50) NULL,
[LASTMODIFIEDDATE] [datetime] NULL,
[LASTMODIFIEDBYID] [nvarchar] (50) NULL,
[SYSTEMMODSTAMP] [datetime] NULL,
[LASTACTIVITYDATE] [datetime] NULL,
[LASTVIEWEDDATE] [datetime] NULL,
[LASTREFERENCEDDATE] [datetime] NULL,
[ISPARTNER] [bit] NULL,
[ISCUSTOMERPORTAL] [bit] NULL,
[JIGSAW] [nvarchar] (50) NULL,
[JIGSAWCOMPANYID] [nvarchar] (50) NULL,
[ACCOUNTSOURCE] [nvarchar] (50) NULL,
[SICDESC] [nvarchar] (80) NULL,
[SUPPORT_PIN_CODE__C] [nvarchar] (50) NULL,
[SUPPORT_LEVEL_ESBU__C] [nvarchar] (255) NULL,
[ACCOUNT_NUMBER__C] [nvarchar] (50) NULL,
[ACCOUNT_PRIORITY__C] [nvarchar] (255) NULL,
[ACCOUNT_TYPE__C] [nvarchar] (255) NULL,
[APPROVED_AGENT__C] [nvarchar] (255) NULL,
[CCBU_SUPPORT_LEVEL__C] [nvarchar] (255) NULL,
[COMPANY_SIZE__C] [nvarchar] (255) NULL,
[CREDIT_LIMIT__C] [nvarchar] (100) NULL,
[CUSTOMER_PHASE_COMMERCIAL_DATE__C] [datetime] NULL,
[CUSTOMER_PHASE_SETUP_DATE__C] [datetime] NULL,
[CUSTOMER_PHASE_TRIAL_DATE__C] [datetime] NULL,
[CUSTOMER_PHASE__C] [nvarchar] (255) NULL,
[CUSTOMER_REFERENCE_ID__C] [nvarchar] (50) NULL,
[DEFAULT_PRICE_BOOK__C] [nvarchar] (50) NULL,
[ENABLE_BANDWIDTH_THROTTLING__C] [bit] NULL,
[ENTERPRISE__C] [bit] NULL,
[ZUORA__ACTIVE__C] [nvarchar] (255) NULL,
[FINANCE_APPROVED__C] [bit] NULL,
[GLOBAL_STRATEGIC_ACCOUNT__C] [nvarchar] (50) NULL,
[INCO_TERMS__C] [nvarchar] (255) NULL,
[JDE_ADDRESS__C] [nvarchar] (255) NULL,
[LAST_CASE_THAT_CONSUMED_TOKEN__C] [nvarchar] (255) NULL,
[LEAD_SOURCE_MOST_RECENT__C] [nvarchar] (255) NULL,
[LEAD_SOURCE_ORIGINAL__C] [nvarchar] (255) NULL,
[LEAD_SOURCE_SALES__C] [nvarchar] (255) NULL,
[LEGACY_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[MSA_ATTACHED__C] [bit] NULL,
[NUMBER_OF_TOKENS__C] [int] NULL,
[PRIMARY_SALES_OWNER__C] [nvarchar] (50) NULL,
[PRIMARY_SUPPORT_QUEUE__C] [nvarchar] (255) NULL,
[PRIORITY__C] [nvarchar] (255) NULL,
[REGION__C] [nvarchar] (255) NULL,
[SECTOR_ESBU__C] [nvarchar] (255) NULL,
[SIERRA_ID__C] [nvarchar] (255) NULL,
[JOINT_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[SUB_TYPE__C] [nvarchar] (255) NULL,
[SUPPORT_QUEUE_OVERRIDE__C] [nvarchar] (255) NULL,
[TARGET_ACCOUNT__C] [bit] NULL,
[USAGE_ALERT_EMAIL_DISTRIBUTION__C] [nvarchar] (1300) NULL,
[ACCESS_LEVEL__C] [nvarchar] (255) NULL,
[ACCOUNT_OWNER_FULL_NAME__C] [nvarchar] (255) NULL,
[BILLING_CONTACT__C] [nvarchar] (50) NULL,
[MCS_ID__C] [nvarchar] (50) NULL,
[SITE_LOCATION_ID__C] [nvarchar] (255) NULL,
[DUPLICATE_GROUP__C] [int] NULL,
[DUPLICATE_SCORE__C] [int] NULL,
[POTENTIAL_DUPLICATE__C] [nvarchar] (255) NULL,
[RECORD_CHECKED__C] [nvarchar] (255) NULL,
[ACCEL_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[ORACLE_EXTERNAL_ID__C] [nvarchar] (255) NULL,
[EXTERNAL_ID__C] [nvarchar] (255) NULL,
[DATA_QUALITY_DESCRIPTION__C] [nvarchar] (1300) NULL,
[DATA_QUALITY_SCORE__C] [int] NULL,
[DUPCHECK__DC3DISABLEDUPLICATECHECK__C] [nvarchar] (255) NULL,
[DUPCHECK__DC3INDEX__C] [nvarchar] (255) NULL,
[ZUORA__CUSTOMERPRIORITY__C] [nvarchar] (255) NULL,
[ZUORA__NUMBEROFLOCATIONS__C] [int] NULL,
[ZUORA__SLAEXPIRATIONDATE__C] [datetime] NULL,
[ZUORA__SLASERIALNUMBER__C] [nvarchar] (255) NULL,
[ZUORA__SLA__C] [nvarchar] (255) NULL,
[ZUORA__UPSELLOPPORTUNITY__C] [nvarchar] (255) NULL,
[OLD_BILLING_STATE__C] [nvarchar] (255) NULL,
[OLD_BILLING_COUNTRY__C] [nvarchar] (255) NULL,
[BILLING_COUNTRY_NAME] [nvarchar] (255) NULL,
[BILLING_COUNTRY_CODE] [nvarchar] (255) NULL,
[BILLING_STATE_NAME] [nvarchar] (255) NULL,
[BILLING_STATE_CODE] [nvarchar] (255) NULL,
[RED_Gate_ID] [nvarchar] (255) NOT NULL
)
GO
PRINT N'Adding constraints to [dbo].[Account_FF]'
GO
ALTER TABLE [dbo].[Account_FF] ADD CONSTRAINT [UQ__Account___7E0C69C99E820764] UNIQUE NONCLUSTERED  ([RED_Gate_ID])
GO
PRINT N'Creating [dbo].[Contacts]'
GO
CREATE TABLE [dbo].[Contacts]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (100) NULL,
[PhoneWork] [nvarchar] (25) NULL,
[PhoneMobile] [nvarchar] (25) NULL,
[Address1] [nvarchar] (128) NULL,
[Address2] [nvarchar] (128) NULL,
[Address3] [nvarchar] (128) NULL,
[JoiningDate] [datetime] NULL CONSTRAINT [DF__Contacts__Joinin__29572725] DEFAULT (getdate()),
[Email] [nvarchar] (256) NULL,
[Description] [nvarchar] (62) NULL,
[PhoneHome] [nvarchar] (25) NULL,
[LastModifiedBy] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Contacts] on [dbo].[Contacts]'
GO
ALTER TABLE [dbo].[Contacts] ADD CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED  ([ID])
GO
PRINT N'Creating [dbo].[DMSSTAT_RSTATS]'
GO
CREATE TABLE [dbo].[DMSSTAT_RSTATS]
(
[runid] [varchar] (250) NOT NULL,
[ruleid] [varchar] (50) NOT NULL,
[ruleblock] [int] NOT NULL,
[rulenum] [int] NOT NULL,
[rulesubscript] [int] NOT NULL,
[ruletype] [varchar] (50) NOT NULL,
[rulecreated] [datetime] NOT NULL,
[ruleupdated] [datetime] NOT NULL,
[secondsactive] [int] NOT NULL,
[rulestatus] [char] (1) NOT NULL,
[rulesource] [varchar] (250) NULL,
[ruletarget] [varchar] (250) NULL,
[rowoperations] [int] NULL,
[coloperations] [int] NULL,
[rulePrevRPN] [int] NULL,
[ruleRPN] [int] NULL
)
GO
PRINT N'Creating index [IX_DMSSTAT_RSTATS] on [dbo].[DMSSTAT_RSTATS]'
GO
CREATE NONCLUSTERED INDEX [IX_DMSSTAT_RSTATS] ON [dbo].[DMSSTAT_RSTATS] ([runid], [ruleid])
GO
PRINT N'Creating [dbo].[DMSSTAT_TSTATS]'
GO
CREATE TABLE [dbo].[DMSSTAT_TSTATS]
(
[runid] [varchar] (250) NOT NULL,
[ruleid] [varchar] (50) NOT NULL,
[statscreated] [datetime] NOT NULL,
[statsupdated] [datetime] NOT NULL,
[ruletype] [varchar] (50) NOT NULL,
[ruleblock] [int] NOT NULL,
[rulenum] [int] NOT NULL,
[rulesubscript] [int] NOT NULL,
[controllerid] [varchar] (50) NULL,
[tabledatabase] [varchar] (250) NOT NULL,
[tableschema] [varchar] (250) NOT NULL,
[tablename] [varchar] (250) NOT NULL,
[tablecolumn] [varchar] (250) NULL,
[rowoperations] [int] NULL,
[coloperations] [int] NULL
)
GO
PRINT N'Creating index [IX_DMSSTAT_TSTATS_A] on [dbo].[DMSSTAT_TSTATS]'
GO
CREATE NONCLUSTERED INDEX [IX_DMSSTAT_TSTATS_A] ON [dbo].[DMSSTAT_TSTATS] ([runid], [ruleid])
GO
PRINT N'Creating [dbo].[DMS_AUDITTAB]'
GO
CREATE TABLE [dbo].[DMS_AUDITTAB]
(
[runid] [varchar] (100) NOT NULL,
[ruleid] [varchar] (50) NOT NULL,
[rulestatus] [char] (1) NULL,
[rulecreated] [datetime] NOT NULL,
[ruleupdated] [datetime] NULL,
[ruleblock] [int] NULL,
[rulenum] [int] NULL,
[rulesubscript] [int] NULL,
[ruletype] [varchar] (50) NULL,
[ruletarget] [varchar] (250) NULL,
[rstat1] [int] NULL,
[rstat2] [int] NULL,
[rstat3] [int] NULL,
[rstat4] [decimal] (18, 0) NULL,
[rstat5] [datetime] NULL,
[rstat6] [varchar] (50) NULL
)
GO
PRINT N'Creating index [IX_DMS_AUDITTAB] on [dbo].[DMS_AUDITTAB]'
GO
CREATE NONCLUSTERED INDEX [IX_DMS_AUDITTAB] ON [dbo].[DMS_AUDITTAB] ([runid], [ruleid])
GO
PRINT N'Creating [dbo].[DM_ASSIGNMENT]'
GO
CREATE TABLE [dbo].[DM_ASSIGNMENT]
(
[assignment_id] [int] NOT NULL,
[person_id] [int] NOT NULL,
[emp_id] [varchar] (10) NULL,
[emp_jobtitle] [varchar] (100) NULL,
[assignment_notes] [varchar] (1000) NULL
)
GO
PRINT N'Creating index [asgnInd1] on [dbo].[DM_ASSIGNMENT]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [asgnInd1] ON [dbo].[DM_ASSIGNMENT] ([person_id], [assignment_id])
GO
PRINT N'Creating [dbo].[DM_CUSTOMER_ASXML_IDAttr]'
GO
CREATE TABLE [dbo].[DM_CUSTOMER_ASXML_IDAttr]
(
[customer_id] [varchar] (10) NOT NULL,
[customer_data] [xml] NULL
)
GO
PRINT N'Creating primary key [PK_DM_CUSTOMER_ASXML_IDAttr] on [dbo].[DM_CUSTOMER_ASXML_IDAttr]'
GO
ALTER TABLE [dbo].[DM_CUSTOMER_ASXML_IDAttr] ADD CONSTRAINT [PK_DM_CUSTOMER_ASXML_IDAttr] PRIMARY KEY CLUSTERED  ([customer_id])
GO
PRINT N'Creating [dbo].[DM_CUSTOMER_CONTACTS]'
GO
CREATE TABLE [dbo].[DM_CUSTOMER_CONTACTS]
(
[CONTACT_ID] [int] NOT NULL IDENTITY(1, 1),
[CONTACT_PERSON] [xml] NOT NULL CONSTRAINT [DF__DM_CUSTOM__CONTA__2F10007B] DEFAULT ('<Company />')
)
GO
PRINT N'Creating primary key [PK__DM_CUSTO__99DE42589D78F054] on [dbo].[DM_CUSTOMER_CONTACTS]'
GO
ALTER TABLE [dbo].[DM_CUSTOMER_CONTACTS] ADD CONSTRAINT [PK__DM_CUSTO__99DE42589D78F054] PRIMARY KEY CLUSTERED  ([CONTACT_ID])
GO
PRINT N'Creating [dbo].[DM_SUPPLIERS]'
GO
CREATE TABLE [dbo].[DM_SUPPLIERS]
(
[supplier_id] [int] NOT NULL,
[supplier_name] [varchar] (60) NULL
)
GO
PRINT N'Creating primary key [PK__DM_SUPPL__6EE594E8DCB13634] on [dbo].[DM_SUPPLIERS]'
GO
ALTER TABLE [dbo].[DM_SUPPLIERS] ADD CONSTRAINT [PK__DM_SUPPL__6EE594E8DCB13634] PRIMARY KEY CLUSTERED  ([supplier_id])
GO
PRINT N'Creating [dbo].[HelloDemo]'
GO
CREATE TABLE [dbo].[HelloDemo]
(
[DemoId] [bigint] NOT NULL,
[DemoFName] [nvarchar] (25) NULL,
[DemoDescription] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__HelloDem__977B8075C276CD8C] on [dbo].[HelloDemo]'
GO
ALTER TABLE [dbo].[HelloDemo] ADD CONSTRAINT [PK__HelloDem__977B8075C276CD8C] PRIMARY KEY CLUSTERED  ([DemoId])
GO
PRINT N'Creating [dbo].[HelloWorld]'
GO
CREATE TABLE [dbo].[HelloWorld]
(
[HelloId] [bigint] NOT NULL,
[HelloDesc] [nvarchar] (25) NULL,
[LastModified] [date] NULL,
[LastModifiedBy] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__HelloWor__02FA286F20B6257F] on [dbo].[HelloWorld]'
GO
ALTER TABLE [dbo].[HelloWorld] ADD CONSTRAINT [PK__HelloWor__02FA286F20B6257F] PRIMARY KEY CLUSTERED  ([HelloId])
GO
PRINT N'Creating [dbo].[PersonTest]'
GO
CREATE TABLE [dbo].[PersonTest]
(
[PersonId] [bigint] NOT NULL,
[PersonName] [nvarchar] (40) NULL,
[PersonDOB] [date] NULL,
[PersonAddress] [nvarchar] (50) NULL,
[EmailAddress] [nvarchar] (50) NULL,
[PersonState] [nchar] (2) NULL,
[CountryCode] [nchar] (2) NULL,
[LastModified] [datetime2] NULL,
[LastModifiedBy] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__PersonTe__AA2FFBE59FB67109] on [dbo].[PersonTest]'
GO
ALTER TABLE [dbo].[PersonTest] ADD CONSTRAINT [PK__PersonTe__AA2FFBE59FB67109] PRIMARY KEY CLUSTERED  ([PersonId])
GO
PRINT N'Creating [dbo].[TestTable1]'
GO
CREATE TABLE [dbo].[TestTable1]
(
[testid] [bigint] NOT NULL,
[testName] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__TestTabl__A29AFFE0BAB6A9B1] on [dbo].[TestTable1]'
GO
ALTER TABLE [dbo].[TestTable1] ADD CONSTRAINT [PK__TestTabl__A29AFFE0BAB6A9B1] PRIMARY KEY CLUSTERED  ([testid])
GO
PRINT N'Creating [dbo].[TestTable]'
GO
CREATE TABLE [dbo].[TestTable]
(
[TestId] [bigint] NOT NULL,
[TestName] [nvarchar] (25) NULL,
[TestDescription] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__TestTabl__8CC33160C9CCD1F4] on [dbo].[TestTable]'
GO
ALTER TABLE [dbo].[TestTable] ADD CONSTRAINT [PK__TestTabl__8CC33160C9CCD1F4] PRIMARY KEY CLUSTERED  ([TestId])
GO
PRINT N'Creating [dbo].[WidgetDescriptions]'
GO
CREATE TABLE [dbo].[WidgetDescriptions]
(
[WidgetID] [int] NOT NULL,
[ShortDescription] [nvarchar] (2000) NULL,
[Description] [text] NULL,
[Picture] [image] NULL,
[Description2] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_WidgetDescriptions] on [dbo].[WidgetDescriptions]'
GO
ALTER TABLE [dbo].[WidgetDescriptions] ADD CONSTRAINT [PK_WidgetDescriptions] PRIMARY KEY CLUSTERED  ([WidgetID])
GO
PRINT N'Creating [dbo].[WidgetReferences]'
GO
CREATE TABLE [dbo].[WidgetReferences]
(
[WidgetID] [int] NOT NULL,
[Reference] [varchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_WidgetReferences] on [dbo].[WidgetReferences]'
GO
ALTER TABLE [dbo].[WidgetReferences] ADD CONSTRAINT [PK_WidgetReferences] PRIMARY KEY NONCLUSTERED  ([WidgetID])
GO
PRINT N'Creating [dbo].[customersDemo]'
GO
CREATE TABLE [dbo].[customersDemo]
(
[CustID] [bigint] NOT NULL,
[CustDesc] [nvarchar] (25) NULL,
[CustName] [nvarchar] (50) NULL,
[CustDOB] [date] NULL,
[EmailAddress] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK__customer__049E3A89295CB0A4] on [dbo].[customersDemo]'
GO
ALTER TABLE [dbo].[customersDemo] ADD CONSTRAINT [PK__customer__049E3A89295CB0A4] PRIMARY KEY CLUSTERED  ([CustID])
GO
PRINT N'Creating [dbo].[USP_SSFTestResults]'
GO
CREATE PROCEDURE [dbo].[USP_SSFTestResults]
AS BEGIN
    SELECT Id, Class, TestCase, Name, TranName, Result, Msg, TestStartTime, TestEndTime
    FROM tSQLt.TestResult;
END;
GO
PRINT N'Creating [dbo].[usp_GetTestObject]'
GO
CREATE PROCEDURE [dbo].[usp_GetTestObject] AS
BEGIN
SELECT objectDescription, ObjectName FROM dbo.NewTestObject
END

GO
PRINT N'Adding foreign keys to [dbo].[DM_CUSTOMER]'
GO
ALTER TABLE [dbo].[DM_CUSTOMER] ADD CONSTRAINT [CU_FK] FOREIGN KEY ([credit_card_type_id]) REFERENCES [dbo].[DM_CREDIT_CARD_TYPE] ([credit_card_type_id])
GO
PRINT N'Adding foreign keys to [dbo].[DM_CUSTOMER_NOTES]'
GO
ALTER TABLE [dbo].[DM_CUSTOMER_NOTES] ADD CONSTRAINT [CN_FK] FOREIGN KEY ([customer_id]) REFERENCES [dbo].[DM_CUSTOMER] ([customer_id])
GO
PRINT N'Adding foreign keys to [dbo].[DM_INVOICE_LINE]'
GO
ALTER TABLE [dbo].[DM_INVOICE_LINE] ADD CONSTRAINT [I4_FK] FOREIGN KEY ([inventory_item_id]) REFERENCES [dbo].[DM_INVENTORY_ITEM] ([inventory_item_id])
GO
ALTER TABLE [dbo].[DM_INVOICE_LINE] ADD CONSTRAINT [I3_FK] FOREIGN KEY ([invoice_number]) REFERENCES [dbo].[DM_INVOICE] ([invoice_number])
GO
