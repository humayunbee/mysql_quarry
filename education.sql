আপনি student_fee টেবিলে stu_id = 64 এর সব ফি খুঁজতেছেন — তবে এমন ফি যেগুলা student_fee_collection টেবিলে নেওয়া হয় নাই, অর্থাৎ fee_id student_fee_collection-এ নাই।

তাই নিচের SQL টি আপনার উদ্দেশ্য একদম ঠিকভাবে পূরণ করবে:

✅ চূড়ান্ত SQL:

SELECT * FROM student_fee 
WHERE stu_id = 64 
  AND fee_id NOT IN (
      SELECT fee_id 
      FROM student_fee_collection
  );



...


//before add zero in phone number
UPDATE `students`
SET `f_phone` = CONCAT('0', `f_phone`)
WHERE LENGTH(`f_phone`) = 10;



laravel education_management


-- Database add colum

ALTER TABLE `system_settings` ADD `theme` int NOT NULL DEFAULT 1 AFTER `website`;

ALTER TABLE `subjects` ADD `subject_group` VARCHAR(30) NULL DEFAULT NULL AFTER `section_id`;

-- তুমি যদি চাও যেসব marks এন্ট্রির subject_id আর subjects টেবিলে নেই (মানে ডিলিট হয়ে গেছে), সেগুলো মুছে ফেলতে — তাহলে নিচের DELETE কুয়েরি ব্যবহার করো:
DELETE m
FROM marks m
LEFT JOIN subjects s ON m.subject_id = s.id
WHERE s.id IS NULL;





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
