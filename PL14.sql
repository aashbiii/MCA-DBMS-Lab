CREATE OR REPLACE TRIGGER prevent_course_deletion
BEFORE DELETE ON Courses
FOR EACH ROW
BEGIN
    IF :OLD.Credits > 2 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete courses with more than 2 credits.');
    END IF;
END;
/
DELETE FROM Courses WHERE Course_ID = 'EEE101';