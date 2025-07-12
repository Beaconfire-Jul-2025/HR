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
    
    INDEX idx_employee_id (employeeId),
    INDEX idx_status (status),
    INDEX idx_create_date (createDate)
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

-- Optional: Create a junction table if documents are linked to specific workflow instances
CREATE TABLE ApplicationWorkFlowDocument (
    id INT PRIMARY KEY AUTO_INCREMENT,
    applicationWorkFlowId INT NOT NULL,
    digitalDocumentId INT NOT NULL,
    createDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (applicationWorkFlowId) REFERENCES ApplicationWorkFlow(id) ON DELETE CASCADE,
    FOREIGN KEY (digitalDocumentId) REFERENCES DigitalDocument(id) ON DELETE CASCADE,
    UNIQUE KEY unique_workflow_document (applicationWorkFlowId, digitalDocumentId),
    INDEX idx_workflow_id (applicationWorkFlowId),
    INDEX idx_document_id (digitalDocumentId)
);
