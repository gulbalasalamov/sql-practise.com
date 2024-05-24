## www.sql-practise.com

This repository is dedicated to students and professionals who would like to brush up and advance their SQL skills for their careers. I found (https://www.sql-practice.com) educational and the web site user friendly however there wasn’t the complete solution book shared on the web site neither on GitHub. So now you can get the answers with alternative solutions for each question 

I have used PostgreSQL as main Database Management Systems (DBMS) and therefore you may encounter some queries that work in PostgreSQL may not work in
other DBMS such as SQL Server or MySQL as some implementations slight vary in syntax. For such cases, for example, in date and time operations 
I included standart SQL queries as well.

I populated mockdata using www.mockaroo.com to effectively practise the queries and get some output while working locally. Note that it is not the same large dataset used on the web site, so I suggest you use the web site itself as long as you have internet connection, which is also good for tracking your progress. You may use the sql database files given in the repository for convenience and a rapid start in creating schemas and inserting datasets.

Recently, SQL-Practise has introduced a new database called Northwind. I have added its solutions to a separate page, which you can access from [here](https://github.com/gulbalasalamov/sql-practise.com/blob/master/README-NORTHWIND.md) . However, I strongly recommend you to start with the Hospital database for practice. It offers a wide variety of questions and allows you to practice more functional features. 

The hospital test contains 50 questions and consists of 3 category:

- Easy
- Medium
- Hard

You can use the following Entity Relationship Diagram (ERD) to figure out what data to store, the entities, their attributes and also how entities 
relate to other entities.

![erd](https://user-images.githubusercontent.com/19313466/211203253-23f70de3-4786-45aa-8d7f-54fb81525415.png) 

## Answers

> Want to help this repository? Feel free to contribute by submitting a custom solution to be added to the questions.

---

### Section1: Easy

---

Questions 1- 17

1. Show first name, last name, and gender of patients who's gender is 'M'

```sql
SELECT first_name,
       last_name,
       gender
FROM patients
WHERE gender = 'M';
```

2. Show first name and last name of patients who does not have allergies. (null)

 ```sql
SELECT first_name,
       last_name
FROM patients
WHERE allergies IS NULL
```

3. Show first name of patients that start with the letter 'C'

```sql
SELECT first_name
FROM patients
WHERE first_name LIKE 'C%';
```

4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

```sql
SELECT first_name, last_name
FROM patients
WHERE weight <= 120
  AND weight >= 100;
```

5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'

```sql
UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;
```

6. Show first name and last name concatenated into one column to show their full name.

```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;
```

7. Show first name, last name, and the full province name of each patient.

```sql
SELECT first_name, last_name, province_name
FROM patients
         JOIN province_names ON patients.province_id = province_names.province_id;
```

8. Show how many patients have a birth_date with 2010 as the birth year.

```sql
-- alternative #1
SELECT COUNT(patients.birth_date)
FROM patients
WHERE birth_date BETWEEN '2010-01-01' AND '2010-12-30';

-- alternative #2
SELECT COUNT(patients.birth_date)
FROM patients
WHERE birth_date LIKE '2010%';

```

9. Show the first_name, last_name, and height of the patient with the greatest height.

```sql
SELECT first_name, last_name, MAX(height) AS height
FROM patients
GROUP BY first_name, last_name
ORDER BY height DESC
LIMIT 1;
```

10. Show all columns for patients who have one of the following patient_ids:
    1,45,534,879,1000

```sql
-- alternative #1
SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);

-- alternative #2
SELECT *
FROM patients
WHERE patient_id = 1
   OR patient_id = 45
   OR patient_id = 534
   OR patient_id = 879
   OR patient_id = 1000;
```

11. Show the total number of admissions

```sql
SELECT COUNT(admissions.patient_id) AS total_number_of_admissions
FROM admissions;
```

12. Show all the columns from admissions where the patient was admitted and discharged on the same day.

```sql
SELECT *
FROM admissions
WHERE admission_date = discharge_date;
```

13. Show the total number of admissions for patient_id 579.

```sql
SELECT patient_id, COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id = 1
GROUP BY patient_id;
```

14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?

```sql
SELECT DISTINCT(city) AS unique_cities
FROM patients
         JOIN province_names ON patients.province_id = province_names.province_id
WHERE province_names.province_id = 'NS';
```

15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70

```sql
SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160
  AND weight > 70;
```

16. Write a query to find list of patients first_name, last_name, and allergies from Hamilton where allergies are not null

```sql
SELECT first_name, last_name, allergies
FROM patients
WHERE city = 'Hamilton'
  AND allergies IS NOT NULL;
```

17. Based on cities where our patient lives in, write a query to display the list of unique city starting with a vowel (a, e, i, o, u). Show the
    result order in ascending by city.

```sql
SELECT city
FROM patients
WHERE city SIMILAR TO '[aeiouAEIOU]%'
ORDER BY city ASC;
```

SIMILAR TO and LIKE are not the same in PostgreSQL.

SIMILAR TO is used to match a string against a pattern that can include regular expressions. For example, you can use SIMILAR TO to find all strings
that start with a vowel by using the pattern '[AEIOU]%'.

LIKE is used to match a string against a pattern that does not include regular expressions. It is similar to the = operator, except that it allows you
to use the % and _ wildcard characters to match any number of or a single character, respectively. For example, you can use LIKE to find all strings
that start with a vowel by using the pattern 'A%'.

```sql
SELECT city
FROM patients
WHERE city LIKE 'A%'
   OR city LIKE 'E%'
   OR city LIKE 'I%'
   OR city LIKE 'O%'
   OR city LIKE 'U%'
   OR city LIKE 'a%'
   OR city LIKE 'e%'
   OR city LIKE 'i%'
   OR city LIKE 'o%'
   OR city LIKE 'u%'
ORDER BY city ASC;
```

---

### Section2: Medium

---

Questions 1- 23

1. Show unique birth years from patients and order them by ascending.

```sql
-- PostgreSQL
SELECT DISTINCT (EXTRACT(YEAR FROM birth_date)) AS birth_year
FROM patients
ORDER BY birth_year ASC;

-- SQL
SELECT DISTINCT year(birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;
```

2. Show unique first names from the patients table which only occurs once in the list.
   For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list.
   If only 1 person is named 'Leo' then include them in the output.

```sql
SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name = 'John') = 1;
```

    Tip: HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

3. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

```sql
SELECT patient_id, first_name
FROM patients
WHERE first_name SIMILAR TO 's____%s';
```

or

```sql
SELECT patient_id, first_name
FROM patients
WHERE first_name LIKE 's____%s';
```

4. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.
   Primary diagnosis is stored in the admissions table.

```sql
SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
         JOIN admissions a ON p.patient_id = a.patient_id
WHERE diagnosis = 'Dementia';
```

5. Display every patient's first_name.
   Order the list by the length of each name and then by alphbetically.

```sql
SELECT first_name
FROM patients
ORDER BY LENGTH(first_name), first_name;
```

6. Show the total amount of male patients and the total amount of female patients in the patients table.
   Display the two results in the same row.

```sql
-- Postgresql
SELECT (SELECT COUNT(*) FROM patients WHERE gender = 'M') AS male_count,
       (SELECT COUNT(*) FROM patients WHERE gender = 'F') AS female_count;

-- SQL
SELECT SUM(gender = 'M') AS male_count,
       SUM(gender = 'F') AS female_count
FROM patients;
```

7. Show the total amount of male patients and the total amount of female patients in the patients table.
   Display the two results in the same row.

```sql
SELECT first_name, last_name, allergies
FROM patients
WHERE allergies = 'Penicillin'
   OR allergies = 'Morphine'
ORDER BY allergies ASC, first_name ASC, last_name ASC;

-- alternatively 

SELECT first_name,
       last_name,
       allergies
FROM patients
WHERE allergies IN ('Penicillin', 'Morphine')
ORDER BY allergies,
         first_name,
         last_name;
```

8. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

```sql
SELECT patient_id, diagnosis
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(diagnosis = diagnosis) > 1;
```

9. Show the city and the total number of patients in the city.
   Order from most to least patients and then by city name ascending.

```sql
SELECT city, COUNT(*) AS number_of_patients
FROM patients
GROUP BY city
ORDER BY number_of_patients DESC, city ASC;
```

10. Show first name, last name and role of every person that is either patient or doctor.
    The roles are either "Patient" or "Doctor"

```sql
SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION ALL
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;
```

11. Show all allergies ordered by popularity. Remove NULL values from query.

```sql
SELECT allergies, COUNT(*) AS total_diagnosis
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC;
```

12. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade.
    Sort the list starting from the earliest birth_date.

```sql
--PostgreSQL version
SELECT first_name, last_name, birth_date
FROM patients
WHERE EXTRACT(YEAR FROM birth_date) BETWEEN 1970 AND 1979;

--SQL
SELECT first_name,
       last_name,
       birth_date
FROM patients
WHERE year(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;

-- SQL Regex
SELECT first_name,
       last_name,
       birth_date
FROM patients
WHERE year(birth_date) LIKE '197%'
ORDER BY birth_date ASC
```

13. We want to display each patient's full name in a single column.
    Their last_name in all upper letters must appear first, then first_name in all lower case letters.
    Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
    EX: SMITH,jane

```sql
SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS new_name_format
FROM patients
ORDER BY first_name DESC;
```

14. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.

```sql
SELECT pr.province_id, SUM(pa.height) AS sum_height
FROM province_names pr
         JOIN patients pa ON pr.province_id = pa.province_id
GROUP BY pr.province_id
HAVING SUM(pa.height) >= 7000;
```

15. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

```sql
SELECT (MAX(weight) - MIN(weight)) AS weight_delta
FROM patients
WHERE last_name = 'Maroni';
```

16. Show all of the days of the month (1-31) and how many admission_dates occurred on that day.
    Sort by the day with most admissions to least admissions.

```sql
-- PostgreSQL
SELECT EXTRACT(DAY FROM admission_date) AS day_number, COUNT(patient_id) AS number_of_admissions
FROM admissions
GROUP BY day_number
ORDER BY number_of_admissions DESC;

-- SQL
SELECT day(admission_date) AS day_number,
       COUNT(patient_id)   AS number_of_admissions
FROM admissions
GROUP BY day_number
ORDER BY number_of_admissions DESC;
```

17. Show all columns for patient_id 542's most recent admission_date.

```sql
-- PostgreSQL
SELECT *
FROM admissions
WHERE patient_id = 542
GROUP BY patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id
HAVING admission_date = MAX(admission_date);

-- sql
SELECT *
FROM admissions
WHERE patient_id = 542
ORDER BY admission_date DESC
LIMIT 1;

```

18. Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
    - patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
    - attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

```sql
-- PostgreSQL (we would need to explicity cast the type attending_doctor_id is integer whereas LIKE method performs operations on Strings
SELECT patient_id, attending_doctor_id, diagnosis
FROM admissions
WHERE patient_id % 2 = 1 AND attending_doctor_id IN (1, 5, 19)
   OR CONCAT(attending_doctor_id) LIKE '%2%' AND LENGTH(CONCAT(patient_id)) = 3;

-- SQL
SELECT patient_id, attending_doctor_id, diagnosis
FROM admissions
WHERE patient_id % 2 = 1 AND attending_doctor_id IN (1, 5, 19)
   OR (attending_doctor_id LIKE '%2%' AND LENGTH(patient_id) = 3);
```

19. Show first_name, last_name, and the total number of admissions attended for each doctor.
    Every admission has been attended by a doctor.

```sql
SELECT first_name, last_name, COUNT(attending_doctor_id) AS total_admission
FROM admissions
         JOIN doctors ON admissions.attending_doctor_id = doctors.doctor_id
GROUP BY first_name, last_name;
```

20. For each doctor, display their id, full name, and the first and last admission date they attended.

```sql
SELECT d.doctor_id,
       CONCAT(d.first_name, ' ', d.last_name) AS full_name,
       MIN(a.admission_date)                  AS first_admission_date,
       MAX(a.admission_date)                  AS last_admission_date
FROM doctors d
         JOIN admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY d.doctor_id, full_name;
```

21. Display the total amount of patients for each province. Order by descending.

```sql
SELECT pro.province_name, COUNT(p.patient_id) AS patient_count
FROM province_names pro
         JOIN patients p ON pro.province_id = p.province_id
GROUP BY pro.province_name
ORDER BY patient_count DESC;
```

22. For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

```sql
SELECT CONCAT(p.first_name, ' ', p.last_name) AS patient_name, a.diagnosis, CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
FROM patients p
         JOIN admissions a ON p.patient_id = a.patient_id
         JOIN doctors d ON a.attending_doctor_id = d.doctor_id;
```

23. Display the number of duplicate patients based on their first_name and last_name.

```sql

SELECT first_name, last_name, COUNT(*) AS number_of_duplicates
FROM patients
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

/*
In the HAVING clause, you can only use the names of columns that are included in the GROUP BY clause 
or that are aggregated by an aggregate function (such as COUNT, MAX, MIN, etc.).

In this case, the COUNT(*) function is used to count the number of rows in each group, 
and the result of this function is given an alias of "number_of_duplicates".
However, the HAVING clause does not refer to this alias. Instead, it refers to the function itself (i.e. COUNT(*)).
*/

```

---

### Section3: Hard

---

Questions 1- 10

1. Show all of the patients grouped into weight groups.
   Show the total amount of patients in each weight group.
   Order the list by the weight group decending. e.g. if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group,
   etc.

```sql
SELECT (weight / 10) * 10 AS weight_group, COUNT(*) AS patients_in_this_weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;
```

2. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m)
   . Weight is in units kg. Height is in units cm.

```sql
SELECT patient_id,
       weight,
       height,
       CASE
           WHEN weight / POWER(height / 100.00, 2) >= 30
               THEN 1
           ELSE 0
           END AS isobese
FROM patients;
-- we need to divide by 100.00 as if we divide int by int, the decimals will be truncated, ex: 100/3 = 33 BUT 100/3.0 = 33.333333333
```

3. Show patient_id, first_name, last_name, and attending doctor's specialty.
   Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'
   Check patients, admissions, and doctors tables for required information.

```sql
SELECT p.patient_id, p.first_name, p.last_name, d.speciality
FROM patients p
         JOIN admissions a ON p.patient_id = a.patient_id
         JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
  AND d.first_name = 'Lisa';
```

4. All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after
   their first admission. Show the patient_id and temp_password.

   The password must be the following, in order:
    - patient_id
    - the numerical length of patient's last_name
    - year of patient's birth_date

```sql
--PostgreSQL
SELECT DISTINCT p.patient_id, CONCAT(a.patient_id, LENGTH(p.last_name), EXTRACT(YEAR FROM p.birth_date)) AS temp_password
FROM patients p
         JOIN admissions a ON p.patient_id = a.patient_id;

--SQL
SELECT DISTINCT p.patient_id, CONCAT(a.patient_id, LENGTH(p.last_name), year(p.birth_date)) AS temp_password
FROM patients p
         JOIN admissions a ON p.patient_id = a.patient_id;
```

5. Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.
   Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance. Add up the admission_total cost for each has_insurance
   group.

```sql
SELECT CASE WHEN a.patient_id % 2 = 0 THEN 'Yes' ELSE 'No' END AS has_insurance,
       SUM(CASE WHEN a.patient_id % 2 = 0 THEN 10 ELSE 50 END) AS cost_after_insurance
FROM admissions a
GROUP BY has_insurance;
```

6. Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name

```sql
SELECT pr.province_name
FROM province_names pr
         JOIN patients p ON pr.province_id = p.province_id
GROUP BY province_name
HAVING SUM(CASE WHEN p.gender = 'M' THEN 1 ELSE 0 END) > SUM(CASE WHEN p.gender = 'F' THEN 1 ELSE 0 END);

/*
COUNT is used to count the number of rows that meet a certain criteria, 
while SUM is used to add up the values in a particular column for rows that meet a certain criteria.
*/
```

7. We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:

- First_name contains an 'r' after the first two letters.
- Identifies their gender as 'F'
- Born in February, May, or December
- Their weight would be between 60kg and 80kg
- Their patient_id is an odd number
- They are from the city 'Kingston'

```sql
-- PostgreSQL
SELECT *
FROM patients
WHERE first_name SIMILAR TO '^[a-zA-Z]{2}r'
  AND gender = 'F'
  AND EXTRACT(MONTH FROM (birth_date)) IN (2, 5, 12)
  AND weight BETWEEN 60 AND 80
  AND patient_id % 2 = 1
  AND city = 'Kingston';

-- SQL
SELECT *
FROM patients
WHERE first_name LIKE '__r%' --first_name LIKE '^[a-zA-Z]{2}r'
  AND gender = 'F'
  AND month(birth_date) IN (2, 5, 12)
  AND weight BETWEEN 60 AND 80
  AND patient_id % 2 = 1
  AND city = 'Kingston';

```

8. Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.

```sql
SELECT CONCAT(ROUND(SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%')
FROM patients;

SELECT ROUND(100 * AVG(gender = 'M'), 2) || '%' AS percent_of_male_patients
FROM patients;
```

9. For each day display the total amount of admissions on that day. Display the amount changed from the previous date.

```sql
WITH temp_table AS (SELECT admission_date,
                           COUNT(*) AS total_admissions
                    FROM admissions
                    GROUP BY admission_date
                    ORDER BY admission_date DESC)
SELECT admission_date,
       total_admissions,
       total_admissions - LAG(total_admissions, 1, NULL) OVER (ORDER BY admission_date DESC) AS change
FROM temp_table;

-- Alternative 
SELECT admission_date,
       COUNT(admission_date)                                                             AS admission_day,
       COUNT(admission_date) - LAG(COUNT(admission_date)) OVER (ORDER BY admission_date) AS admission_count_change
FROM admissions
GROUP BY admission_date;
```

10. Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.

```sql
WITH temp_table AS (SELECT province_name FROM province_names ORDER BY (province_name = 'Ontario') DESC, province_name ASC)
SELECT province_name
FROM temp_table;

/*
This query uses a combination of the ORDER BY clause and a boolean expression to prioritize the 'Ontario' record.
The boolean expression (name = 'Ontario') returns TRUE for the 'Ontario' record and FALSE for all other records.
When this expression is used in the ORDER BY clause with the DESC keyword, it causes the 'Ontario' record to be sorted first in the resulting dataset.
The rest of the records are then sorted in ascending order by the name column.
*/
```

11. We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.

```sql
SELECT d.doctor_id, CONCAT(d.first_name,' ',d.last_name) AS doctor_full_name,
		 d.specialty,
       YEAR(a.admission_date) AS selected_year,
       COUNT(*) AS total_admissions
FROM admissions a
LEFT JOIN doctors d ON a.attending_doctor_id = d.doctor_id
GROUP BY doctor_id, selected_year
```
