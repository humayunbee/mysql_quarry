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

ALTER TABLE `system_settings` 
ADD COLUMN IF NOT EXISTS `theme` INT NOT NULL DEFAULT 1 AFTER `website`,
ADD COLUMN IF NOT EXISTS `software_status` INT NOT NULL DEFAULT 0 AFTER `theme`;

ALTER TABLE `subjects` 
ADD COLUMN IF NOT EXISTS `subject_group` VARCHAR(30) NULL DEFAULT NULL AFTER `section_id`;

ALTER TABLE `web_downloads` 
ADD COLUMN IF NOT EXISTS `teacher_id` BIGINT DEFAULT NULL AFTER `status`;

ALTER TABLE `chair_member_messeges`
ADD COLUMN IF NOT EXISTS `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL AFTER `type`,
ADD COLUMN IF NOT EXISTS `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL AFTER `title`;

ALTER TABLE `exams` 
ADD COLUMN IF NOT EXISTS `result_status` TINYINT(1) NOT NULL DEFAULT 0 AFTER `status`;
CREATE TABLE IF NOT EXISTS `important_link` (
  `id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `url_link` text,
  `status` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

INSERT IGNORE INTO `important_link` (`id`, `title`, `url_link`, `status`) VALUES
(1, 'Ministry of Education', 'https://moedu.gov.bd/', 1),
(2, 'DSHE', 'http://www.dshe.gov.bd/', 1),
(3, 'Dhaka Education Board', 'https://dhakaeducationboard.gov.bd/', 1),
(4, 'BTEB', 'http://www.techedu.gov.bd/', 1),
(5, 'Primary & Mass Education', 'http://www.dpe.gov.bd/', 1),
(6, 'techedu', 'http://www.techedu.gov.bd', 1),
(7, 'BANBEIS', 'http://www.banbeis.gov.bd/', 1),
(8, 'ESIF', 'http://esif.teletalk.com.bd/', 1),
(9, 'comilla Education Board', 'https://comillaboard.portal.gov.bd/', 1),
(10, 'EMIS ', 'http://emis.gov.bd/', 1);

ALTER TABLE `important_link`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `important_link`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;






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
