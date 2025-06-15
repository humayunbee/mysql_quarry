-- HR Software Attendance Qurrey .....
✅ ১. Laragon দিয়ে phpMyAdmin Install (সবচেয়ে সহজ উপায়)
👉 ধাপ:
Laragon চালু করুন

উপরের মেনুতে যান:
Menu > Tools > Quick Add > phpMyAdmin

ক্লিক করলেই Laragon phpMyAdmin ডাউনলোড ও ইনস্টল করে দেবে।

শেষে Menu > Reload দিন।

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

 UPDATE `attendance_log` SET `user_id` = '38' WHERE `user_id` = 15; 
-- This query will update the user_id of all attendance records where the user_id is '15' to '38'.

UPDATE `attendance_log` SET `status` = '0' WHERE `checktime` <= '2024-08-31 00:00:00' ;
-- This query will update the status of all attendance records where the checktime is less than or equal to '2024-08-31 00:00:00' to '0'.


UPDATE attendance_log SET user_id= 312 WHERE user_id = 38777
UPDATE attendance_log SET status = 0 WHERE user_id= 312 ;
-- This query will update the status of all attendance records where the user_id is '312' to '0'.





