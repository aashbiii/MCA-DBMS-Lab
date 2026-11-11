SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE insert_course_if_valid (
    p_course_id IN Courses.Course_ID%TYPE,
    p_course_name IN Courses.Course_Name%TYPE,
    p_dept_id IN Courses.Dept_ID%TYPE,
    p_prof_id IN Courses.Prof_ID%TYPE,
    p_credits IN NUMBER,
    p_no_of_students IN NUMBER
) IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Departments WHERE Dept_ID = p_dept_id;
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Department does not exist!');
        RETURN;
    END IF;

    SELECT COUNT(*) INTO v_count FROM Professors WHERE Prof_ID = p_prof_id;
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Professor does not exist!');
        RETURN;
    END IF;

    -- Insert course
    INSERT INTO Courses
    VALUES (p_course_id, p_course_name, p_dept_id, p_prof_id, p_credits, p_no_of_students);

    DBMS_OUTPUT.PUT_LINE('Course inserted successfully!');
END;
/

BEGIN
    insert_course_if_valid('CSE401', 'Database Systems', 'D01', 'P1001', 4, 2);
END;
/
