CREATE DATABASE IF NOT EXISTS HousingService;
USE HousingService;

-- Landlord table
CREATE TABLE Landlord (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    CellPhone VARCHAR(20),
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_name (FirstName, LastName),
    INDEX idx_email (Email),
    INDEX idx_phone (CellPhone)
);

-- House table
CREATE TABLE House (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    LandlordID INT NOT NULL,
    Address VARCHAR(500) NOT NULL,
    MaxOccupant INT NOT NULL DEFAULT 1,
    Description TEXT,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (LandlordID) REFERENCES Landlord(ID) ON DELETE CASCADE,
    INDEX idx_landlord_id (LandlordID),
    INDEX idx_address (Address(100)),
    INDEX idx_max_occupant (MaxOccupant)
);

-- Facility table
CREATE TABLE Facility (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HouseID INT NOT NULL,
    Type VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    Description TEXT,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (HouseID) REFERENCES House(ID) ON DELETE CASCADE,
    INDEX idx_house_id (HouseID),
    INDEX idx_type (Type),
    INDEX idx_quantity (Quantity)
);

-- FacilityReport table
CREATE TABLE FacilityReport (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FacilityID INT NOT NULL,
    EmployeeID VARCHAR(100) NOT NULL,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (FacilityID) REFERENCES Facility(ID) ON DELETE CASCADE,
    INDEX idx_facility_id (FacilityID),
    INDEX idx_employee_id (EmployeeID),
    INDEX idx_title (Title),
    INDEX idx_create_date (CreateDate)
);

-- FacilityReportDetail table
CREATE TABLE FacilityReportDetail (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FacilityReportID INT NOT NULL,
    EmployeeID VARCHAR(100) NOT NULL,
    Comment TEXT NOT NULL,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (FacilityReportID) REFERENCES FacilityReport(ID) ON DELETE CASCADE,
    INDEX idx_facility_report_id (FacilityReportID),
    INDEX idx_employee_id (EmployeeID),
    INDEX idx_create_date (CreateDate)
);

-- Add check constraints
ALTER TABLE House
ADD CONSTRAINT chk_max_occupant CHECK (MaxOccupant > 0);

ALTER TABLE Facility
ADD CONSTRAINT chk_quantity CHECK (Quantity > 0);