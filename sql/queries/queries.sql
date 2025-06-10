-- Retrieve the complete list of courses a student is registered for, along with the scheduled times and venues

SELECT 
    c.Course_ID, 
    c.Name AS Course_Name, 
    s.SessionDate, 
    s.StartTime, 
    s.EndTime, 
    v.Building_Name, 
    v.Room_No
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer_ID
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Sessions s ON co.CourseOffer_ID = s.CourseOffer
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    r.Student_ID = '5'
    AND s.CourseOffer IS NOT NULL;

-- List available elective courses for the upcoming semester filtered by the student’s department

SELECT 
    c.Course_ID, 
    c.Name AS Course_Name, 
    c.Course_Type
FROM 
    Course c
    JOIN Course_Offer co ON c.Course_ID = co.Course_ID
    JOIN Semester sem ON co.Semester = sem.Name
    JOIN Program p ON c.Prog_ID = p.ProgID
WHERE 
    c.Course_Type = 'Elective'
    AND sem.Name = 'Spring 2021'
    AND p.ProgID = (
        SELECT p2.ProgID 
        FROM Student s 
        JOIN Registration r ON s.Student_ID = r.Student_ID
        JOIN Course_Offer co2 ON r.CourseOffer = co2.CourseOffer
        JOIN Course c2 ON co2.Course_ID = c2.Course_ID
        JOIN Program p2 ON c2.Prog_ID = p2.ProgID
        WHERE s.Student_ID = '9'
        LIMIT 1
    );

-- Provide detailed room information (e.g., building name, room number) for a scheduled lecture

SELECT 
    c.Name AS Course_Name, 
    v.Building, 
    v.RoomNo
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Sessions s ON co.CourseOffer = s.CourseOffer
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    r.Student_ID = '5'
    AND s.Session_ID = 'S005';

-- Retrieve assigned lab groups and their scheduled timings

SELECT 
    s.Lab_Group, 
    sess.SessionDate, 
    sess.Start_Time, 
    sess.End_Time
FROM 
    Student s
    LEFT JOIN Sessions sess ON sess.Title LIKE CONCAT('%', s.Lab_Group, '%')
WHERE 
    s.Student_ID = '8'
    AND sess.CourseOffer IS NOT NULL;

-- Generate a historical academic performance report across all semesters

SELECT 
    sem.Name AS Semester_Name, 
    c.Name AS Course_Name, 
    r.Grade
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Semester sem ON co.Semester = sem.Name
WHERE 
    r.Student_ID = '1'
ORDER BY 
    sem.YearOf;

-- Display upcoming campus events or workshops relevant to the student

SELECT 
    s.SessionDate, 
    s.Start_Time, 
    s.End_Time, 
    s.Title
FROM 
    Sessions s
WHERE 
    s.CourseOffer IS NULL
    AND s.Conducted_by IS NOT NULL
    AND s.SessionDate > '2023-09-16';

-- Retrieve information on available scholarships and financial aid opportunities

SELECT 
    Name, 
    Scholarship_ID
FROM 
    Scholarships;

-- List extra-curricular activities and club meetings scheduled for the current week

SELECT 
    s.SessionDate, 
    s.Start_Time, 
    s.End_Time, 
    s.Title
FROM 
    Sessions s
WHERE 
    s.Conducted_by IS NOT NULL
    AND s.CourseOffer IS NULL
    AND s.SessionDate BETWEEN '2023-09-10' 
                          AND '2023-09-16';

-- Generate a personalized study plan based on the required credit hours

WITH CompletedCredits AS (
    SELECT SUM(c.Credits) AS Completed_Credits
    FROM Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    WHERE r.Student_ID = '8'
)
SELECT 
    c.Course_ID, 
    c.Name, 
    c.Credits
FROM 
    Course c
    JOIN Course_Offer co ON c.Course_ID = co.Course_ID
    JOIN Semester sem ON co.Semester = sem.Name
WHERE 
    sem.Name = 'Spring 2021'
    AND c.Course_ID NOT IN (
        SELECT co2.Course_ID 
        FROM Registration r2 
        JOIN Course_Offer co2 ON r2.CourseOffer = co2.CourseOffer
        WHERE r2.Student_ID = '8'
    )

-- Retrieve the number of students enrolled in each course taught

SELECT 
    c.Name AS Course_Name, 
    COUNT(r.Student_ID) AS Enrollment_Count
FROM 
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    LEFT JOIN Registration r ON co.CourseOffer = r.CourseOffer
WHERE 
    t.Professor_ID = '1'
GROUP BY 
    c.Name;

-- List courses with lower than average student performance for targeted interventions

WITH AvgGrade AS (
    SELECT AVG(CAST(r.Grade AS FLOAT)) AS Overall_Avg
    FROM Registration r
    WHERE r.Grade IS NOT NULL
)
SELECT 
    c.Name AS Course_Name, 
    AVG(CAST(r.Grade AS FLOAT)) AS Course_Avg
FROM 
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Registration r ON co.CourseOffer = r.CourseOffer
WHERE 
    t.Professor_ID = '4'
GROUP BY 
    c.Name
HAVING 
    AVG(CAST(r.Grade AS FLOAT)) < (SELECT Overall_Avg FROM AvgGrade);

-- Retrieve a list of research assistants working on a particular project

SELECT 
    s.Student_ID, 
    s.First_Name, 
	s.Last_Name
FROM 
    Assistance a
    JOIN Student s ON a.Student_ID = s.Student_ID
WHERE 
    a.Project_ID = '4';

-- List courses by type (elective/core) along with their enrollment figures

SELECT 
    c.Course_Type, 
    c.Name AS Course_Name, 
    COUNT(r.Student_ID) AS Enrollment_Count
FROM 
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    LEFT JOIN Registration r ON co.CourseOffer = r.CourseOffer
WHERE 
    t.Professor_ID = '6'
GROUP BY 
    c.Course_Type, c.Name;

-- Retrieve student feedback and evaluation summaries for courses taught

SELECT 
    c.Name AS Course_Name, 
    r.Feedback
FROM 
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Registration r ON co.CourseOffer = r.CourseOffer
WHERE 
    t.Professor_ID = '6'
    AND r.Feedback IS NOT NULL;

-- Track students requiring extra academic assistance based on performance

SELECT 
    s.Student_ID, 
    s.First_Name, 
	s.Last_Name,
    r.Grade
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Teaching t ON co.CourseOffer = t.CourseOffer
    JOIN Student s ON r.Student_ID = s.Student_ID
WHERE 
    t.Professor_ID = '8'
    AND CAST(r.Grade AS FLOAT) < 80; -- Threshold

-- Generate a comprehensive report on classroom usage and lecture delivery timings

SELECT 
    v.Building, 
    v.RoomNo, 
    s.SessionDate, 
    s.Start_Time, 
    s.End_Time
FROM 
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer
    JOIN Sessions s ON co.CourseOffer = s.CourseOffer
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    t.Professor_ID = '5	';

-- Identify scheduling conflicts between multiple courses

SELECT DISTINCT 
    r1.Student_ID, 
    c1.Name AS Course1, 
    c2.Name AS Course2, 
    s1.SessionDate, 
    s1.Start_Time, 
    s1.End_Time
FROM 
    Registration r1
    JOIN Course_Offer co1 ON r1.CourseOffer = co1.CourseOffer
    JOIN Course c1 ON co1.Course_ID = c1.Course_ID
    JOIN Sessions s1 ON co1.CourseOffer = s1.CourseOffer
    JOIN Registration r2 ON r1.Student_ID = r2.Student_ID
    JOIN Course_Offer co2 ON r2.CourseOffer = co2.CourseOffer
    JOIN Course c2 ON co2.Course_ID = c2.Course_ID
    JOIN Sessions s2 ON co2.CourseOffer = s2.CourseOffer
WHERE 
    r1.CourseOffer != r2.CourseOffer
    AND s1.SessionDate = s2.SessionDate
    AND s1.Start_Time < s2.End_Time
    AND s2.Start_Time < s1.End_Time;

-- Retrieve daily schedules for courses with associated professor details

SELECT 
    s.SessionDate, 
    s.Start_Time, 
    s.End_Time, 
    c.Name AS Course_Name, 
    p.First_Name AS Professor_FName,
	p.Last_Name AS Professor_LName
FROM 
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Sessions s ON co.CourseOffer = s.CourseOffer
    JOIN Professor p ON t.Professor_ID = p.Professor_ID
WHERE 
    t.Professor_ID = '5';

-- Display detailed lists of lab groups, batches, and sections for administrative management

SELECT 
    Lab_Group, 
    Sect AS Section, 
    Tutorial_Group AS Batch, 
    COUNT(Student_ID) AS Student_Count
FROM 
    Student
GROUP BY 
    Lab_Group, Sect, Tutorial_Group;

-- Retrieve real-time classroom occupancy and scheduling details

SELECT 
    v.Building_Name, 
    v.Room_No, 
    s.SessionDate, 
    s.StartTime, 
    s.EndTime, 
    s.Title
FROM 
    Sessions s
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    s.SessionDate = CURRENT_DATE
    AND s.StartTime <= CURRENT_TIME
    AND s.EndTime >= CURRENT_TIME;

-- Generate Building-wise Reports on Student Distributions

SELECT 
    v.Building, 
    COUNT(DISTINCT r.Student_ID) AS Student_Count
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Sessions s ON co.CourseOffer = s.CourseOffer
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    s.SessionDate = '2023-09-17'
GROUP BY 
    v.Building;

-- Identify rooms booked for special events outside regular class hours

SELECT 
    v.Building, 
    v.RoomNo, 
    s.SessionDate, 
    s.Start_Time, 
    s.End_Time
FROM 
    Sessions s
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    s.CourseOffer IS NULL
    AND (s.Start_Time < '08:00:00' OR s.End_Time > '18:00:00');

-- Display Detailed Data on Course Registrations

SELECT 
    c.Name AS Course_Name, 
    COUNT(r.Student_ID) AS Registered_Count
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
GROUP BY 
    c.Name;

-- Track Historical Usage Patterns for Lecture Theaters

SELECT 
    v.Building, 
    v.RoomNo, 
    COUNT(s.Session_ID) AS Usage_Count
FROM 
    Sessions s
    JOIN Venue v ON s.Venue_ID = v.Venue_ID
WHERE 
    v.Building LIKE '%Hall%'
GROUP BY 
    v.Building, v.RoomNo;

-- Retrieve Complete Academic report for an individual student

SELECT 
    sem.Name AS Semester_Name, 
    c.Name AS Course_Name, 
    r.Grade
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Semester sem ON co.Semester = sem.Name
WHERE 
    r.Student_ID = '3';

-- List Courses with Highest Enrolment Numbers

SELECT 
    c.Name AS Course_Name, 
    COUNT(r.Student_ID) AS Enrollment_Count
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Course c ON co.Course_ID = c.Course_ID
GROUP BY 
    c.Name
ORDER BY 
    Enrollment_Count DESC
LIMIT 5;

-- Display Students placed on Academic Probation

SELECT 
    s.Student_ID, 
    s.First_Name,
	s.Last_Name
FROM 
    Student s
    JOIN Registration r ON s.Student_ID = r.Student_ID
GROUP BY 
    s.Student_ID, s.First_Name
HAVING 
    AVG(CAST(r.Grade AS FLOAT)) < 80;

-- Generate Sem-Wise Performance Analytics

SELECT 
    sem.Name AS Semester_Name, 
    AVG(CAST(r.Grade AS FLOAT)) AS Avg_Grade
FROM 
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer
    JOIN Semester sem ON co.Semester = sem.Name
GROUP BY 
    sem.Name;

-- List Students eligible for scholarship awards

SELECT 
    s.Student_ID, 
    s.First_Name, 
	s.Last_Name,
    AVG(CAST(r.Grade AS FLOAT)) AS Avg_Grade
FROM 
    Student s
    JOIN Registration r ON s.Student_ID = r.Student_ID
GROUP BY 
    s.Student_ID
HAVING 
    AVG(CAST(r.Grade AS FLOAT)) > 90;

-- Retrieve List of Alumni Involved in Donation Initiatives

SELECT DISTINCT 
    a.Alumnus_ID
FROM 
    Alumnus a
    JOIN Donation_History dh ON a.Alumnus_ID = dh.Alumnus_ID;

-- Retrieve General Campus Information

SELECT 
    Building, 
    RoomNo
FROM 
    Venue;


