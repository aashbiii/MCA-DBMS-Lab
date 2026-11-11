CREATE OR REPLACE TRIGGER prevent_duplicate_enrollment
BEFORE INSERT ON Enrollments
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Enrollments
    WHERE Student_ID = :NEW.Student_ID
      AND Course_ID  = :NEW.Course_ID;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Duplicate enrollment not allowed.');
    END IF;
END;
/
