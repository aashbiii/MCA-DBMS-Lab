SET SERVEROUTPUT ON;

DECLARE
    v_rows NUMBER;
BEGIN
    INSERT INTO Students
    VALUES ('S0005', 'Rohit Sharma', 'D01', TO_DATE('2003-08-15', 'YYYY-MM-DD'));

    v_rows := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Number of rows inserted: ' || v_rows);
    
    COMMIT;
END;
/
