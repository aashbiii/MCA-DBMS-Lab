CREATE OR REPLACE FUNCTION get_student_age (
    p_student_id IN Students.Student_ID%TYPE
) RETURN NUMBER
IS
    v_dob DATE;
    v_age NUMBER;
BEGIN
    SELECT DOB INTO v_dob
    FROM Students
    WHERE Student_ID = p_student_id;

    v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    RETURN v_age;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

DECLARE
    v_age NUMBER;
BEGIN
    v_age := get_student_age('S0001');
    DBMS_OUTPUT.PUT_LINE('Age: ' || v_age);
END;
/
