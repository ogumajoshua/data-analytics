use elites;

CREATE TABLE HealthRecord1 (
    RecordID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Diagnosis VARCHAR(100),
    Treatment VARCHAR(100),
    AdmissionDate DATE,
    DischargeDate DATE,
    DoctorName VARCHAR(50),
    Notes TEXT
);
select*from HealthRecord1;

INSERT INTO HealthRecord1 (RecordID, PatientName, Age, Gender, Diagnosis, Treatment, AdmissionDate, DischargeDate, DoctorName, Notes) VALUES
(1, 'John Doe', 45, 'Male', 'Hypertension', 'Medication', '2024-01-10', '2024-01-20', 'Dr. Smith', 'Follow-up required'),
(2, 'Jane Smith', 30, 'Female', 'Diabetes', 'Insulin', '2024-02-15', '2024-02-25', 'Dr. Brown', NULL),
(3, 'Alice Johnson', 50, 'Female', 'Asthma', 'Inhaler', '2024-03-05', '2024-03-15', 'Dr. White', 'Monitor symptoms'),
(4, 'Bob Lee', 60, 'Male', 'Heart Disease', 'Surgery', '2024-04-10', '2024-04-20', 'Dr. Green', 'Regular check-ups'),
(5, 'Charlie Kim', 40, 'Male', 'Arthritis', 'Physical Therapy', '2024-05-01', '2024-05-10', 'Dr. Black', 'Pain management'),
(6, 'Diana Ross', 35, 'Female', 'Migraine', 'Medication', '2024-06-15', '2024-06-25', 'Dr. Grey', NULL),
(7, 'Eve Adams', 28, 'Female', 'Anemia', 'Iron Supplements', '2024-07-05', '2024-07-15', 'Dr. Blue', 'Dietary changes'),
(8, 'Frank Wright', 55, 'Male', 'Cancer', 'Chemotherapy', '2024-08-10', '2024-08-20', 'Dr. Red', 'Regular follow-ups'),
(9, 'Grace Lee', 65, 'Female', 'Osteoporosis', 'Calcium Supplements', '2024-09-01', '2024-09-10', 'Dr. Yellow', 'Bone density monitoring'),
(10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
select*from HealthRecord1;

set sql_safe_updates=0;
-- Update Null Values: Replace null values in the Notes column with ‘No additional notes’.
UPDATE HealthRecord1
SET Notes = 'No additional notes'
WHERE Notes IS NULL;
select*from healthRecord1;

-- Calculate Length of Stay: Add a new column to calculate the length of stay for each patient
-- . Calculate Length of Stay: Add a new column to calculate the length of stay for each patient and Discharge Date 
ALTER TABLE HealthRecord1
ADD LengthOfStay INT;
select*from HealthRecord1;

set sql_safe_updates=0;

UPDATE HealthRecord1
SET DischargeDate = DATE_ADD(AdmissionDate, INTERVAL 5 DAY);
select*from healthRecord1;

UPDATE HealthRecord1
SET LengthOfStay = DATEDIFF(DischargeDate, AdmissionDate);
select*from HealthRecord1;

-- ETL Operations
-- Extract: Select all records where the patient is over 50 years old and Chemotherapy treatment.

SELECT * FROM HealthRecord1
WHERE Age > 50;

SELECT * FROM HealthRecord1
WHERE Treatment = 'Chemotherapy';


-- Transform: Create a summary table with the count of patients by diagnosis and Treatment.
CREATE TABLE DiagnosisSummary1 AS
SELECT Diagnosis, COUNT(*) AS PatientCount
FROM HealthRecord1
GROUP BY Diagnosis,treatment;

-- Load: Insert the summary data into another table for reporting.

INSERT INTO DiagnosisSummary1 (Diagnosis, PatientCount)
SELECT Diagnosis, PatientCount
FROM DiagnosisSummary;
select* from DiagnosisSummary1;






