CREATE OR REPLACE TRIGGER block_weekend_changes
BEFORE DELETE OR UPDATE ON Courses
BEGIN
    IF TO_CHAR(SYSDATE, 'DAY') IN ('TUESDAY','FRIDAY','SATURDAY','SUNDAY') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Update/Delete operations are not allowed on weekends.');
    END IF;
END;
/
