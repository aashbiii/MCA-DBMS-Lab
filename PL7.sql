SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_courses IS
        SELECT Course_ID, Course_Name
        FROM Courses
        WHERE Prof_ID = 'P1001';

    v_course c_courses%ROWTYPE;
BEGIN
    OPEN c_courses;
    LOOP
        FETCH c_courses INTO v_course;
        EXIT WHEN c_courses%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Course ID: ' || v_course.Course_ID ||
                             ', Name: ' || v_course.Course_Name);
    END LOOP;
    CLOSE c_courses;
END;
/
