BEGIN
    EXECUTE IMMEDIATE '
        CREATE OR REPLACE VIEW Student_Course_Count AS
        SELECT s.Student_ID,
               s.Student_Name,
               COUNT(e.Course_ID) AS Num_Courses
        FROM Students s
        LEFT JOIN Enrollments e
               ON s.Student_ID = e.Student_ID
        GROUP BY s.Student_ID, s.Student_Name
    ';
END;
/
