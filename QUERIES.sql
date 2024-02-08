-- HW1
-- Student names: Ísak Máni Þrastarson, Viktor Wardum, Þórður Jónatansson

-- A --
SELECT MAX(price) 
FROM Equipment;
-- Explanation: Most expensive equipment cost: 250000. Simply used the max func on the Equipment table

-- B --
SELECT start_date
FROM Member
WHERE EXTRACT(MONTH FROM start_date) = 1;
-- Explanation: Used the EXTRACT fucntion so it knows what month to extract, at first i tried to us beetween then MONTH wich i learned is not for PostgreSQL

-- C --
SELECT * FROM type WHERE LOWER(name) like '%fit%';

select * from class where tid='8' or tid = '14' or tid = '15' OR tid = '12';
-- Explanation: 
--There had to be used 2 querys where one we find out about which type is the 'fit' type, and then we run another query in the class table to see how many those types of classes where dated.



-- D --
SELECT COUNT(DISTINCT Class.IID)
FROM Class
JOIN Attends ON Class.ID = Attends.CID
JOIN Member ON Attends.MID = Member.ID
WHERE Class.IID = Member.IID;
-- Explanation: I joined the Class, Attends and Members tables because i need the instructors, attendees, and if the instructors have taught the attendees in personal training. Comparing instructors leading classes in (Class) and instructors in Member

-- E --
SELECT Type.name, ROUND(AVG(Attends.rating)) AS "Average Rating"
FROM Type
JOIN Class ON Type.ID = Class.TID
LEFT JOIN Attends ON Class.ID = Attends.CID
GROUP BY Type.name
ORDER BY "Average Rating" DESC;
-- Explanation:  I used the JOIN Class on Type.id and Class.TID. And then LEFT JOIN Attends ON Class.ID = Attends.CID. I was not sure if I should have used the AS for type of class.  But if it is a requirement, i would change the code to this: SELECT Type.name AS „Class Type“
-- F --
SELECT COUNT(DISTINCT Member.ID)
FROM Member
LEFT JOIN Attends ON Member.ID = Attends.MID
WHERE Attends.MID IS NULL
AND IID IS NULL;
-- Explanation: Used left join to make a set containing the Member Table and Attends Table, then i use IS NULL func to check what is not in the setg

-- G --
SELECT instructor.id, COUNT(*) as id_count
FROM instructor
JOIN class ON class.iid = instructor.id
GROUP BY instructor.id
HAVING COUNT(*) > 14;
-- Explanation: joined instructor and class together, where there we can find out
-- how many times the specific IID(instructor id) has appeard.
-- H --
select sum(count)
from (
    
select start_date, quit_date, count(*) as count from member
where quit_date is NOT null
group by start_date, quit_date
having count(*)>1

);
-- Explanation: we need to count each member that has the same start/quit date more than 1 times 
-- and quit date can't be null. and we count those members from the member table.
--Then we just sum up the amount of members and we don´t need to name it.(auto named sum numeric)
-- I -- 
SELECT COUNT(DISTINCT Class.ID)
FROM Class
JOIN Gym ON Class.GID = Gym.ID
JOIN Type ON Class.TID = Type.ID
LEFT JOIN Attends ON Class.ID = Attends.CID
WHERE Gym.address Like '%Reykjavik%'
AND Type.capacity in (30, 40)
AND (SELECT COUNT(*) FROM Attends WHERE Attends.CID = Class.ID) < Type.capacity;
-- Explanation: Counted DISTINCT classes by joining 4 Tables Gym, Class, Type and Attends. I USed Class and Gym for the location, Class and type for the 30 or 40 people and Attend to Find out if the max capacity is met or not and put all that in a count so i get 1 row with the result
-- J --
SELECT Member.ID, Member.name, MAX(Class.minutes) AS total_time
FROM Class
INNER JOIN Member ON Class.ID = Member.ID
WHERE Class.minutes = 90
GROUP BY Member.ID, Member.name
ORDER BY total_time DESC;
-- Explanation: Selected information from the members and class tables with inner join. I left 2 similar versions of the code because I’m not sure which one answers the question better.
