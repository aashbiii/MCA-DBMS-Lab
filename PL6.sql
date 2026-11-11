SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_high_marks IS
        SELECT s.Student_ID, s.Student_Name, e.Course_ID, e.Marks
        FROM Students s
        JOIN Enrollments e ON s.Student_ID = e.Student_ID
        WHERE e.Marks > 80;

    v_student c_high_marks%ROWTYPE;
BEGIN
    OPEN c_high_marks;
    LOOP
        FETCH c_high_marks INTO v_student;
        EXIT WHEN c_high_marks%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Student: ' || v_student.Student_Name ||
                             ', Course: ' || v_student.Course_ID ||
                             ', Marks: ' || v_student.Marks);
    END LOOP;
    CLOSE c_high_marks;
END;
/
