-- old website to new database migration new website

-- Teacher Information Migration


INSERT INTO akfhhighschool_emsdb.teachers ( 
    designation, name, joining_date, birthdate, mpo_date,
    index_no, email, phone, nid, photo, edu_qualification, status
)
SELECT
    degination, teacher_name, joining_date, birth_day, mpo_date,
    NULL, email, mobile, nid, picture, education_status, status
FROM akfhhighschool_websitedb.teacher_information;

UPDATE `teachers` SET `type` = 'Teacher' WHERE  1;
UPDATE teachers
SET teacher_code = CONCAT('25', LPAD(id, 2, '0'));





-- Notice and Exam Result Migration

INSERT INTO akfhhighschool_emsdb.notices (title, description, file, created_at, updated_at)
SELECT
    title,
    title, -- description এও title বসানো হলো
    file_name,
    date,
    date
FROM akfhhighschool_websitedb.upload_file
WHERE 1 ;



-- Notice and Exam Result Migration

INSERT INTO akfhhighschool_emsdb.exam_result (`date`, `title`, `file`, `status`, `created_at`, `updated_at`)
SELECT
    date,
    title,
    file_name,
    1,              -- status ফিক্সড 1
    date,
    NOW()
FROM akfhhighschool_websitedb.upload_file
WHERE 1;


-- Executive Council Migration

INSERT INTO akfhhighschool_emsdb.excutive_council (id, name, designation, category)
SELECT id, name, designation, details
FROM akfhhighschool_websitedb.excutive_council;
