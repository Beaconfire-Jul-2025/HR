USE ApplicationService;

INSERT INTO DigitalDocument (type, isRequired, path, description, title) VALUES
('PDF', TRUE, '/documents/onboarding/new_hire_onboarding_checklist.pdf', 'Mandatory checklist for all new employees joining the company.', 'New Hire Onboarding Checklist'),
('PDF', FALSE, '/documents/onboarding/company_culture_handbook.pdf', 'A comprehensive guide to the company\'s values, mission, and culture.', 'Company Culture Handbook');

INSERT INTO ApplicationWorkFlow (employeeId, status, applicationType) VALUES
('EMP001', 'OPEN', 'ONBOARD'),
('EMP002', 'OPEN', 'ONBOARD'),
('EMP003', 'OPEN', 'ONBOARD'),
('EMP004', 'OPEN', 'ONBOARD'),
('EMP005', 'OPEN', 'ONBOARD');
