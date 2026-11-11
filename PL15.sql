SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER log_marks_update
AFTER UPDATE OF Marks ON Enrollments
FOR EACH ROW
BEGIN
    INSERT INTO Enrollments_Log (Log_ID, Student_ID, Course_ID, Old_Marks, New_Marks, Updated_On)
    VALUES (Enrollments_Log_seq.NEXTVAL, :OLD.Student_ID, :OLD.Course_ID, :OLD.Marks, :NEW.Marks, SYSDATE);
END;
/
