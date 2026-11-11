BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Course_Log';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN 
         RAISE;
      END IF;
END;
/

CREATE TABLE Course_Log (
    Log_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Course_ID VARCHAR2(10),
    Old_Credits NUMBER,
    New_Credits NUMBER,
    Updated_On DATE
);

CREATE OR REPLACE PROCEDURE update_course_credits (
    p_course_id IN Courses.Course_ID%TYPE,
    p_new_credits IN NUMBER
) IS
    v_old_credits NUMBER;
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Courses
    WHERE Course_ID = p_course_id;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Course ID not found: ' || p_course_id);
        RETURN;
    END IF;

    SELECT Credits INTO v_old_credits
    FROM Courses
    WHERE Course_ID = p_course_id;

    UPDATE Courses
    SET Credits = p_new_credits
    WHERE Course_ID = p_course_id;

    INSERT INTO Course_Log (Course_ID, Old_Credits, New_Credits, Updated_On)
    VALUES (p_course_id, v_old_credits, p_new_credits, SYSDATE);

    DBMS_OUTPUT.PUT_LINE('Credits updated and logged successfully for course: ' || p_course_id);
END;
/

BEGIN
    update_course_credits('EEE101', 5);
END;
/

SELECT * FROM Course_Log;