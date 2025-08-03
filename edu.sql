-- old website to new database migration new website


INSERT INTO teachers (
    type, designation, name, joining_date, birthdate, mpo_date,
    index_no, email, phone, nid, photo, edu_qualification, status
)
SELECT
    type, degination, teacher_name, joining_date, birth_day, mpo_date,
    index_no, email, mobile, nid, picture, education_status, status
FROM teacher_information;






INSERT INTO notices (title, description, file, created_at, updated_at)
SELECT
    title,
    title, -- description এও title বসানো হলো
    file_name,
    date,
    date
FROM upload_file
WHERE 1 ;



INSERT INTO exam_result (`date`, `title`, `file`, `status`, `created_at`, `updated_at`)
SELECT
    date,
    title,
    file_name,
    1,              -- status ফিক্সড 1
    date,
    NOW()
FROM upload_file
WHERE 1;
