# University Management System Database

This project provides a comprehensive database schema for a **University Management System**. The system is designed to serve as a centralized repository for all data related to students, faculty, courses, and campus activities. Its primary objective is to streamline academic and administrative operations, support data-driven decision-making, and provide real-time information to all university stakeholders.

-----

## Key Features

This database is engineered to support a wide array of features essential for a modern educational institution:

  * **Student & Academic Record Management**: Handles everything from initial registration and unique ID assignment to maintaining detailed academic histories, grades, and attendance.
  * **Course & Curriculum Management**: Provides a full catalog of courses with details on credits, prerequisites, and scheduling. It manages enrollments and integrates seamlessly with timetabling.
  * **Faculty & Course Assignment**: Manages faculty profiles, their course assignments, and their roles in research and student supervision.
  * **Facility & Venue Management**: Catalogs and manages the scheduling of all campus venues, from lecture halls to labs, including maintenance and safety protocols.
  * **Fee & Financial Tracking**: Tracks student fees, payments, scholarships, and generates financial reports and notifications.
  * **Reporting & Analytics**: Supports complex, ad-hoc queries to generate reports on student performance, enrollment trends, facility usage, and more.
  * **Secure, Role-Based Access**: Ensures data integrity and privacy by providing specific portals and access levels for different user types.

-----

## Application Users

The system is designed to be used by a variety of stakeholders within the university ecosystem:

  * **Students**
  * **Professors**
  * **Staff Members**
  * **Registrar**
  * **IT Administrators**
  * **Alumni**
  * **Parents**
  * **Visitors**

-----

## Database Schema

The database is composed of several interconnected tables that model the various entities and relationships within the university.

\<details\>
\<summary\>Click to view the complete SQL Schema\</summary\>

```sql
CREATE TABLE Under_Graduate (
    ProgID VARCHAR(10) PRIMARY KEY,
    Program_Name VARCHAR(30)
);
CREATE TABLE Post_Graduate (
    ProgID VARCHAR(10) PRIMARY KEY,
    Program_Name VARCHAR(30)
);
CREATE TABLE Doctorate (
    ProgID VARCHAR(10) PRIMARY KEY,
    Program_Name VARCHAR(30)
);
CREATE TABLE Program (
    ProgID VARCHAR(10) PRIMARY KEY
);
CREATE TABLE Semester (
    Name VARCHAR(30) PRIMARY KEY,
    Type VARCHAR(30),
    YearOf INT
);
CREATE TABLE Course (
    Course_ID VARCHAR(6) PRIMARY KEY,
    Name VARCHAR(30),
    Prog_ID VARCHAR(10),
    Course_Type VARCHAR(30),
    Credits INT,
    FOREIGN KEY (Prog_ID) REFERENCES Program(ProgID)
);
CREATE TABLE Pre_requisites (
    Course_ID VARCHAR(6),
    Required_ID VARCHAR(6),
    PRIMARY KEY (Course_ID, Required_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Required_ID) REFERENCES Course(Course_ID)
);
CREATE TABLE Course_Offer (
    CourseOffer_ID VARCHAR(30) PRIMARY KEY,
    Course_ID VARCHAR(6),
    Semester VARCHAR(30),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Semester) REFERENCES Semester(Name)
);
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Gender VARCHAR(10),
    Date_of_Birth DATE,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Address VARCHAR(225),
    Semester VARCHAR(30),
    Lab_Group INT,
    Sect CHAR NULL,
    Tutorial_Group INT,
    FOREIGN KEY (Semester) REFERENCES Semester(Name)
);
CREATE TABLE Registration (
    Student_ID INT,
    CourseOffer VARCHAR(30),
    Grade INT,
    Feedback VARCHAR(225),
    PRIMARY KEY (Student_ID, CourseOffer),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (CourseOffer) REFERENCES Course_Offer(CourseOffer_ID)
);
CREATE TABLE Professor (
    Professor_ID INT PRIMARY KEY,
    Email VARCHAR(30),
    Date_of_Birth DATE,
    First_Name VARCHAR(30),
    Last_Name VARCHAR(30),
    Address VARCHAR(225)
);
CREATE TABLE Teaching (
    Professor_ID INT,
    CourseOffer VARCHAR(30),
    PRIMARY KEY (Professor_ID, CourseOffer),
    FOREIGN KEY (Professor_ID) REFERENCES Professor(Professor_ID),
    FOREIGN KEY (CourseOffer) REFERENCES Course_Offer(CourseOffer_ID)
);
CREATE TABLE Venue (
    Venue_ID VARCHAR(10) PRIMARY KEY,
    Building_Name VARCHAR(30),
    Room_No INT
);
CREATE TABLE Sessions (
    Session_ID VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(30),
    Description VARCHAR(225),
    Venue_ID VARCHAR(10),
    SessionDate DATE,
    StartTime TIME,
    EndTime TIME,
    Conducted_by VARCHAR(30) NULL,
    CourseOffer VARCHAR(30) NULL,
    MarkAttendance BOOL,
    FOREIGN KEY (Venue_ID) REFERENCES Venue(Venue_ID),
    FOREIGN KEY (CourseOffer) REFERENCES Course_Offer(CourseOffer_ID)
);
-- ... and other tables as provided ...
```

\</details\>

-----

## 📈 Sample Queries

The database supports a wide range of queries to extract meaningful information for different user roles. Here are a few examples:

\<details\>
\<summary\>\<strong\>For Students\</strong\>\</summary\>

**Retrieve the complete list of courses a student is registered for:**

```sql
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
    r.Student_ID = '5';
```

**List available elective courses for the upcoming semester:**

```sql
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
    AND p.ProgID = (SELECT p2.ProgID FROM Student s JOIN Registration r ON s.Student_ID = r.Student_ID LIMIT 1);
```

\</details\>

\<details\>
\<summary\>\<strong\>For Professors\</strong\>\</summary\>

**Retrieve the number of students enrolled in each course taught:**

```sql
SELECT
    c.Name AS Course_Name,
    COUNT(r.Student_ID) AS Enrollment_Count
FROM
    Teaching t
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer_ID
    JOIN Course c ON co.Course_ID = c.Course_ID
    LEFT JOIN Registration r ON co.CourseOffer_ID = r.CourseOffer
WHERE
    t.Professor_ID = '1'
GROUP BY
    c.Name;
```

**List courses with lower than average student performance:**

```sql
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
    JOIN Course_Offer co ON t.CourseOffer = co.CourseOffer_ID
    JOIN Course c ON co.Course_ID = c.Course_ID
    JOIN Registration r ON co.CourseOffer_ID = r.CourseOffer
WHERE
    t.Professor_ID = '4'
GROUP BY
    c.Name
HAVING
    AVG(CAST(r.Grade AS FLOAT)) < (SELECT Overall_Avg FROM AvgGrade);
```

\</details\>

\<details\>
\<summary\>\<strong\>For Registrars & Administrators\</strong\>\</summary\>

**Identify scheduling conflicts between multiple courses:**

```sql
SELECT DISTINCT
    r1.Student_ID,
    c1.Name AS Course1,
    c2.Name AS Course2,
    s1.SessionDate,
    s1.Start_Time,
    s1.End_Time
FROM
    Registration r1
    JOIN Course_Offer co1 ON r1.CourseOffer = co1.CourseOffer_ID
    JOIN Sessions s1 ON co1.CourseOffer_ID = s1.CourseOffer
    JOIN Course c1 ON co1.Course_ID = c1.Course_ID
    JOIN Registration r2 ON r1.Student_ID = r2.Student_ID AND r1.CourseOffer != r2.CourseOffer
    JOIN Course_Offer co2 ON r2.CourseOffer = co2.CourseOffer_ID
    JOIN Sessions s2 ON co2.CourseOffer_ID = s2.CourseOffer
    JOIN Course c2 ON co2.Course_ID = c2.Course_ID
WHERE
    s1.SessionDate = s2.SessionDate
    AND s1.StartTime < s2.EndTime
    AND s2.StartTime < s1.EndTime;
```

**Generate Semester-Wise Performance Analytics:**

```sql
SELECT
    sem.Name AS Semester_Name,
    AVG(CAST(r.Grade AS FLOAT)) AS Avg_Grade
FROM
    Registration r
    JOIN Course_Offer co ON r.CourseOffer = co.CourseOffer_ID
    JOIN Semester sem ON co.Semester = sem.Name
GROUP BY
    sem.Name;
```

\</details\>

-----

## 🛠️ How to Use

To set up this database on your local system, follow these steps:

1.  **Create the Database**:

      * Create a new database in your preferred SQL management tool (e.g., MySQL Workbench, DBeaver, pgAdmin).

2.  **Build the Schema**:

      * Execute the `schema.sql` file containing all the `CREATE TABLE` statements to build the database structure.

3.  **Populate with Data**:

      * Run the `data.sql` file to insert the sample data into the tables. This will allow you to test the queries and explore the database's functionality.

4.  **Run Queries**:

      * You can now use the sample queries provided or write your own to interact with the database.
