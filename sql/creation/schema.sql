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
FOREIGN KEY (Prog_ID) REFERENCES
Program(ProgID)
);
CREATE TABLE Pre_requisites (
Course_ID VARCHAR(6),
Required_ID VARCHAR(6),
PRIMARY KEY (Course_ID, Required_ID),
FOREIGN KEY (Course_ID) REFERENCES
Course(Course_ID),
FOREIGN KEY (Required_ID) REFERENCES
Course(Course_ID)
);
CREATE TABLE Course_Offer (
CourseOffer VARCHAR(30) PRIMARY KEY,
Course_ID VARCHAR(6),
Semester VARCHAR(30),
FOREIGN KEY (Course_ID) REFERENCES
Course(Course_ID),
FOREIGN KEY (Semester) REFERENCES
Semester(Name)
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
FOREIGN KEY (Student_ID) REFERENCES
Student(Student_ID),
FOREIGN KEY (CourseOffer) REFERENCES
Course_Offer(CourseOffer)
);
CREATE TABLE Affiliate (
    Affiliate_ID INT PRIMARY KEY,
    ProgID VARCHAR(10) NULL,
    Enrol_Year INT,
    FOREIGN KEY (ProgID) REFERENCES Program(ProgID)
);
CREATE TABLE Alumnus (
    Alumnus_ID INT PRIMARY KEY,
    Grad_Year INT,
    Company_Name VARCHAR(30) NULL
);
CREATE TABLE Donation_History (
Alumnus_ID INT,
DonationDate DATE,
Amount INT,
PRIMARY KEY (Alumnus_ID, DonationDate,
Amount),
FOREIGN KEY (Alumnus_ID) REFERENCES
Alumnus(Alumnus_ID)
);
CREATE TABLE Scholarships (
Scholarship_ID INT PRIMARY KEY,
Name VARCHAR(30)
);
CREATE TABLE Attained_Scholarships (
Scholarship_ID INT,
StudentID INT,
Amount INT,
ScholDate DATE,
PRIMARY KEY (Scholarship_ID, StudentID,
ScholDate),
FOREIGN KEY (Scholarship_ID) REFERENCES
Scholarships(Scholarship_ID),
FOREIGN KEY (StudentID) REFERENCES
Student(Student_ID)
);
CREATE TABLE Visitor (
Visitee_ID INT,
VisitorName VARCHAR(30),
Purpose VARCHAR(225),
VisitDate DATE,
Entry_Time TIME,
Exit_Time TIME NULL,
PRIMARY KEY (Visitee_ID, VisitorName)
);
CREATE TABLE Professor (
Professor_ID INT PRIMARY KEY,
Email VARCHAR(30),
Date_of_Birth DATE,
First_Name VARCHAR(30),
Last_Name VARCHAR(30),
Address VARCHAR(225)
);
CREATE TABLE Project (
Project_ID INT PRIMARY KEY,
Name VARCHAR(30),
Status CHAR,
Budget INT NULL,
Description VARCHAR(225) NULL
);
CREATE TABLE Supervision (
Project_ID INT,
Professor_ID INT,
PRIMARY KEY (Professor_ID, Project_ID),
FOREIGN KEY (Project_ID) REFERENCES
Project(Project_ID),
FOREIGN KEY (Professor_ID) REFERENCES
Professor(Professor_ID)
);
CREATE TABLE Assistance (
    Student_ID INT,
    Project_ID INT,
    PRIMARY KEY (Student_ID, Project_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Project_ID) REFERENCES Project(Project_ID)
);
CREATE TABLE Teaching (
Professor_ID INT,
CourseOffer VARCHAR(30),
PRIMARY KEY (Professor_ID, CourseOffer),
FOREIGN KEY (Professor_ID) REFERENCES
Professor(Professor_ID),
FOREIGN KEY (CourseOffer) REFERENCES
Course_Offer(CourseOffer)
);
CREATE TABLE Club (
Club_Name VARCHAR(30) PRIMARY KEY
);
CREATE TABLE Committee (
Committee_Name VARCHAR(30) PRIMARY KEY
);
CREATE TABLE Student_Bodies (
Name VARCHAR(30) PRIMARY KEY,
Mentor_ID INT,
FOREIGN KEY (Mentor_ID) REFERENCES
Professor(Professor_ID)
);
CREATE TABLE Member (
Student_ID INT,
Name VARCHAR(30),
Position VARCHAR(30) NULL,
PRIMARY KEY (Student_ID, Name),
FOREIGN KEY (Student_ID) REFERENCES
Student(Student_ID),
FOREIGN KEY (Name) REFERENCES
Student_Bodies(Name)
);
CREATE TABLE Staff (
Staff_ID INT PRIMARY KEY,
First_Name VARCHAR(30), 
Last_Name VARCHAR(30), 
Email VARCHAR(30)
);
CREATE TABLE Venue (
Venue_ID VARCHAR(10) PRIMARY KEY,
Building VARCHAR(30),
RoomNo INT
);
CREATE TABLE Maintenance (
Staff_ID INT,
Venue_ID VARCHAR(10),
PRIMARY KEY (Staff_ID, Venue_ID),
FOREIGN KEY (Staff_ID) REFERENCES
Staff(Staff_ID),
FOREIGN KEY (Venue_ID) REFERENCES
Venue(Venue_ID)
);
CREATE TABLE Sessions (
Session_ID VARCHAR(10) PRIMARY KEY,
Title VARCHAR(30),
Description VARCHAR(225),
Venue_ID VARCHAR(10),
SessionDate DATE,
Start_Time TIME,
End_Time TIME,
Conducted_by VARCHAR(30) NULL,
CourseOffer VARCHAR(30) NULL,
MarkAttendance BOOL,
FOREIGN KEY (Venue_ID) REFERENCES
Venue(Venue_ID),
FOREIGN KEY (CourseOffer) REFERENCES
Course_Offer(CourseOffer),
FOREIGN KEY (Conducted_by) REFERENCES
Student_Bodies(Name)
);
CREATE TABLE Attendance (
    Affiliate_ID INT,
    Session_ID VARCHAR(10),
    PRIMARY KEY (Affiliate_ID, Session_ID),
    FOREIGN KEY (Affiliate_ID) REFERENCES Affiliate(Affiliate_ID),
    FOREIGN KEY (Session_ID) REFERENCES Sessions(Session_ID)
);
