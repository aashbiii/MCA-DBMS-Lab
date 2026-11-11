SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE get_enrolled_courses IS
    v_student_id Students.Student_ID%TYPE;
    v_count NUMBER;
BEGIN
    v_student_id := '&stud_id';

    SELECT COUNT(*)
    INTO v_count
    FROM Enrollments
    WHERE Student_ID = v_student_id;

    DBMS_OUTPUT.PUT_LINE('Student ' || v_student_id ||
                         ' is enrolled in ' || v_count || ' courses.');
END;
/

BEGIN
    get_enrolled_courses;
END;
/
