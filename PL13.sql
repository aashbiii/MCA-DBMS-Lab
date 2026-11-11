CREATE OR REPLACE FUNCTION teaches_more_than_two_courses (
    p_prof_id IN Courses.Prof_ID%TYPE
) RETURN VARCHAR2
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Courses
    WHERE Prof_ID = p_prof_id;

    IF v_count >= 2 THEN
        RETURN 'Teaches';
    ELSE
        RETURN 'Does not teaches';
    END IF;
END;
/

DECLARE
    v_result VARCHAR2(20);
BEGIN
    v_result := teaches_more_than_two_courses('P1004');
    DBMS_OUTPUT.PUT_LINE(v_result || ' more than 2 courses ');
END;
/
