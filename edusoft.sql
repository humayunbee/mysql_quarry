-- Admission Fee Delete Query

DELETE sf 
FROM student_fees sf
JOIN students s ON sf.stu_id = s.id
WHERE sf.ac_head_id = 2 
AND s.unique_id <= '260000';



-- -Development Fee Update Query for Old Students

UPDATE student_fees sf
JOIN students s ON sf.stu_id = s.id
SET sf.amount = 2000, 
    sf.updated_at = NOW()
WHERE sf.ac_head_id = 3 
AND s.unique_id <= '260000';




-- //Same year duplicate student details query

SELECT *
FROM student_details
WHERE (student_id, session_id, class_id) IN (
    SELECT student_id, session_id, class_id
    FROM student_details
    GROUP BY student_id, session_id, class_id
    HAVING COUNT(*) > 1
);


-- Update Query to Set f_phone from phone

UPDATE students 
SET f_phone = phone
WHERE f_phone IS NULL OR f_phone = '';