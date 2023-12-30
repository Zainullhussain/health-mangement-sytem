create database project_HMS;
use project_HMS;
create table doctors
(
doctor_id int primary key ,
doctor_name varchar(50) unique,
doctor_gender varchar(50),
Sdoctor_contact bigint,
doctor_qualification nvarchar(50),
doctor_specialization nvarchar(50),
doctor_salary bigint,
department_id int 
);
INSERT INTO doctors (doctor_id, doctor_name, doctor_gender, Sdoctor_contact, doctor_qualification, doctor_specialization, doctor_salary, department_id)
VALUES
(1, 'Dr. James Smith', 'Male', 9876543210, 'MBBS, MD', 'Cardiologist', 100000, 1),
(2, 'Dr. Jane Doe', 'Female', 8765432109, 'BDS', 'Dentist', 80000, 2),
(3, 'Dr. Michael Lee', 'Male', 7654321098, 'BAMS', 'Ayurvedic Physician', 75000, 3),
(4, 'Dr. Emily Jones', 'Female', 6543210987, 'BSc Nursing', 'Nurse Practitioner', 65000, 4);


create table patients
(
patient_id int  primary key ,
patient_name varchar(50),
patient_gender varchar(50),
patient_age int,
patient_contact bigint,
patient_weight int
);

insert into patients (patient_id,patient_name,patient_gender,patient_age,patient_contact,patient_weight) value
(12,'Nabhiya','female',28 , 0311, 90),
(13,'Tabassum','female',20 , 0311, 56);


create table appointments
(
appointment_id int primary key ,
patient_id int ,
doctor_id int ,
date_time datetime,
admin_id int,
disease nvarchar(50),
prescription nvarchar(50),
foreign key(patient_id) references doctors(doctor_id)
);
insert into appointments values
(1,2,1,NULL,1, 'heart attack', 'inderal'),
(2,3,2,NULL,2, 'tooth cavity', 'panadol');



SELECT * FROM doctors;
SELECT doctor_name, doctor_gender, doctor_specialization FROM doctors;
SELECT * FROM doctors WHERE doctor_gender = 'Female';
SELECT * FROM doctors WHERE doctor_salary > 80000;
SELECT * FROM doctors WHERE doctor_specialization IN ('Cardiologist', 'Dentist');
SELECT * FROM doctors ORDER BY doctor_name ASC;
SELECT * FROM doctors ORDER BY doctor_salary DESC;
SELECT COUNT(*) FROM doctors;
SELECT SUM(doctor_salary) FROM doctors;
SELECT AVG(doctor_salary) FROM doctors;
SELECT * FROM doctors WHERE doctor_gender = 'Male' AND doctor_salary > 90000;
SELECT doctor_name, departments.department_name
FROM doctors
INNER JOIN departments ON department_id = department_id;
UPDATE doctors SET doctor_contact = 1234567890 WHERE doctor_id = 2;
DELETE FROM doctors WHERE doctor_id = 3;
SELECT DISTINCT doctor_specialization FROM doctors;
SELECT * FROM appointments;
SELECT * FROM appointments WHERE patient_id = 2;
SELECT * FROM appointments WHERE disease = 'tooth cavity';
SELECT * FROM appointments WHERE prescription LIKE '%inderal%';
SELECT appointments.appointment_id, doctors.doctor_name, appointments.disease
FROM appointments
INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id;
UPDATE appointments SET date_time = '2023-12-31 10:00:00' WHERE appointment_id = 1;

