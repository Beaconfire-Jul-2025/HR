CREATE DATABASE IF NOT EXISTS ApplicationService;
USE ApplicationService;

-- ApplicationWorkFlow table
CREATE TABLE ApplicationWorkFlow (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID VARCHAR(100) NOT NULL,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'PENDING',
    Comment TEXT,
    
    INDEX idx_employee_id (EmployeeID),
    INDEX idx_status (Status),
    INDEX idx_create_date (CreateDate)
);

-- DigitalDocument table
CREATE TABLE DigitalDocument (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(100) NOT NULL,
    isRequired BOOLEAN DEFAULT FALSE,
    Path VARCHAR(500) NOT NULL,
    Description TEXT,
    Title VARCHAR(255),
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastModificationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    INDEX idx_type (Type),
    INDEX idx_required (isRequired),
    INDEX idx_title (Title)
);

-- Add constraints and additional indexes
ALTER TABLE ApplicationWorkFlow
ADD CONSTRAINT chk_status CHECK (Status IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'REJECTED', 'CANCELLED'));

-- Optional: Create a junction table if documents are linked to specific workflow instances
CREATE TABLE ApplicationWorkFlowDocument (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ApplicationWorkFlowID INT NOT NULL,
    DigitalDocumentID INT NOT NULL,
    CreateDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (ApplicationWorkFlowID) REFERENCES ApplicationWorkFlow(ID) ON DELETE CASCADE,
    FOREIGN KEY (DigitalDocumentID) REFERENCES DigitalDocument(ID) ON DELETE CASCADE,
    UNIQUE KEY unique_workflow_document (ApplicationWorkFlowID, DigitalDocumentID),
    INDEX idx_workflow_id (ApplicationWorkFlowID),
    INDEX idx_document_id (DigitalDocumentID)
);