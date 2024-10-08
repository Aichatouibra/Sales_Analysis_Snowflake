-- load_data.sql

-- Création d'un format de fichier CSV pour le chargement des données

CREATE OR REPLACE FILE FORMAT CSV_SOURCE_FILE_FORMAT
    TYPE = 'CSV'
    SKIP_HEADER = 1
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    DATE_FORMAT = 'YYYY-MM-DD';

    
-- Création d'un stage pour charger les fichiers

CREATE OR REPLACE STAGE TESTSTAGE;


-- Chargement des données dans DimCustomer

PUT 'file://C:/Users/aicha/Downloads/EndtoEndSalesProject-master/EndtoEndSalesProject-master/One Time Load/DimCustomer/DimCustomerData.csv' @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/ DimCustomerData/ AUTO_COMPRESS=FALSE;

COPY INTO DimCustomer(FirstName, LastName, DateOfBirth, Gender, Email, Address, City, State, ZipCode, Country, LoyaltyProgramID)
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimCustomerData/DimCustomerData.csv
FILE_FORMAT = (FORMAT_NAME = 'CSV_SOURCE_FILE_FORMAT');


-- Répéter les étapes PUT et COPY INTO pour chaque table...

PUT 'file://C:/Users/aicha/Downloads/EndtoEndSalesProject-master/EndtoEndSalesProject-master/One Time Load/DimDate/DimDate.csv'@TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimDate/ AUTO_COMPRESS=FALSE;

COPY INTO DimDate(DateID,Date,DayOfWeek,Month,Quarter,Year,IsWeekend)
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimDate/DimDate.csv
FILE_FORMAT = (FORMAT_NAME ='CSV_SOURCE_FILE_FORMAT');


PUT 'file://"C:/Users/aicha/Downloads/EndtoEndSalesProject-master/EndtoEndSalesProject-master/One Time Load/DimLoyalty/DimLoyaltyInfo.csv"' @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimLoyaltyInfo/ AUTO_COMPRESS=FALSE;

COPY INTO DimLoyaltyProgram
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimLoyaltyInfo/DimLoyaltyInfo.csv
FILE_FORMAT = (FORMAT_NAME ='CSV_SOURCE_FILE_FORMAT');
TEST_DB.TEST_DB_SCHEMA.TESTSTAGE


PUT 'file://C:/Users/aicha/Downloads/EndtoEndSalesProject-master/EndtoEndSalesProject-master/One Time Load/DimProduct/DimProductData.csv' @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimProductData/ AUTO_COMPRESS=FALSE;

COPY INTO DimProduct (ProductName,Category,Brand,UnitPrice)
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimProductData/DimProductData.csv
FILE_FORMAT = (FORMAT_NAME ='CSV_SOURCE_FILE_FORMAT');


PUT 'file://C:/Users/aicha/Downloads/EndtoEndSalesProject-master/EndtoEndSalesProject-master/One Time Load/DimStore/DimStoreData.csv' @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimStoreData/ AUTO_COMPRESS=FALSE;

COPY INTO DimStore(StoreName,StoreType,StoreOpeningDate,Address,City,State,Country,Region,ManagerName)
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/DimStoreData/DimStoreData.csv
FILE_FORMAT = (FORMAT_NAME ='CSV_SOURCE_FILE_FORMAT');


PUT 'file://C:/Users/aicha/Downloads/EndtoEndSalesProject-master/EndtoEndSalesProject-master/One Time Load/Fact Orders/factorders.csv' @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/factorders/ AUTO_COMPRESS=FALSE;

COPY INTO FactOrders(DateID,CustomerID,ProductID,StoreID,QuantityOrdered,OrderAmount,DiscountAmount,ShippingCost,TotalAmount)
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/factorders/factorders.csv
FILE_FORMAT = (FORMAT_NAME ='CSV_SOURCE_FILE_FORMAT');


PUT 'file://C:/Users/aicha/OneDrive/Bureau/EndtoEndSalesProject-master/Landing Directory/*.csv' @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/Landing_Directory/ AUTO_COMPRESS=FALSE;

COPY INTO FactOrders(DateID, CustomerID, ProductID, StoreID, QuantityOrdered, OrderAmount, DiscountAmount, ShippingCost, TotalAmount)
FROM @TEST_DB.TEST_DB_SCHEMA.TESTSTAGE/Landing_Directory/
FILE_FORMAT = (FORMAT_NAME ='CSV_SOURCE_FILE_FORMAT');