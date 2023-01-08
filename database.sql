CREATE TABLE province_names
(
    province_id   char(2) PRIMARY KEY,
    province_name text
);

INSERT INTO province_names (province_id, province_name)
VALUES ('SC', 'Spartanburg');
INSERT INTO province_names (province_id, province_name)
VALUES ('FL', 'Fort Lauderdale');
INSERT INTO province_names (province_id, province_name)
VALUES ('CO', 'Fort Collins');
INSERT INTO province_names (province_id, province_name)
VALUES ('OH', 'Cleveland');
INSERT INTO province_names (province_id, province_name)
VALUES ('DC', 'Washington');
INSERT INTO province_names (province_id, province_name)
VALUES ('IA', 'Des Moines');
INSERT INTO province_names (province_id, province_name)
VALUES ('AK', 'Juneau');

INSERT INTO province_names (province_id, province_name)
VALUES ('WI', 'Madison');
INSERT INTO province_names (province_id, province_name)
VALUES ('LA', 'Baton Rouge');
INSERT INTO province_names (province_id, province_name)
VALUES ('DE', 'Wilmington');


INSERT INTO province_names (province_id, province_name)
VALUES ('IL', 'Chicago');
INSERT INTO province_names (province_id, province_name)
VALUES ('CA', 'Whittier');
INSERT INTO province_names (province_id, province_name)
VALUES ('MO', 'Columbia');

INSERT INTO province_names (province_id, province_name)
VALUES ('MD', 'Laurel');
INSERT INTO province_names (province_id, province_name)
VALUES ('MI', 'Kalamazoo');
INSERT INTO province_names (province_id, province_name)
VALUES ('TN', 'Nashville');
INSERT INTO province_names (province_id, province_name)
VALUES ('TX', 'Fort Worth');

INSERT INTO province_names (province_id, province_name)
VALUES ('NY', 'Albany');
INSERT INTO province_names (province_id, province_name)
VALUES ('VA', 'Virginia Beach');
INSERT INTO province_names (province_id, province_name)
VALUES ('PA', 'Reading');
INSERT INTO province_names (province_id, province_name)
VALUES ('IN', 'Evansville');
INSERT INTO province_names (province_id, province_name)
VALUES ('MN', 'Minneapolis');



CREATE TABLE patients
(
    patient_id  integer PRIMARY KEY,
    first_name  text,
    last_name   text,
    gender      varchar(1),
    birth_date  DATE,
    city        text,
    allergies   text,
    height      integer,
    weight      integer,
    province_id char(2) REFERENCES province_names (province_id)
);
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (1, 'Thomasina', 'Galiero', 'F', '1987-10-23', 'Taihe Chengguanzhen', 'Rabbit Hair', 42, 23, 'TX');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (2, 'Misha', 'Learmonth', 'F', '1993-11-30', 'Bagay', 'Treatment Set TS128811', 11, 164, 'TX');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (3, 'Hasheem', 'Karpenya', 'M', '1979-06-14', 'Sijiqing', 'PREDNISONE', 94, 250, 'TX');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (4, 'Sibby', 'Burril', 'F', '1993-08-13', 'Bograd', 'potassium chloride', 26, 175, 'CA');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (5, 'Deidre', 'Messier', 'F', '2010-07-18', 'Tây Hồ', 'bupropion hydrochloride', 159, 243, 'TX');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (6, 'Seth', 'Bachura', 'M', '1989-02-07', 'Baiyun', 'Aluminum Zirconium Tetrachlorohydrex GLY', 232, 61, 'CA');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (7, 'Nonna', 'Breston', 'F', '1979-05-08', 'Pakuranga', 'Dextromethorphan HBr, Phenylephrine HCl', 214, 83,
        'MI');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (8, 'Thibaut', 'Mordy', 'M', '1998-04-02', 'Oji River', 'ENALAPRIL MALEATE', 107, 115, 'MD');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (9, 'Nathanil', 'Berzin', 'M', '1956-07-22', 'Llauta', 'Sodium Fluoride', 192, 186, 'MO');
INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (10, 'Derk', 'Willetts', 'M', '2018-01-22', 'Murygino', 'Furosemide', 77, 230, 'TN');

INSERT INTO patients (patient_id, first_name, last_name, gender, birth_date, city, allergies, height, weight,
                      province_id)
VALUES (11, 'Seth', 'Tatule', 'M', '2014-01-22', 'Ankara', 'Furosemide', 17, 130, 'TN');



CREATE TABLE doctors
(
    doctor_id  integer PRIMARY KEY,
    first_name text,
    last_name  text,
    speciality text
);

INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (1, 'Averil', 'Tredget', 'Dandruff');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (2, 'Griff', 'Spradbrow', 'Nitrostat');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (3, 'Chas', 'Lavalde', 'Caffeic Acid');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (4, 'Cindee', 'Rosentholer', 'ATORVASTATIN CALCIUM');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (5, 'Tracy', 'Meeking', 'PREDNISOLONE');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (6, 'Alastair', 'Phythian', 'Lisinopril and Hydrochlorothiazide');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (7, 'Doralia', 'Trim', 'Ulta Vanilla Sugar Anti-Bacterial Deep Cleansing');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (8, 'Josie', 'Hurlestone', 'Vinorelbine');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (9, 'Dougy', 'Dury', 'NON-DROWSY DAYTIME SINUS RELIEF');
INSERT INTO doctors (doctor_id, first_name, last_name, speciality)
VALUES (10, 'Devin', 'Mensler', 'Oral Defense');


CREATE TABLE admissions
(
    patient_id          integer REFERENCES patients (patient_id),
    admission_date      date,
    discharge_date      date,
    diagnosis           text,
    attending_doctor_id integer REFERENCES doctors (doctor_id)
);

INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (1, '2021-03-26', '2022-12-17', 'Corrosion of third degree of unspecified palm, subs encntr', 9);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (2, '2021-02-18', '2020-01-19', 'Other disorders of patella, unspecified knee', 7);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (3, '2021-06-22', '2022-12-16', 'Poisoning by opth drugs and prep, accidental, sequela', 3);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (1, '2020-11-28', '2022-01-31', 'Nondisp fx of medial epicondyle of r humerus, sequela', 1);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (5, '2022-01-27', '2022-08-20', 'Leakage of biological heart valve graft, subs encntr', 5);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (6, '2022-07-21', '2020-10-28', 'Disp fx of trapezoid, left wrist, subs for fx w nonunion', 4);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (1, '2022-06-02', '2022-11-17', 'Oth viral infections with skin and mucous membrane lesions', 4);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (8, '2020-10-28', '2021-10-20', 'Burn of first degree of right shoulder, sequela', 7);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (9, '2022-04-24', '2020-09-28', 'Poisn by anticoag antag, vitamin K and oth coag, undet, init', 9);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (10, '2020-06-23', '2022-01-08', 'Presence of right artificial elbow joint', 10);
INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES (11, '2020-06-23', '2022-01-09', 'Presence of right artificial elbow joint', 10);