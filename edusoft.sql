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




-- ই কোয়েরিটি সরাসরি students টেবিলের সব ID চেক করবে এবং যে ID গুলো সেখানে নেই, সেগুলো student_details থেকে নিয়ে আসবে।


SELECT * 
FROM student_details 
WHERE student_id NOT IN (
    SELECT id 
    FROM students 
    WHERE id IS NOT NULL
);




-- ✅ ভুল subject যুক্ত মার্ক এন্ট্রি (সার্চ):

SELECT m.*
FROM marks m
JOIN student_details sd ON m.stu_details_id = sd.id
LEFT JOIN subjects s 
    ON s.group_id = sd.group_id 
    AND s.class_id = sd.class_id 
    AND s.medium_id = sd.medium_id 
    AND m.subject_id = s.id
WHERE s.id IS NULL;


-- এই রেজাল্ট দেখে নিশ্চয়তা পেলে পরে নিচের মতো করে ডিলিট করতে পারো:

DELETE m
FROM marks m
JOIN student_details sd ON m.stu_details_id = sd.id
LEFT JOIN subjects s 
    ON s.group_id = sd.group_id 
    AND s.class_id = sd.class_id 
    AND s.medium_id = sd.medium_id 
    AND m.subject_id = s.id
WHERE s.id IS NULL;
