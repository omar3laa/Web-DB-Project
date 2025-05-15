-- create database ClinicPatient;

-- create table patients ( patient_ID INT primary key, F_Name VARCHAR(50), Mid_Name VARCHAR(50),
-- Last_Name VARCHAR(50) , Phone_Number VARCHAR(15),Gender VARCHAR(10),BirthDate DATE);

-- create table Doctors (Doctor_ID  INT primary key , F_Name VARCHAR(50), Mid_Name VARCHAR(50),
-- Last_Name VARCHAR(50) , Phone_Number VARCHAR(15),Address VARCHAR(60),Specialty VARCHAR(50));

-- create table Rooms (Room_ID INT primary key,Room_Name varchar(50),Status VARCHAR(20));

-- create table Appointments (Appointment_ID INT primary key , patient_ID INT ,Doctor_ID INT ,
-- Room_ID INT , AppointmentDate DATE,AppointmentTime TIME, Status VARCHAR(20), 
-- foreign key (patient_ID) references patients(patient_ID),
-- foreign key (Doctor_ID) references Doctors(Doctor_ID),
-- foreign key (Room_ID) references Rooms(Room_ID));
 
--  insert into patients (patient_ID,F_Name,Mid_Name,Last_Name,Phone_Number,Gender,BirthDate) values 
--  (1,'omar','mohamed','alaa','011286878','Male','2005-06-1'),
--  (2,'Ahmed','mohamed','alaa','012433223','Male','1999-12-28'),
--  (3,'Karem','mohamed','alaa','0122334623','Male','2003-04-15'),
--  (4,'Menna','mohamed','alaa','012323323','female','2010-04-10'),
--  (5,'Amr','Khaled','Abdeltawabe','0102545362','Male','2005-07-12'),
--  (6,'Ali','Hassan','Omar', '0111111111','Male','1990-05-20'),
--  (7,'Sara', 'Ahmed','Kamel', '0122222222','Female','1985-09-12'),
--  (8,'Mona','Mahmoud','Ibrahim','0103333333','Female','1992-03-08'),
--  (9,'Malak','Ahmed','Kamel', '012382222','Female','1985-09-12'),
--  (10,'Hager', 'Galal', 'Saad', '01225666222', 'Female', '1985-09-12');
 
--  insert into Doctors (Doctor_ID, F_Name, Mid_Name, Last_Name, Phone_number, Address, Specialty) values
--  (101, 'Yasser', 'Mohamed', 'Ali', '0100000001', 'Cairo', 'Cardiology'),
-- (102, 'Hany', 'Ibrahim', 'Sayed', '0100000002', 'Giza', 'Dermatology'),
-- (103, 'Dalia', 'Samir', 'Nabil', '0100000003', 'Alexandria', 'Pediatrics'),
-- (104, 'Yahia', 'Alaa', 'Saad', '0100000004', 'Assiut', 'Surgeon'),
-- (105, 'Nadine', 'Adel', 'Yousef', '0100000005', 'Mansoura', 'Orthopedics'),
-- (106, 'Bassel', 'Hatem', 'Zaki', '0100000006', 'Zagazig', 'General'),
-- (107, 'Salma', 'Khaled', 'Fathy', '0100000007', 'Cairo', 'ENT'),
-- (108, 'Mohamed', 'Reda', 'Farag', '0100000008', 'Tanta', 'Urology'),
-- (109, 'Rania', 'Hassan', 'Ezzat', '0100000009', 'Alexandria', 'Dermatology'),
-- (110, 'Mostafa', 'Gamal', 'Lotfy', '0100000010', 'Asyut', 'Internal Medicine');

-- insert into Rooms (Room_ID,Room_Name,Status) values
-- (301,'Room A','Available'),
-- (302,'Room B','occupied'),
-- (303,'Room C','Available'),
-- (304,'Room D','Available'),
-- (305,'Room E','occupied'),
-- (306,'Room F','occupied'),
-- (307,'Room G','occupied'),
-- (308,'Room H','Available'),
-- (309,'Room I','occupied'),
-- (310,'Room J','occupied');

-- insert into Appointments (Appointment_ID, Patient_ID, Doctor_ID, Room_ID, AppointmentDate,
--  AppointmentTime, Status) VALUES 
-- (1,1,102,302,'2025-05-15','10:30','Scheduled'),
-- (2,2,104,305,'2025-05-17','09:45','Scheduled'),
-- (3,4,101,310,'2025-05-15','11:15','Cancelled'),
-- (4,3,103,307,'2025-06-1','12:00','Completed'),
-- (5,7,110,310,'2025-05-22','04:30','Completed'),
-- (6,6,104,303,'2025-05-18','08:45','Scheduled'),
-- (7,10,102,303,'2025-06-2','10:55','Scheduled');
use ClinicPatient;
select * from patients;
select * from Doctors;
select * from Rooms;
select * from Appointments;
select r.room_Name,a.status from rooms as r join Appointments as a
on r.room_ID=a.room_ID;

select r.room_Name,a.status from rooms as r left join Appointments as a
on r.room_ID=a.room_ID where a.room_ID is null;

select dr.Doctor_ID,dr.F_Name, count(a.Appointment_ID) as no_Appointments from Doctors as dr
join Appointments as a on dr.Doctor_ID = a.Doctor_ID group by dr.Doctor_ID,dr.F_Name;



