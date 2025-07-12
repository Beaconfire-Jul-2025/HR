USE ApplicationService;

INSERT INTO DigitalDocument (type, isRequired, path, description, title) VALUES
('PDF', TRUE, '/documents/onboarding/new_hire_onboarding_checklist.pdf', 'Mandatory checklist for all new employees joining the company.', 'New Hire Onboarding Checklist'),
('PDF', FALSE, '/documents/onboarding/company_culture_handbook.pdf', 'A comprehensive guide to the company\'s values, mission, and culture.', 'Company Culture Handbook');

INSERT INTO ApplicationWorkFlow (employeeId, status, comment) VALUES
('EMP001', 'OPEN', ''),
('EMP002', 'COMPLETED', 'All onboarding steps successfully finished.'),
('EMP003', 'COMPLETED', 'All onboarding steps successfully finished.'),
('EMP004', 'REJECTED', 'Onboarding application rejected due to incomplete information.'),
('EMP005', 'COMPLETED', 'All onboarding steps successfully finished.');
