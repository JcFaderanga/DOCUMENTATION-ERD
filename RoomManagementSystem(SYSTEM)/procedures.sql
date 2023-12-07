
/*INSTRUCTOR TABLES*/
call instructor_left_join();
call instructor_inner_join();
call instructor_innerjoin_specific();


/*PROF SUBJECTS*/
call prof_subject();

/*ROOMS*/
call All_rooms();
call ABM();
call STEM();
call ICT();
call GAS();
call ADAS();
call HE();


/*TABLES*/
 call alltables();


/*ADMIN ACCOUNT*/
call admin_left_join();
call admin_right_join();
call admin_inner_join();


















DELIMITER //
Create Procedure instructor_left_join()
BEGIN
SELECT *
FROM 
  instructor
LEFT JOIN
  instructor_startend_date
ON
  instructor.instructor_id = instructor_startend_date.instructorDate_id;
END //
DELIMITER ;




DELIMITER //
Create Procedure instructor_inner_join()
BEGIN
SELECT *
  FROM instructor
INNER JOIN 
  instructor_startend_date 
ON 
  instructor.instructor_id = instructor_startend_date.instructorDate_id;
END //
DELIMITER ;




DELIMITER //
Create Procedure instructor_innerjoin_specific()
BEGIN
SELECT
    instructor.instructor_id,
    instructor.firstname,
    instructor.lastname,
    instructor_startend_date.startDate,
    instructor_startend_date.endDate
FROM
    instructor
LEFT JOIN
    instructor_startend_date
 ON 
    instructor.instructor_id = instructor_startend_date.instructorDate_id;
END //
DELIMITER ;


call instructor_left_join();
call instructor_inner_join();
call instructor_innerjoin_specific();


--------------------------------------------------------------------------------

SELECT * FROM
 instructor_subject 
LEFT JOIN 
subjects 
ON 
instructor_subject.subject_code = subjects.subject_code;


SELECT * FROM
instructor_subject 
RIGHT JOIN 
subjects 
ON 
instructor_subject.subject_code = subjects.subject_code;


DELIMITER //
Create Procedure prof_subject()
BEGIN
SELECT 
strands.strand_name,
subjects.subject_name,
instructor_subject.StartTime,
instructor_subject .EndTime
FROM
instructor_subject LEFT JOIN strands ON instructor_subject.strand = strands.strand_code
INNER JOIN subjects ON instructor_subject.subject_code = subjects.subject_code 
WHERE instructor_id = '$instructor_id' ORDER BY StartTime ASC;
END //
DELIMITER ;



call prof_subject();


---------------------------------------------------------------------------------


DELIMITER //
Create Procedure All_rooms()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID;
END //
DELIMITER ;


DELIMITER //
Create Procedure ABM()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "ABM";

END //
DELIMITER ;

DELIMITER //
Create Procedure STEM()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "STEM";
END //
DELIMITER ;

DELIMITER //
Create Procedure ICT()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "ICT";
END //
DELIMITER ;

DELIMITER //
Create Procedure GAS()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "GAS";
END //
DELIMITER ;

DELIMITER //
Create Procedure ADAS()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "ADAS";
END //
DELIMITER ;

DELIMITER //
Create Procedure HE()
BEGIN
SELECT 
            strands.strand_name,
            room_status.status,
            room_floors.floor_number,
            strand_room_details.room_number
        FROM 
            strand_room_details
        JOIN
            strands ON strands.strand_code = strand_room_details.strand_code_ID
        JOIN
            room_status ON room_status.status_ID = strand_room_details.room_status_ID
        JOIN
            room_floors ON room_floors.floor_ID = strand_room_details.room_floor_ID  
        JOIN
            grade_level ON grade_level.grade_level_ID = strand_room_details.grade_lvl_ID
   
WHERE strands.strand_name = "HE";
END //
DELIMITER ;
call All_rooms();
call ABM();
call STEM();
call ICT();
call GAS();
call ADAS();
call HE();




DELIMITER //
Create Procedure alltables()
BEGIN

SELECT * FROM admins;
SELECT * FROM admins_account;
SELECT * FROM grade_level;
SELECT * FROM instructor;
SELECT * FROM instructor_startend_date;
SELECT * FROM instructor_subject;
SELECT * FROM room_floors;
SELECT * FROM room_status;
SELECT * FROM strands;
SELECT * FROM strand_room_details;
SELECT * FROM subjects;

END //
DELIMITER ;


 call alltables();



DELIMITER //
Create Procedure admin_left_join()
BEGIN
SELECT
    admins.name,
    admins.lastname,
    admins_account.username,
    admins_account.password
FROM
    admins
LEFT JOIN
    admins_account
 ON 
    admins.id = admins_account.id;
END //
DELIMITER ;

DELIMITER //
Create Procedure admin_right_join()
BEGIN
SELECT
    admins.name,
    admins.lastname,
    admins_account.username,
    admins_account.password
FROM
    admins
RIGHT JOIN
    admins_account
 ON 
    admins.id = admins_account.id;
END //
DELIMITER ;



DELIMITER //
Create Procedure admin_inner_join()
BEGIN
SELECT
    admins.name,
    admins.lastname,
    admins_account.username,
    admins_account.password
FROM
    admins
JOIN
    admins_account
 ON 
    admins.id = admins_account.id;
END //
DELIMITER ;

call admin_left_join();
call admin_right_join();
call admin_inner_join();