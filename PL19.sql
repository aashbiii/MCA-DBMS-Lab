BEGIN
    EXECUTE IMMEDIATE '
        CREATE OR REPLACE VIEW Course_Avg_Marks AS
        SELECT c.Course_ID,
               c.Course_Name,
               ROUND(AVG(e.Marks), 2) AS Avg_Marks,
               COUNT(e.Student_ID) AS Num_Students
        FROM Courses c
        JOIN Enrollments e
            ON c.Course_ID = e.Course_ID
        GROUP BY c.Course_ID, c.Course_Name
        HAVING COUNT(e.Student_ID) > 1
    ';
END;
/
