CREATE DATABASE IF NOT EXISTS ApplicationService;
USE ApplicationService;

-- ApplicationWorkFlow table
CREATE TABLE ApplicationWorkFlow (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeId VARCHAR(100) NOT NULL,
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'PENDING',
    comment TEXT,
    applicationType VARCHAR(255),
    
    INDEX idx_employee_id (employeeId),
    INDEX idx_status (status),
    INDEX idx_create_date (createDate),
    INDEX idx_application_type (applicationType)
);

-- DigitalDocument table
CREATE TABLE DigitalDocument (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(100) NOT NULL,
    isRequired BOOLEAN DEFAULT FALSE,
    path VARCHAR(500) NOT NULL,
    description TEXT,
    title VARCHAR(255),
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_type (type),
    INDEX idx_required (isRequired),
    INDEX idx_title (title)
);

-- Add constraints and additional indexes
ALTER TABLE ApplicationWorkFlow
ADD CONSTRAINT chk_status CHECK (status IN ('OPEN', 'COMPLETED', 'REJECTED', 'PENDING')); -- Added 'PENDING' to the check constraint