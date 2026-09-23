USE gymsystem;

CREATE TABLE Member (
    Member_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Second_Name VARCHAR(50),
    Gender VARCHAR(10),
    Phone_Number VARCHAR(20),
    Address VARCHAR(255),
    Join_Date DATE
);

CREATE TABLE Trainer (
    Trainer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Second_Name VARCHAR(50),
    Gender VARCHAR(10),
    Address VARCHAR(255),
    Speciality VARCHAR(100),
    Salary DECIMAL(10,2),
    Join_Date DATE,
    Birth_Date DATE,
    Birth_Time TIME
);

CREATE TABLE Class (
    Class_ID INT PRIMARY KEY,
    Class_Name VARCHAR(100),
    Schedule VARCHAR(100),
    Trainer_ID INT,
    FOREIGN KEY (Trainer_ID) REFERENCES Trainer(Trainer_ID)
);

CREATE TABLE Membership (
    Membership_ID INT PRIMARY KEY,
    Type VARCHAR(20),
    Monthly DECIMAL(10,2),
    Quarterly DECIMAL(10,2),
    Yearly DECIMAL(10,2),
    Start_Date DATE,
    End_Date DATE,
    Status VARCHAR(20)
);

CREATE TABLE Membership_Fees (
    Fee_ID INT PRIMARY KEY,
    Membership_ID INT,
    Amount DECIMAL(10,2),
    Reason VARCHAR(100),
    Start_Date DATE,
    End_Date DATE,
    FOREIGN KEY (Membership_ID) REFERENCES Membership(Membership_ID)
);

CREATE TABLE Bill (
    Bill_ID INT PRIMARY KEY,
    Bill_Date DATE,
    Status VARCHAR(20),
    Total_Amount DECIMAL(10,2)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Bill_ID INT,
    Payment_Method VARCHAR(50),
    Amount DECIMAL(10,2),
    Payment_Status VARCHAR(20),
    Payment_Date DATE,
    Mode VARCHAR(50),
    FOREIGN KEY (Bill_ID) REFERENCES Bill(Bill_ID)
);

CREATE TABLE Subscribe (
    Subscribe_ID INT PRIMARY KEY,
    Member_ID INT,
    Membership_ID INT,
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Membership_ID) REFERENCES Membership(Membership_ID)
);

CREATE TABLE Enroll (
    Member_ID INT,
    Class_ID INT,
    PRIMARY KEY (Member_ID, Class_ID),
    FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
    FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID)
);