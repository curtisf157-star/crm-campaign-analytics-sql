-- Synthetic training data only.
-- Run after 01_create_tables.sql.

INSERT INTO customers (customer_id, first_name, region, customer_segment, signup_date) VALUES
(1001, 'Alex', 'London', 'Loyal', '2025-01-15'),
(1002, 'Jamie', 'South East', 'New', '2025-02-03'),
(1003, 'Morgan', 'London', 'At Risk', '2024-11-22'),
(1004, 'Taylor', 'Midlands', 'Loyal', '2024-08-10'),
(1005, 'Casey', 'South East', 'New', '2025-03-01'),
(1006, 'Riley', 'North West', 'At Risk', '2024-10-05'),
(1007, 'Jordan', 'London', 'New', '2025-04-12'),
(1008, 'Sam', 'Midlands', 'Loyal', '2024-06-19'),
(1009, 'Drew', 'North West', 'New', '2025-05-27'),
(1010, 'Avery', 'South East', 'At Risk', '2024-12-08'),
(1011, 'Robin', 'London', 'Loyal', '2024-07-14'),
(1012, 'Cameron', 'Midlands', 'New', '2025-06-02');

INSERT INTO campaign_activity
(activity_id, customer_id, campaign_name, contact_date, response_status) VALUES
(1, 1001, 'Spring Offer', '2025-03-10', 'Responded'),
(2, 1002, 'Spring Offer', '2025-03-10', 'No Response'),
(3, 1003, 'Spring Offer', '2025-03-11', 'Responded'),
(4, 1004, 'Spring Offer', '2025-03-11', 'No Response'),
(5, 1005, 'Spring Offer', '2025-03-12', 'Responded'),
(6, 1006, 'Spring Offer', '2025-03-12', 'Opted Out'),
(7, 1007, 'Summer Preview', '2025-06-05', 'Responded'),
(8, 1008, 'Summer Preview', '2025-06-05', 'Responded'),
(9, 1009, 'Summer Preview', '2025-06-06', 'No Response'),
(10, 1010, 'Summer Preview', '2025-06-06', 'No Response'),
(11, 1011, 'Summer Preview', '2025-06-07', 'Responded'),
(12, 1012, 'Summer Preview', '2025-06-07', 'No Response'),
(13, 1001, 'Loyalty Reminder', '2025-07-01', 'Responded'),
(14, 1003, 'Loyalty Reminder', '2025-07-01', 'No Response'),
(15, 1004, 'Loyalty Reminder', '2025-07-02', 'Responded'),
(16, 1006, 'Loyalty Reminder', '2025-07-02', 'No Response'),
(17, 1008, 'Loyalty Reminder', '2025-07-03', 'Opted Out'),
(18, 1011, 'Loyalty Reminder', '2025-07-03', 'Responded');
