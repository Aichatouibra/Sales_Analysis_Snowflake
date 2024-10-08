-- setup.sql

-- Crée la base de données et le schéma pour le projet

CREATE DATABASE IF NOT EXISTS test_db;
USE DATABASE test_db;
CREATE SCHEMA IF NOT EXISTS test_db_schema;
USE SCHEMA test_db_schema;
-- Crée les tables de dimensions et de faits
CREATE
OR REPLACE TABLE DimDate (
    DateID INT PRIMARY KEY,
    Date DATE,
    DayOfWeek VARCHAR(10),
    Month VARCHAR(10),
    Quarter INT,
    Year INT,
    IsWeekend BOOLEAN
);
CREATE
OR REPLACE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY AUTOINCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Email VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50),
    LoyaltyProgramID INT
);
CREATE
OR REPLACE TABLE DimProduct (
    ProductID INT PRIMARY KEY AUTOINCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);
CREATE
OR REPLACE TABLE DimStore (
    StoreID INT PRIMARY KEY AUTOINCREMENT,
    StoreName VARCHAR(100),
    StoreType VARCHAR(50),
    StoreOpeningDate DATE,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50),
    ManagerName VARCHAR(100)
);
CREATE
OR REPLACE TABLE DimLoyaltyProgram (
    LoyaltyProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(100),
    ProgramTier VARCHAR(50),
    PointsAccrued INT
);
CREATE
OR REPLACE TABLE FactOrders (
    OrderID INT PRIMARY KEY AUTOINCREMENT,
    DateID INT,
    CustomerID INT,
    ProductID INT,
    StoreID INT,
    QuantityOrdered INT,
    OrderAmount DECIMAL(10, 2),
    DiscountAmount DECIMAL(10, 2),
    ShippingCost DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (StoreID) REFERENCES DimStore(StoreID)
);