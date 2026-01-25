✅ বর্তমান ফোল্ডারকে .zip করার কমান্ড (ফোল্ডারের বাইরে থেকে):

zip -r promisedelivery_$(date +%F).zip .
zip -r isle_$(date +%F).zip .

🔹 এই কমান্ডটি বর্তমান ডিরেক্টরির সবকিছু (ফাইল ও সাবফোল্ডার সহ) promisedelivery_তারিখ.zip নামে কম্প্রেস করবে।

✅ উদাহরণ আউটপুট:
ফাইল তৈরি হবে:
promisedelivery_2025-05-25.zip

✅ ottdb ডেটাবেস আলাদাভাবে ব্যাকআপ:
mysqldump -u root -p ottdb > ottdb_backup_$(date +%F).sql

✅ ottdb_shadow ডেটাবেস আলাদাভাবে ব্যাকআপ:
mysqldump -u root -p ottdb_shadow > ottdb_shadow_backup_$(date +%F).sql


