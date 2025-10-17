Create database cityhospital;
use cityhospital;

-- create table --
CREATE TABLE Patients (
Patient_id INT,
Patient_name VARCHAR(50),
Age INT,
Gender VARCHAR(10),
AdmissionDate date
);

-- Alter ADD Column --
Alter table Patients
add DoctorsAssigned VARCHAR(50);

-- Alter Modify Column --
Alter Table patients
modify column patient_name VARCHAR(100);

-- Rename Table --
Rename table Patients to Patient_info;

-- Truncate --
Truncate table Patient_info;

-- drop --
Drop table Patient_info;