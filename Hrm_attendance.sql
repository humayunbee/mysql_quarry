-- HR Software Attendance Qurrey 




-- This will silently install the 64-bit Access Database Engine without checking for conflicting Office versions.
cd C:\Users\USER\Downloads
AccessDatabaseEngine_x64.exe /quiet



 UPDATE `attendances` SET `status` = '1'  WHERE `punch_time` <= '2025-04-30';

-- This query will update the status of all attendance records where the punch_time is less than or equal to '2024-10-30' to '1'.



 UPDATE `attendances` SET `user_id` = '38' WHERE `user_id` = '15'; 
-- This query will update the user_id of all attendance records where the user_id is '15' to '38'.





-- to Delete Duplicate data From attendance table
-- This query will delete duplicate records from the attendances table based on user_id and punch_time.

DELETE a
FROM attendances a
JOIN (
    SELECT user_id, punch_time, MIN(id) AS min_id
    FROM attendances
    GROUP BY user_id, punch_time
    HAVING COUNT(*) > 1
) b ON a.user_id = b.user_id AND a.punch_time = b.punch_time AND a.id != b.min_id;

-- This query will delete all but the earliest record for each user_id and punch_time combination.




DELETE FROM attendances WHERE user_id NOT REGEXP '^[0-9]+$';
ALTER TABLE `attendances` CHANGE `user_id` `user_id` INT NULL DEFAULT NULL;

-- This query will delete all records from the attendances table where the user_id does not consist of only digits.




SELECT user_id FROM attendances WHERE user_id NOT REGEXP '^[0-9]+$';

-- This query will select all user_ids from the attendances table where the user_id does not consist of only digits.





ALTER TABLE attendances ADD UNIQUE unique_attendance (user_id, punch_time);

-- This query will delete duplicate records from the attendances table based on user_id and punch_time.


UPDATE `attendance_log` SET `status` = '1' WHERE `checktime` <= '2024-08-31 00:00:00' ;
-- This query will update the status of all attendance records where the checktime is less than or equal to '2024-08-31 00:00:00' to '1'.

 UPDATE `attendance_log` SET `status` = '0' WHERE `user_id` = 38; 
-- This query will update the status of all attendance records where the user_id is '38' to '0'.


UPDATE `attendance_log` SET `status` = '0' WHERE `checktime` <= '2024-08-31 00:00:00' ;
-- This query will update the status of all attendance records where the checktime is less than or equal to '2024-08-31 00:00:00' to '0'.


UPDATE `attendance_log` SET `user_id` = '38' WHERE `user_id` = 15; 
UPDATE attendance_log SET user_id= 312 WHERE user_id = 38777
UPDATE attendance_log SET status = 0 WHERE user_id= 312 ;
-- This query will update the status of all attendance records where the user_id is '312' to '0'.








UPDATE `tbl_attendance` SET `late_status` = '0', `late_time` = '0' WHERE `card_id` = '1136'
AND `attendance_date` BETWEEN '2024-09-01' AND '2024-09-30'




SELECT * 
FROM `tbl_holiday` 
WHERE (`holy_date`, `branch_id`) IN (
    SELECT `holy_date`, `branch_id` 
    FROM `tbl_holiday` 
    GROUP BY `holy_date`, `branch_id` 
    HAVING COUNT(*) > 1
) 
ORDER BY `holy_date` ASC, `branch_id` ASC;

-- multiple rows in the `tbl_holiday` table with the same `holy_date` and `branch_id` combination.



DELETE FROM `tbl_holiday`
WHERE `holiday_id` NOT IN (
    SELECT * FROM (
        SELECT MIN(`holiday_id`) 
        FROM `tbl_holiday`
        GROUP BY `holy_date`, `branch_id`
    ) AS keep_records
);

-- This query will delete all but the earliest record for each `holy_date` and `branch_id` combination in the `tbl_holiday` table.


SELECT * FROM attendance_log WHERE checktime BETWEEN '2024-09-01' AND '2024-09-02';



UPDATE `tbl_attendance`
SET `late_time` = TIMESTAMPDIFF(MINUTE, `in_time`, `first_in_time`)
WHERE `card_id` = '1111'
AND `attendance_date` BETWEEN '2024-09-01' AND '2024-09-30'
AND `first_in_time` IS NOT NULL
AND `in_time` IS NOT NULL;
-- This query will update the `late_time` column in the `tbl_attendance` table for a specific `card_id` and date range, calculating the difference in minutes between `in_time` and `first_in_time`.



UPDATE tbl_attendance SET early_going = 0 WHERE schedule_id = 1 AND early_going = 1 AND out_time > '18:00:00' AND attendance_date > '2024-07-01';
-- This query will update the `early_going` column in the `tbl_attendance` table for a specific `schedule_id`, setting it to 0 for records where `out_time` is greater than '18:00:00' and `attendance_date` is after '2024-07-01'.



UPDATE tbl_attendance
SET out_time = temp_in_time
WHERE temp_in_time > out_time
AND attendance_date > '2024-07-01';
-- This query will update the `out_time` column in the `tbl_attendance` table for records where `temp_in_time` is greater than `out_time` and `attendance_date` is after '2024-07-01'.



UPDATE tbl_employee 
SET staff_id = REPLACE(staff_id, '-', '');
-- This query will update the `staff_id` column in the `tbl_employee` table, removing any hyphens from the `staff_id` values.


UPDATE tbl_employee 
SET staff_id = card_id;
-- This query will update the `staff_id` column in the `tbl_employee` table, setting it to the value of the `card_id` column.





SELECT employee_id, card_id, machine_id,employee_type
FROM tbl_employee;
-- This query will select the `employee_id`, `card_id`, `machine_id`, and `employee_type` columns from the `tbl_employee` table.


DELETE FROM tbl_m_salary_generate WHERE branch_id = 19 AND month LIKE '2024-05';
-- This query will delete records from the `tbl_m_salary_generate` table where the `branch_id` is 19 and the `month` column matches '2024-05'.


SELECT * FROM tbl_m_salary_generate WHERE branch_id = 19 AND month LIKE '2024-05'

-- This query will select all records from the `tbl_m_salary_generate` table where the `branch_id` is 19 and the `month` column matches '2024-05'.


UPDATE tbl_employee 
SET staff_id = card_id
 WHERE branch_id = 26;
-- This query will update the `staff_id` column in the `tbl_employee` table, setting it to the value of the `card_id` column for records where the `branch_id` is 26.




TRUNCATE tbl_attendance_log; TRUNCATE tbl_attendance; TRUNCATE tbl_holiday; TRUNCATE tbl_m_salary_generate; TRUNCATE tbl_employee; TRUNCATE tbl_position; TRUNCATE tbl_branch_permission; TRUNCATE tbl_leave_application; TRUNCATE meal_deduction; TRUNCATE tbl_salary; TRUNCATE tbl_leave_type; TRUNCATE tbl_department; TRUNCATE tbl_section; TRUNCATE tbl_concern_branch; TRUNCATE tbl_grade; TRUNCATE tbl_schedule; TRUNCATE tbl_company_concern; TRUNCATE meal;
-- This query will truncate (delete all data from) the specified tables in the database.


