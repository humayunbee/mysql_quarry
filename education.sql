আপনি student_fee টেবিলে stu_id = 64 এর সব ফি খুঁজতেছেন — তবে এমন ফি যেগুলা student_fee_collection টেবিলে নেওয়া হয় নাই, অর্থাৎ fee_id student_fee_collection-এ নাই।

তাই নিচের SQL টি আপনার উদ্দেশ্য একদম ঠিকভাবে পূরণ করবে:

✅ চূড়ান্ত SQL:

SELECT * FROM student_fee 
WHERE stu_id = 64 
  AND fee_id NOT IN (
      SELECT fee_id 
      FROM student_fee_collection
  );



