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