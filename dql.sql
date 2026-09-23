-- 1. Display all members
SELECT *
FROM Member;


-- 2. Display all trainers
SELECT *
FROM Trainer;


-- 3. Trainer names and specialities
SELECT
    First_Name,
    Second_Name,
    Speciality
FROM Trainer;


-- 4. Classes with assigned trainers
SELECT
    Class.Class_Name,
    Class.Schedule,
    Trainer.First_Name,
    Trainer.Second_Name,
    Trainer.Speciality
FROM Class
JOIN Trainer
    ON Class.Trainer_ID = Trainer.Trainer_ID;


-- 5. Members and their subscriptions
SELECT
    Subscribe.Subscribe_ID,
    Member.First_Name,
    Member.Second_Name,
    Membership.Type,
    Membership.Status
FROM Subscribe
JOIN Member
    ON Subscribe.Member_ID = Member.Member_ID
JOIN Membership
    ON Subscribe.Membership_ID = Membership.Membership_ID;


-- 6. Paid bills
SELECT
    Bill_ID,
    Bill_Date,
    Total_Amount
FROM Bill
WHERE Status = 'Paid';


-- 7. Unpaid bills
SELECT
    Bill_ID,
    Bill_Date,
    Total_Amount
FROM Bill
WHERE Status = 'Unpaid';


-- 8. Members enrolled in classes
SELECT
    Member.First_Name,
    Member.Second_Name,
    Class.Class_Name,
    Class.Schedule
FROM Enroll
JOIN Member
    ON Enroll.Member_ID = Member.Member_ID
JOIN Class
    ON Enroll.Class_ID = Class.Class_ID;


-- 9. Number of subscriptions by membership type
SELECT
    Membership.Type,
    COUNT(*) AS Total_Subscriptions
FROM Subscribe
JOIN Membership
    ON Subscribe.Membership_ID = Membership.Membership_ID
GROUP BY Membership.Type;


-- 10. Total completed payment revenue
SELECT
    SUM(Amount) AS Total_Revenue
FROM Payment
WHERE Payment_Status = 'Completed';


-- 11. Payment summary by method
SELECT
    Payment_Method,
    COUNT(*) AS Number_Of_Payments,
    SUM(Amount) AS Total_Amount
FROM Payment
WHERE Payment_Status = 'Completed'
GROUP BY Payment_Method;


-- 12. Full bill and payment details
SELECT
    Bill.Bill_ID,
    Bill.Bill_Date,
    Bill.Status AS Bill_Status,
    Bill.Total_Amount,
    Payment.Payment_Method,
    Payment.Payment_Status,
    Payment.Payment_Date
FROM Bill
LEFT JOIN Payment
    ON Bill.Bill_ID = Payment.Bill_ID
ORDER BY Bill.Bill_ID;