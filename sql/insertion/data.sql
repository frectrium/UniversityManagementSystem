INSERT INTO Program (ProgID) VALUES
('P001'), ('P002'), ('P003'), ('P004'), ('P005'),
('P006'), ('P007'), ('P008'), ('P009'), ('P010'),
('P011'), ('P012'), ('P013'), ('P014'), ('P015'),
('P016'), ('P017'), ('P018'), ('P019'), ('P020'),
('P021'), ('P022'), ('P023'), ('P024');

INSERT INTO Under_Graduate (ProgID, Program_Name) VALUES
('P001', 'BSc Computer Science'),
('P002', 'BSc Mathematics'),
('P003', 'BSc Physics'),
('P004', 'BSc Chemistry'),
('P005', 'BSc Biology'),
('P006', 'BSc Engineering'),
('P007', 'BSc Economics'),
('P008', 'BSc Psychology');

INSERT INTO Post_Graduate (ProgID, Program_Name) VALUES
('P009', 'MSc Computer Science'),
('P010', 'MSc Data Science'),
('P011', 'MSc Artificial Intelligence'),
('P012', 'MSc Physics'),
('P013', 'MSc Chemistry'),
('P014', 'MSc Biology'),
('P015', 'MSc Engineering'),
('P016', 'MSc Economics');

INSERT INTO Doctorate (ProgID, Program_Name) VALUES
('P017', 'PhD Computer Science'),
('P018', 'PhD Mathematics'),
('P019', 'PhD Physics'),
('P020', 'PhD Chemistry'),
('P021', 'PhD Biology'),
('P022', 'PhD Engineering'),
('P023', 'PhD Economics'),
('P024', 'PhD Psychology');

INSERT INTO Semester (Name, Type, YearOf) VALUES
('Fall 2018', 'Fall', 2018), ('Spring 2019', 'Spring', 2019),
('Summer 2019', 'Summer', 2019), ('Fall 2019', 'Fall', 2019),
('Spring 2020', 'Spring', 2020), ('Summer 2020', 'Summer', 2020),
('Fall 2020', 'Fall', 2020), ('Spring 2021', 'Spring', 2021),
('Summer 2021', 'Summer', 2021), ('Fall 2021', 'Fall', 2021),
('Spring 2022', 'Spring', 2022), ('Summer 2022', 'Summer', 2022),
('Fall 2022', 'Fall', 2022), ('Spring 2023', 'Spring', 2023),
('Summer 2023', 'Summer', 2023), ('Fall 2023', 'Fall', 2023),
('Spring 2024', 'Spring', 2024), ('Summer 2024', 'Summer', 2024),
('Fall 2024', 'Fall', 2024), ('Spring 2018', 'Spring', 2018),
('Summer 2018', 'Summer', 2018);

INSERT INTO Alumnus (Alumnus_ID, Grad_Year, Company_Name) VALUES
(1, 2010, 'TechCorp'), (2, 2011, NULL), (3, 2012, 'EduInc'),
(4, 2013, 'BioLabs'), (5, 2014, NULL), (6, 2015, 'EngWorks'),
(7, 2016, 'MathSolutions'), (8, 2017, NULL), (9, 2018, 'PhysTech'),
(10, 2019, 'ChemCo'), (11, 2020, NULL), (12, 2021, 'AI Systems'),
(13, 2010, 'EcoFirm'), (14, 2011, NULL), (15, 2012, 'PsycheLab'),
(16, 2013, 'DataNow'), (17, 2014, NULL), (18, 2015, 'CompSci Inc'),
(19, 2016, 'EngTech'), (20, 2017, NULL);

INSERT INTO Scholarships (Scholarship_ID, Name) VALUES
(1, 'Merit Award'), (2, 'Need-Based Grant'), (3, 'STEM Scholarship'),
(4, 'Leadership Award'), (5, 'Research Grant'), (6, 'Excellence Award'),
(7, 'Community Service Scholarship'), (8, 'Innovation Grant'),
(9, 'Academic Excellence'), (10, 'Diversity Scholarship'),
(11, 'Science Fund'), (12, 'Engineering Prize'), (13, 'Math Award'),
(14, 'Physics Grant'), (15, 'Chemistry Scholarship'),
(16, 'Biology Fund'), (17, 'Economics Prize'), (18, 'Psychology Grant'),
(19, 'Graduate Fellowship'), (20, 'Doctoral Stipend');

INSERT INTO Professor (Professor_ID, Email, Date_of_Birth, First_Name, Last_Name, Address) VALUES
(1, 'alice@univ.edu', '1970-01-01', 'Alice', 'Brown', '101 Univ Rd'),
(2, 'bob@univ.edu', '1972-02-02', 'Bob', 'Green', '102 Univ Rd'),
(3, 'clara@univ.edu', '1975-03-03', 'Clara', 'White', '103 Univ Rd'),
(4, 'david@univ.edu', '1968-04-04', 'David', 'Black', '104 Univ Rd'),
(5, 'eve@univ.edu', '1973-05-05', 'Eve', 'Smith', '105 Univ Rd'),
(6, 'frank@univ.edu', '1971-06-06', 'Frank', 'Jones', '106 Univ Rd'),
(7, 'grace@univ.edu', '1974-07-07', 'Grace', 'Lee', '107 Univ Rd'),
(8, 'hank@univ.edu', '1969-08-08', 'Hank', 'Davis', '108 Univ Rd'),
(9, 'ivy@univ.edu', '1976-09-09', 'Ivy', 'Taylor', '109 Univ Rd'),
(10, 'jack@univ.edu', '1970-10-10', 'Jack', 'Wilson', '110 Univ Rd'),
(11, 'kate@univ.edu', '1972-11-11', 'Kate', 'Moore', '111 Univ Rd'),
(12, 'leo@univ.edu', '1975-12-12', 'Leo', 'Clark', '112 Univ Rd'),
(13, 'mia@univ.edu', '1973-01-13', 'Mia', 'Harris', '113 Univ Rd'),
(14, 'nora@univ.edu', '1971-02-14', 'Nora', 'Lewis', '114 Univ Rd'),
(15, 'oliver@univ.edu', '1974-03-15', 'Oliver', 'Walker', '115 Univ Rd'),
(16, 'pam@univ.edu', '1969-04-16', 'Pam', 'Young', '116 Univ Rd'),
(17, 'quinn@univ.edu', '1976-05-17', 'Quinn', 'King', '117 Univ Rd'),
(18, 'rose@univ.edu', '1970-06-18', 'Rose', 'Scott', '118 Univ Rd'),
(19, 'sam@univ.edu', '1972-07-19', 'Sam', 'Adams', '119 Univ Rd'),
(20, 'tina@univ.edu', '1975-08-20', 'Tina', 'Baker', '120 Univ Rd');

INSERT INTO Project (Project_ID, Name, Status, Budget, Description) VALUES
(1, 'AI Research', 'O', 10000, 'AI advancements'),
(2, 'Quantum Computing', 'C', 20000, 'Quantum tech'),
(3, 'Bioinformatics', 'O', 15000, 'Genetic analysis'),
(4, 'Robotics', 'O', 12000, 'Robot development'),
(5, 'Data Mining', 'C', 8000, 'Data extraction'),
(6, 'Physics Simulations', 'O', 18000, 'Simulation tools'),
(7, 'Chem Modeling', 'C', 9000, 'Chemical models'),
(8, 'Eco Study', 'O', 11000, 'Ecosystem research'),
(9, 'Math Theory', 'O', 7000, 'Theoretical math'),
(10, 'Psych Experiments', 'C', 13000, 'Behavioral studies'),
(11, 'Eng Design', 'O', 16000, 'Engineering design'),
(12, 'Comp Security', 'O', 14000, 'Cybersecurity'),
(13, 'Nano Tech', 'C', 17000, 'Nanotechnology'),
(14, 'Stats Analysis', 'O', 6000, 'Statistical models'),
(15, 'Bio Eng', 'O', 19000, 'Bioengineering'),
(16, 'Econ Models', 'C', 10000, 'Economic modeling'),
(17, 'Phys Experiments', 'O', 15000, 'Physics research'),
(18, 'Chem Synthesis', 'O', 12000, 'Chemical synthesis'),
(19, 'AI Ethics', 'C', 11000, 'AI ethics study'),
(20, 'Robot Learning', 'O', 13000, 'Machine learning');

INSERT INTO Club (Club_Name) VALUES
('Chess Club'), ('Robotics Club'), ('Math Club'),
('Physics Society'), ('Chemistry Club'), ('Bio Society'),
('Engineering Club'), ('Economics Club'), ('Psych Club'),
('Coding Club'), ('Debate Club'), ('Music Club'),
('Art Club'), ('Drama Club'), ('Sports Club'),
('Photography Club'), ('Literature Club'), ('Gaming Club'),
('Volunteer Club'), ('Science Club');

INSERT INTO Committee (Committee_Name) VALUES
('Admissions'), ('Curriculum'), ('Research'),
('Ethics'), ('Budget'), ('Events'),
('Discipline'), ('Scholarship'), ('Faculty'),
('Student Affairs'), ('Safety'), ('Library'),
('IT Committee'), ('Diversity'), ('Alumni'),
('Sustainability'), ('Health'), ('Sports'),
('Culture'), ('Outreach');

INSERT INTO Staff (Staff_ID, First_Name, Last_Name, Email) VALUES
(1, 'Tom', 'Hill', 'tom@univ.edu'),
(2, 'Sue', 'Wong', 'sue@univ.edu'),
(3, 'Ray', 'Lopez', 'ray@univ.edu'),
(4, 'Lisa', 'Kim', 'lisa@univ.edu'),
(5, 'Mark', 'Patel', 'mark@univ.edu'),
(6, 'Anna', 'Gomez', 'anna@univ.edu'),
(7, 'Paul', 'Nguyen', 'paul@univ.edu'),
(8, 'Jill', 'Cruz', 'jill@univ.edu'),
(9, 'Gary', 'Rao', 'gary@univ.edu'),
(10, 'Emma', 'Silva', 'emma@univ.edu'),
(11, 'Neil', 'Choi', 'neil@univ.edu'),
(12, 'Vera', 'Mendez', 'vera@univ.edu'),
(13, 'Omar', 'Santos', 'omar@univ.edu'),
(14, 'Zoe', 'Reyes', 'zoe@univ.edu'),
(15, 'Ian', 'Kumar', 'ian@univ.edu'),
(16, 'Ella', 'Torres', 'ella@univ.edu'),
(17, 'Kyle', 'Pham', 'kyle@univ.edu'),
(18, 'Nina', 'Diaz', 'nina@univ.edu'),
(19, 'Rex', 'Singh', 'rex@univ.edu'),
(20, 'Lia', 'Moreno', 'lia@univ.edu');

INSERT INTO Venue (Venue_ID, Building, RoomNo) VALUES
('V001', 'Science Hall', 101), ('V002', 'Eng Bldg', 202),
('V003', 'Math Tower', 303), ('V004', 'Phys Lab', 104),
('V005', 'Chem Bldg', 205), ('V006', 'Bio Hall', 106),
('V007', 'Eco Center', 307), ('V008', 'Psych Lab', 108),
('V009', 'Comp Sci', 209), ('V010', 'Lecture Hall', 110),
('V011', 'Science Hall', 111), ('V012', 'Eng Bldg', 212),
('V013', 'Math Tower', 313), ('V014', 'Phys Lab', 114),
('V015', 'Chem Bldg', 215), ('V016', 'Bio Hall', 116),
('V017', 'Eco Center', 317), ('V018', 'Psych Lab', 118),
('V019', 'Comp Sci', 219), ('V020', 'Lecture Hall', 120);

INSERT INTO Course (Course_ID, Name, Prog_ID, Course_Type, Credits) VALUES
('C001', 'Intro to Programming', 'P001', 'Core', 3),
('C002', 'Calculus I', 'P002', 'Core', 3),
('C003', 'Mechanics', 'P003', 'Core', 3),
('C004', 'Organic Chemistry', 'P004', 'Core', 3),
('C005', 'Cell Biology', 'P005', 'Core', 3),
('C006', 'Eng Mechanics', 'P006', 'Core', 3),
('C007', 'Microeconomics', 'P007', 'Core', 3),
('C008', 'Psych Foundations', 'P008', 'Core', 3),
('C009', 'Adv Programming', 'P009', 'Core', 3),
('C010', 'Data Analysis', 'P010', 'Core', 3),
('C011', 'AI Techniques', 'P011', 'Core', 3),
('C012', 'Quantum Physics', 'P012', 'Core', 3),
('C013', 'Adv Chemistry', 'P013', 'Core', 3),
('C014', 'Genomics', 'P014', 'Core', 3),
('C015', 'Systems Eng', 'P015', 'Core', 3),
('C016', 'Macroeconomics', 'P016', 'Core', 3),
('C017', 'PhD Seminar CS', 'P017', 'Core', 3),
('C018', 'Math Research', 'P018', 'Core', 3),
('C019', 'Phys Research', 'P019', 'Core', 3),
('C020', 'Chem Research', 'P020', 'Core', 3),
('C021', 'Bio Research', 'P021', 'Core', 3),
('C022', 'Eng Research', 'P022', 'Core', 3),
('C023', 'Econ Research', 'P023', 'Core', 3),
('C024', 'Psych Research', 'P024', 'Core', 3),
('C025', 'Biochem Advanced', 'P009', 'Elective', 4);

INSERT INTO Pre_requisites (Course_ID, Required_ID) VALUES
('C009', 'C001'), ('C010', 'C002'), ('C011', 'C001'),
('C012', 'C003'), ('C013', 'C004'), ('C014', 'C005'),
('C015', 'C006'), ('C016', 'C007'), ('C017', 'C009'),
('C018', 'C002'), ('C019', 'C003'), ('C020', 'C004');

INSERT INTO Course_Offer (CourseOffer, Course_ID, Semester) VALUES
('CO001', 'C001', 'Fall 2018'), ('CO002', 'C001', 'Fall 2019'),
('CO003', 'C002', 'Spring 2019'), ('CO004', 'C002', 'Spring 2020'),
('CO005', 'C003', 'Fall 2020'), ('CO006', 'C004', 'Spring 2021'),
('CO007', 'C005', 'Summer 2021'), ('CO008', 'C006', 'Fall 2021'),
('CO009', 'C007', 'Spring 2022'), ('CO010', 'C008', 'Summer 2022'),
('CO011', 'C009', 'Fall 2022'), ('CO012', 'C010', 'Spring 2023'),
('CO013', 'C011', 'Summer 2023'), ('CO014', 'C012', 'Fall 2023'),
('CO015', 'C013', 'Spring 2024'), ('CO016', 'C014', 'Summer 2024'),
('CO017', 'C015', 'Fall 2018'), ('CO018', 'C016', 'Spring 2019'),
('CO019', 'C017', 'Summer 2019'), ('CO020', 'C018', 'Fall 2019'),
('CO021', 'C019', 'Spring 2020'), ('CO022', 'C020', 'Summer 2020'),
('CO023', 'C021', 'Fall 2020'), ('CO024', 'C022', 'Spring 2021'),
('CO025', 'C023', 'Summer 2021'), ('CO026', 'C025', 'Spring 2021');

INSERT INTO Student (Student_ID, Gender, Date_of_Birth, First_Name, Last_Name, Address, Semester, Lab_Group, Sect, Tutorial_Group) VALUES
(1, 'Male', '2000-01-01', 'John', 'Doe', '123 Main St', 'Fall 2020', 1, 'A', 1),
(2, 'Female', '2001-02-02', 'Jane', 'Smith', '456 Elm St', 'Spring 2021', 2, 'B', 2),
(3, 'Male', '1999-03-03', 'Mike', 'Lee', '789 Oak St', 'Summer 2021', 3, 'A', 3),
(4, 'Female', '2000-04-04', 'Sara', 'Kim', '101 Pine St', 'Fall 2021', 4, 'B', 4),
(5, 'Male', '2001-05-05', 'Tom', 'Chen', '202 Cedar St', 'Spring 2022', 5, 'A', 5),
(6, 'Female', '1998-06-06', 'Lily', 'Wong', '303 Birch St', 'Summer 2022', 1, 'B', 1),
(7, 'Male', '2000-07-07', 'Alex', 'Ng', '404 Maple St', 'Fall 2022', 2, 'A', 2),
(8, 'Female', '1999-08-08', 'Emma', 'Patel', '505 Spruce St', 'Spring 2023', 3, 'B', 3),
(9, 'Male', '2001-09-09', 'Ryan', 'Gupta', '606 Ash St', 'Summer 2023', 4, 'A', 4),
(10, 'Female', '2000-10-10', 'Zoe', 'Lopez', '707 Willow St', 'Fall 2023', 5, 'B', 5),
(11, 'Male', '1998-11-11', 'Evan', 'Rao', '808 Chestnut St', 'Spring 2024', 1, 'A', 1),
(12, 'Female', '1999-12-12', 'Mia', 'Silva', '909 Poplar St', 'Summer 2024', 2, 'B', 2),
(13, 'Male', '2000-01-13', 'Omar', 'Khan', '111 Elm St', 'Fall 2018', 3, 'A', 3),
(14, 'Female', '2001-02-14', 'Nia', 'Cruz', '222 Oak St', 'Spring 2019', 4, 'B', 4),
(15, 'Male', '1999-03-15', 'Leo', 'Mendez', '333 Pine St', 'Summer 2019', 5, 'A', 5),
(16, 'Female', '2000-04-16', 'Ava', 'Santos', '444 Cedar St', 'Fall 2019', 1, 'B', 1),
(17, 'Male', '2001-05-17', 'Ian', 'Reyes', '555 Birch St', 'Spring 2020', 2, 'A', 2),
(18, 'Female', '1998-06-18', 'Ella', 'Kumar', '666 Maple St', 'Summer 2020', 3, 'B', 3),
(19, 'Male', '2000-07-19', 'Kyle', 'Torres', '777 Spruce St', 'Fall 2020', 4, 'A', 4),
(20, 'Female', '1999-08-20', 'Nina', 'Pham', '888 Ash St', 'Spring 2021', 5, 'B', 5),
(21, 'Male', '2001-09-21', 'Rex', 'Diaz', '999 Willow St', 'Summer 2021', 1, 'A', 1),
(22, 'Female', '2000-10-22', 'Lia', 'Singh', '121 Chestnut St', 'Fall 2021', 2, 'B', 2),
(23, 'Male', '1998-11-23', 'Jay', 'Moreno', '232 Poplar St', 'Spring 2022', 3, 'A', 3),
(24, 'Female', '1999-12-24', 'Kay', 'Choi', '343 Elm St', 'Summer 2022', 4, 'B', 4),
(25, 'Male', '2000-01-25', 'Sam', 'Park', '454 Oak St', 'Fall 2022', 5, 'A', 5);

INSERT INTO Registration (Student_ID, CourseOffer, Grade, Feedback) VALUES
(1, 'CO001', 85, 'Good'), (1, 'CO005', 90, 'Excellent'),
(2, 'CO002', 75, 'Satisfactory'), (2, 'CO006', 80, 'Good'),
(3, 'CO003', 88, 'Very Good'), (4, 'CO004', 82, 'Good'),
(5, 'CO007', 95, 'Outstanding'), (6, 'CO008', 78, 'Fair'),
(7, 'CO009', 83, 'Good'), (8, 'CO010', 87, 'Very Good'),
(9, 'CO011', 91, 'Excellent'), (10, 'CO012', 79, 'Satisfactory'),
(11, 'CO013', 84, 'Good'), (12, 'CO014', 86, 'Very Good'),
(13, 'CO015', 89, 'Excellent'), (14, 'CO016', 77, 'Fair'),
(15, 'CO017', 92, 'Outstanding'), (16, 'CO018', 81, 'Good'),
(17, 'CO019', 85, 'Good'), (18, 'CO020', 88, 'Very Good'),
(19, 'CO021', 90, 'Excellent'), (20, 'CO022', 76, 'Satisfactory'),
(21, 'CO023', 93, 'Outstanding'), (22, 'CO024', 82, 'Good'),
(23, 'CO025', 87, 'Very Good'), (3, 'CO026', 90, 'Excellent');

INSERT INTO Affiliate (Affiliate_ID, ProgID, Enrol_Year) VALUES
(1, 'P001', 2018), (2, 'P002', 2019), (3, 'P003', 2020),
(4, 'P004', 2021), (5, 'P005', 2022), (6, 'P006', 2018),
(7, 'P007', 2019), (8, 'P008', 2020), (9, 'P009', 2021),
(10, 'P010', 2022), (11, 'P011', 2018), (12, 'P012', 2019),
(13, 'P013', 2020), (14, 'P014', 2021), (15, 'P015', 2022),
(16, 'P016', 2018), (17, 'P017', 2019), (18, 'P018', 2020),
(19, 'P019', 2021), (20, 'P020', 2022);

INSERT INTO Donation_History (Alumnus_ID, DonationDate, Amount) VALUES
(1, '2020-01-01', 1000), (2, '2021-02-02', 500),
(3, '2022-03-03', 2000), (4, '2023-04-04', 1500),
(5, '2020-05-05', 800), (6, '2021-06-06', 1200),
(7, '2022-07-07', 3000), (8, '2023-08-08', 600),
(9, '2020-09-09', 2500), (10, '2021-10-10', 700),
(11, '2022-11-11', 1800), (12, '2023-12-12', 900),
(13, '2020-01-13', 1100), (14, '2021-02-14', 1400),
(15, '2022-03-15', 1600), (16, '2023-04-16', 1300),
(17, '2020-05-17', 2000), (18, '2021-06-18', 950),
(19, '2022-07-19', 1700), (20, '2023-08-20', 850);

INSERT INTO Attained_Scholarships (Scholarship_ID, StudentID, Amount, ScholDate) VALUES
(1, 1, 5000, '2020-09-01'), (2, 2, 3000, '2021-09-02'),
(3, 3, 6000, '2021-09-03'), (4, 4, 4000, '2022-09-04'),
(5, 5, 7000, '2022-09-05'), (6, 6, 3500, '2023-09-06'),
(7, 7, 4500, '2023-09-07'), (8, 8, 5500, '2020-09-08'),
(9, 9, 6500, '2020-09-09'), (10, 10, 3200, '2021-09-10'),
(11, 11, 4800, '2021-09-11'), (12, 12, 5200, '2022-09-12'),
(13, 13, 6800, '2022-09-13'), (14, 14, 3900, '2023-09-14'),
(15, 15, 4600, '2023-09-15'), (16, 16, 5100, '2020-09-16'),
(17, 17, 5700, '2020-09-17'), (18, 18, 6300, '2021-09-18'),
(19, 19, 3400, '2021-09-19'), (20, 20, 5900, '2022-09-20');

INSERT INTO Visitor (Visitee_ID, VisitorName, Purpose, VisitDate, Entry_Time, Exit_Time) VALUES
(1, 'Alice Smith', 'Meeting', '2023-01-01', '10:00:00', '11:00:00'),
(2, 'Bob Jones', 'Tour', '2023-01-02', '14:00:00', '15:00:00'),
(3, 'Clara Lee', 'Interview', '2023-01-03', '09:00:00', '10:00:00'),
(4, 'David Kim', 'Seminar', '2023-01-04', '13:00:00', '14:30:00'),
(5, 'Eve Chen', 'Consultation', '2023-01-05', '11:00:00', '12:00:00'),
(6, 'Frank Wong', 'Visit', '2023-01-06', '15:00:00', '16:00:00'),
(7, 'Grace Ng', 'Meeting', '2023-01-07', '10:30:00', '11:30:00'),
(8, 'Hank Patel', 'Tour', '2023-01-08', '14:30:00', '15:30:00'),
(9, 'Ivy Gupta', 'Interview', '2023-01-09', '09:30:00', '10:30:00'),
(10, 'Jack Lopez', 'Seminar', '2023-01-10', '13:30:00', '15:00:00'),
(11, 'Kate Rao', 'Consultation', '2023-01-11', '11:30:00', '12:30:00'),
(12, 'Leo Silva', 'Visit', '2023-01-12', '15:30:00', '16:30:00'),
(13, 'Mia Khan', 'Meeting', '2023-01-13', '10:00:00', '11:00:00'),
(14, 'Nora Cruz', 'Tour', '2023-01-14', '14:00:00', '15:00:00'),
(15, 'Oliver Mendez', 'Interview', '2023-01-15', '09:00:00', '10:00:00'),
(16, 'Pam Santos', 'Seminar', '2023-01-16', '13:00:00', '14:30:00'),
(17, 'Quinn Reyes', 'Consultation', '2023-01-17', '11:00:00', '12:00:00'),
(18, 'Rose Kumar', 'Visit', '2023-01-18', '15:00:00', '16:00:00'),
(19, 'Sam Torres', 'Meeting', '2023-01-19', '10:30:00', '11:30:00'),
(20, 'Tina Pham', 'Tour', '2023-01-20', '14:30:00', '15:30:00');

INSERT INTO Supervision (Project_ID, Professor_ID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO Assistance (Student_ID, Project_ID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(11, 11), (12, 12), (13, 13), (14, 14), (15, 15),
(16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

INSERT INTO Teaching (Professor_ID, CourseOffer) VALUES
(1, 'CO001'), (2, 'CO002'), (3, 'CO003'), (4, 'CO004'),
(5, 'CO005'), (6, 'CO006'), (7, 'CO007'), (8, 'CO008'),
(9, 'CO009'), (10, 'CO010'), (11, 'CO011'), (12, 'CO012'),
(13, 'CO013'), (14, 'CO014'), (15, 'CO015'), (16, 'CO016'),
(17, 'CO017'), (18, 'CO018'), (19, 'CO019'), (20, 'CO020'),
(1, 'CO021'), (2, 'CO022'), (3, 'CO023'), (4, 'CO024'),
(5, 'CO025'), (6, 'CO026');

INSERT INTO Student_Bodies (Name, Mentor_ID) VALUES
('Student Council', 1), ('Debate Society', 2),
('Science Club', 3), ('Eng Society', 4),
('Math Circle', 5), ('Phys Group', 6),
('Chem Society', 7), ('Bio Club', 8),
('Eco Forum', 9), ('Psych Assoc', 10),
('CS Club', 11), ('Robotics Team', 12),
('Music Society', 13), ('Art Guild', 14),
('Drama Group', 15), ('Sports Assoc', 16),
('Photo Club', 17), ('Lit Society', 18),
('Game Club', 19), ('Volunteer Group', 20);

INSERT INTO Member (Student_ID, Name, Position) VALUES
(1, 'Student Council', 'President'), (2, 'Debate Society', 'Member'),
(3, 'Science Club', 'Treasurer'), (4, 'Eng Society', 'Secretary'),
(5, 'Math Circle', 'Member'), (6, 'Phys Group', 'President'),
(7, 'Chem Society', 'Member'), (8, 'Bio Club', 'Treasurer'),
(9, 'Eco Forum', 'Secretary'), (10, 'Psych Assoc', 'Member'),
(11, 'CS Club', 'President'), (12, 'Robotics Team', 'Member'),
(13, 'Music Society', 'Treasurer'), (14, 'Art Guild', 'Secretary'),
(15, 'Drama Group', 'Member'), (16, 'Sports Assoc', 'President'),
(17, 'Photo Club', 'Member'), (18, 'Lit Society', 'Treasurer'),
(19, 'Game Club', 'Secretary'), (20, 'Volunteer Group', 'Member');

INSERT INTO Maintenance (Staff_ID, Venue_ID) VALUES
(1, 'V001'), (2, 'V002'), (3, 'V003'), (4, 'V004'),
(5, 'V005'), (6, 'V006'), (7, 'V007'), (8, 'V008'),
(9, 'V009'), (10, 'V010'), (11, 'V011'), (12, 'V012'),
(13, 'V013'), (14, 'V014'), (15, 'V015'), (16, 'V016'),
(17, 'V017'), (18, 'V018'), (19, 'V019'), (20, 'V020');

INSERT INTO Sessions (Session_ID, Title, Description, Venue_ID, SessionDate, Start_Time, End_Time, Conducted_by, CourseOffer, MarkAttendance) VALUES
('S001', 'CS Intro', 'Intro lecture', 'V001', '2023-09-01', '09:00:00', '10:00:00', NULL, 'CO001', TRUE),
('S002', 'Math Seminar', 'Calculus basics', 'V002', '2023-09-02', '10:00:00', '11:00:00', 'Math Circle', NULL, FALSE),
('S003', 'Phys Lab', 'Mechanics lab', 'V003', '2023-09-03', '11:00:00', '12:00:00', NULL, 'CO005', TRUE),
('S004', 'Chem Workshop', 'Organic chem', 'V004', '2023-09-04', '13:00:00', '14:00:00', 'Chem Society', NULL, FALSE),
('S005', 'Bio Lecture', 'Cell bio', 'V005', '2023-09-05', '14:00:00', '15:00:00', NULL, 'CO007', TRUE),
('S006', 'Eng Demo', 'Mechanics demo', 'V006', '2023-09-06', '15:00:00', '16:00:00', 'Eng Society', NULL, FALSE),
('S007', 'Eco Talk', 'Microeconomics', 'V007', '2023-09-07', '09:00:00', '10:00:00', NULL, 'CO009', TRUE),
('S008', 'Psych Session', 'Foundations', 'V008', '2023-09-08', '10:00:00', '11:00:00', 'Psych Assoc', NULL, FALSE),
('S009', 'CS Adv', 'Advanced coding', 'V009', '2023-09-09', '11:00:00', '12:00:00', NULL, 'CO011', TRUE),
('S010', 'Data Seminar', 'Data analysis', 'V010', '2023-09-10', '13:00:00', '14:00:00', 'CS Club', NULL, FALSE),
('S011', 'AI Workshop', 'AI techniques', 'V011', '2023-09-11', '14:00:00', '15:00:00', NULL, 'CO013', TRUE),
('S012', 'Phys Research', 'Quantum phys', 'V012', '2023-09-12', '15:00:00', '16:00:00', 'Phys Group', NULL, FALSE),
('S013', 'Chem Lab', 'Advanced chem', 'V013', '2023-09-13', '09:00:00', '10:00:00', NULL, 'CO015', TRUE),
('S014', 'Bio Seminar', 'Genomics', 'V014', '2023-09-14', '10:00:00', '11:00:00', 'Bio Club', NULL, FALSE),
('S015', 'Eng Lecture', 'Systems eng', 'V015', '2023-09-15', '11:00:00', '12:00:00', NULL, 'CO017', TRUE),
('S016', 'Eco Forum', 'Macro trends', 'V016', '2023-09-16', '13:00:00', '14:00:00', 'Eco Forum', NULL, FALSE),
('S017', 'CS PhD', 'Research seminar', 'V017', '2023-09-17', '14:00:00', '15:00:00', NULL, 'CO019', TRUE),
('S018', 'Math Research', 'Math theory', 'V018', '2023-09-18', '15:00:00', '16:00:00', 'Math Circle', NULL, FALSE),
('S019', 'Phys Seminar', 'Phys research', 'V019', '2023-09-19', '09:00:00', '10:00:00', NULL, 'CO021', TRUE),
('S020', 'Chem Research', 'Chem synthesis', 'V020', '2023-09-20', '10:00:00', '11:00:00', 'Chem Society', NULL, FALSE),
('S021', 'Chem Lab Group 3', 'Advanced Chemistry', 'V019', '2023-09-20', '10:00:00', '11:00:00', NULL, 'CO010', FALSE);

INSERT INTO Attendance (Affiliate_ID, Session_ID) VALUES
(1, 'S001'), (2, 'S002'), (3, 'S003'), (4, 'S004'),
(5, 'S005'), (6, 'S006'), (7, 'S007'), (8, 'S008'),
(9, 'S009'), (10, 'S010'), (11, 'S011'), (12, 'S012'),
(13, 'S013'), (14, 'S014'), (15, 'S015'), (16, 'S016'),
(17, 'S017'), (18, 'S018'), (19, 'S019'), (20, 'S020');