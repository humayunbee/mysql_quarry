-- late_time and status Update for tbl_attendance table 15 min 


UPDATE tbl_attendance
SET 
    late_time = CASE 
        WHEN TIMESTAMPDIFF(SECOND, in_time, first_in_time) > 600 
        THEN TIMESTAMPDIFF(MINUTE, in_time, first_in_time) - 10
        ELSE 0 
    END,
    late_status = CASE 
        WHEN TIMESTAMPDIFF(SECOND, in_time, first_in_time) > 600 THEN '1'
        ELSE '0' 
    END
WHERE in_time IS NOT NULL 
  AND first_in_time IS NOT NULL
  AND attendance_date LIKE '2026-05-%';



