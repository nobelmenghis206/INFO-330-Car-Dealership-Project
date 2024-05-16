CREATE DATABASE CarDealership;
GO

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS VehicleName;
DROP TABLE IF EXISTS SalesPerson;
DROP TABLE IF EXISTS SalesPersonVehicle;
DROP TABLE IF EXISTS Warranty;
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS Service;

CREATE TABLE Customer (
  Customer_ID INT IDENTITY(1,1) PRIMARY KEY,
  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Gender VARCHAR(10) NOT NULL
);

CREATE TABLE VehicleName (
  Vehicle_ID INT IDENTITY(1,1) PRIMARY KEY,
  Customer_ID INT NOT NULL,
  Warranty_ID INT NOT NULL,
  Make VARCHAR(50) NOT NULL,
  Model VARCHAR(50) NOT NULL,
  Year INT NOT NULL,
  Status BIT NOT NULL
);

CREATE TABLE SalesPersons (
  Sales_Person_ID INT PRIMARY KEY,
  Date_Employed DATE NOT NULL,
  Email VARCHAR(100) NOT NULL,
);

CREATE TABLE SalesPersonVehicle (
    Vehicle_ID INT NOT NULL,
    Sales_Person_ID INT NOT NULL,
    PRIMARY KEY (Vehicle_ID, Sales_Person_ID)
);

CREATE TABLE Warranty (
  Warranty_ID INT IDENTITY(1,1) PRIMARY KEY,
  Vehicle_ID INT NOT NULL,
  Service_ID INT NOT NULL,
  Sales_Person_Warranty INT NOT NULL,
  Coverage_Amount DECIMAL(10, 2) NOT NULL,
  Date_Start DATE NOT NULL,
  Date_Expire DATE NOT NULL
);

CREATE TABLE Feedback (
  Feedback_ID INT IDENTITY(1,1) PRIMARY KEY,
  Sales_Person_ID INT NOT NULL,
  Customer_ID INT NOT NULL,
);

CREATE TABLE Service (
  Service_ID INT IDENTITY(1,1) PRIMARY KEY,
  Vehicle_ID INT NOT NULL,
  Warranty_ID INT NOT NULL,
  Cost DECIMAL(10, 2),
  Description TEXT,
);

ALTER TABLE Warranty
ADD CONSTRAINT FK_Vehicle_ID FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    CONSTRAINT FK_Service_IDD OREIGN KEY (Service_ID) REFERENCES Service(Service_ID)

ALTER  Vehicle
ADD CONSTRAINT FK_Customer_ID FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
  CONSTRAINT FK_Sales_Person_ID FORIEGN KEY (Sales_Person_ID) REFERENCES SalesPerson(Sales_Person_ID)
  CONSTRAINT FK_Vehicle_Warranty FOREIGN KEY (Warranty_ID) REFERENCES Warranty(Warranty_ID);


ADD CONSTRAINT SalesPerson FOREIGN KEY (Sales_Person_Vehicle) REFERENCES SalesPersonVehicle(Sales_Person_ID)
    FOREIGN KEY (Customere_ID) REFERENCES (CustomeryCustomery_ID)
    FOREIGN KEY (Feedback_ID) REFERENCES Feedback(Feedback_ID);

ADD CONSTRAINT SalesPersonVehicle FOREIGN KEY(Vehicle_ID) REFERENCES VehicleName(Vehicle_ID)
    FOREIGN KEY Sales_Person_ID REFERENCES SalesPersonVehicle(Sales_Person_ID);
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);

ALTER TABLE Service
ADD CONSTRAINT FK_Service_Vehicle FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    CONSTRAINT FK_Service_Warranty FOREIGN KEY (Warranty_ID) REFERENCES Warranty(Warranty_ID);

ALTER TABLE Feedback
ADD CONSTRAINT FK_Feedback_SalesPerson FOREIGN KEY (Sales_Person_ID) REFERENCES SalesPerson(SalesPersonID),
    CONSTRAINT FK_Feedback_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);

ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Vehicle FOREIGN KEY (Vehicle_ID) REFERENCES Vehicle(Vehicle_ID),
    CONSTRAINT FK_Customer_SalesPerson FOREIGN KEY (Sales_Person_ID) REFERENCES SalesPerson(Sales_Person_ID),
    CONSTRAINT FK_Customer_Service FOREIGN KEY (Service_ID) REFERENCES Service(Service_ID);

GO