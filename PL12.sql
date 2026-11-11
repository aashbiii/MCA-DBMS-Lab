CREATE OR REPLACE FUNCTION count_courses_by_dept (
    p_dept_id IN Courses.Dept_ID%TYPE
) RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Courses
    WHERE Dept_ID = p_dept_id;

    RETURN v_count;
END;
/

DECLARE
    v_total NUMBER;
BEGIN
    v_total := count_courses_by_dept('D01');
    DBMS_OUTPUT.PUT_LINE('Total courses: ' || v_total);
END;
/
