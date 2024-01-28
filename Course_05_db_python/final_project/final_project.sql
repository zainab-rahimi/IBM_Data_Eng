/* Task 1 
Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98. */

SELECT P.NAME_OF_SCHOOL, P.AVERAGE_STUDENT_ATTENDANCE, P.COMMUNITY_AREA_NAME, S.HARDSHIP_INDEX
FROM chicago_public_schools AS P LEFT JOIN chicago_socioeconomic_data AS S
ON P.COMMUNITY_AREA_NUMBER = S.COMMUNITY_AREA_NUMBER 
WHERE
S.HARDSHIP_INDEX = 98


-- Task 1 a 
--Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and community name.

SELECT C.CASE_NUMBER, C.PRIMARY_TYPE, C.LOCATION_DESCRIPTION, S.COMMUNITY_AREA_NAME
FROM chicago_crime AS C LEFT JOIN chicago_socioeconomic_data AS S
ON C.COMMUNITY_AREA_NUMBER = S.COMMUNITY_AREA_NUMBER 
WHERE
C.LOCATION_DESCRIPTION LIKE '%SCHOOL%'

/* Task 2
 Question 1
Write and execute a SQL statement to create a view showing the columns listed in the following table, 
with new column names as shown in the second column */
-- Write and execute a SQL statement that returns all of the columns from the view.



CREATE VIEW user_view AS
SELECT 
    NAME_OF_SCHOOL AS School_Name,
    Safety_Icon AS Safety_Rating,
    Family_Involvement_Icon AS Family_Rating,
    Environment_Icon AS Environment_Rating,
    Instruction_Icon AS Instruction_Rating,
    Leaders_Icon AS Leaders_Rating,
    Teachers_Icon AS Teachers_Rating
FROM 
    chicago_public_schools

--Write and execute a SQL statement that returns just the school name and leaders rating from the view.
SELECT School_Name,Leaders_Rating FROM user_view


/* Write the structure of a query to create or replace a 
stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter
 as an integer and a in_Leader_Score parameter as an integer.*/

DELIMITER //
CREATE PROCEDURE
UPDATE_LEADERS_SCORE (in_School_ID INTEGER, in_Leader_Score INTEGER)
BEGIN
	UPDATE chicago_public_schools
    SET  Leaders_Score = in_Leader_Score
    WHERE School_ID  = in_School_ID ;
    
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE UPDATE_LEADERS_SCORE (in_School_ID INTEGER, in_Leader_Score INTEGER)
BEGIN
    UPDATE chicago_public_schools
    SET Leaders_Score = in_Leader_Score
    WHERE School_ID = in_School_ID;

    IF in_Leader_Score > 0 AND in_Leader_Score < 20 THEN                           -- Start of conditional statement
        UPDATE chicago_public_schools
        SET Leaders_Icon = 'Very_weak'
        WHERE School_ID = in_School_ID;
    ELSEIF in_Leader_Score < 40 THEN
        UPDATE chicago_public_schools
        SET Leaders_Icon = 'Weak'
        WHERE School_ID = in_School_ID;
    ELSEIF in_Leader_Score < 60 THEN
        UPDATE chicago_public_schools
        SET Leaders_Icon = 'Average'
        WHERE School_ID = in_School_ID;
    ELSEIF in_Leader_Score < 80 THEN
        UPDATE chicago_public_schools
        SET Leaders_Icon = 'Strong'
        WHERE School_ID = in_School_ID;
    ELSEIF in_Leader_Score < 100 THEN
        UPDATE chicago_public_schools
        SET Leaders_Icon = 'Very strong'
        WHERE School_ID = in_School_ID;
    END IF;

END //
DELIMITER ;


SELECT School_ID, Leaders_Score
FROM chicago_public_schools
WHERE School_ID = 610212;

CALL UPDATE_LEADERS_SCORE (610212, 50.);

SELECT School_ID, Leaders_Score, Leaders_Icon
FROM chicago_public_schools
WHERE School_ID = 610212;
