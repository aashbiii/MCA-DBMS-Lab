SET SERVEROUTPUT ON;

DECLARE
    v_rows NUMBER;
BEGIN
    UPDATE Enrollments
    SET Marks = 85
    WHERE Student_ID = 'S0004' AND Course_ID = 'CSE101';

    v_rows := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Number of rows updated: ' || v_rows);
    
    COMMIT;
END;
/
