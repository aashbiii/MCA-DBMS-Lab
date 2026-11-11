SET SERVEROUTPUT ON;

DECLARE
    v_total NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_total
    FROM Students s
    JOIN Departments d ON s.Dept_ID = d.Dept_ID
    WHERE d.Dept_Name = 'Computer Science';

    DBMS_OUTPUT.PUT_LINE('Total students in Computer Science: ' || v_total);
END;
/
