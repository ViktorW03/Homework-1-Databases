-- A --
SELECT MAX(price) 
FROM Equipment;

-- B --
SELECT start_date
FROM Member
WHERE EXTRACT(MONTH FROM start_date) = 1;

-- C --
SELECT * FROM type WHERE LOWER(name) like '%fit%';

select * from class where tid='8' or tid = '14' or tid = '15' OR tid = '12';

-- D --
SELECT COUNT(DISTINCT Class.IID)
FROM Class
JOIN Attends ON Class.ID = Attends.CID
JOIN Member ON Attends.MID = Member.ID
WHERE Class.IID = Member.IID;

-- E --
SELECT Type.name, ROUND(AVG(Attends.rating)) AS "Average Rating"
FROM Type
JOIN Class ON Type.ID = Class.TID
LEFT JOIN Attends ON Class.ID = Attends.CID
GROUP BY Type.name
ORDER BY "Average Rating" DESC;

-- F --
SELECT COUNT(DISTINCT Member.ID)
FROM Member
LEFT JOIN Attends ON Member.ID = Attends.MID
WHERE Attends.MID IS NULL
AND IID IS NULL;

-- G --
SELECT instructor.id, COUNT(*) as id_count
FROM instructor
JOIN class ON class.iid = instructor.id
GROUP BY instructor.id
HAVING COUNT(*) > 14;

-- H --
select sum(count)
from (

select start_date, quit_date, count(*) as count from member
where quit_date is NOT null
group by start_date, quit_date
having count(*)>1

);
 
-- I -- 
SELECT COUNT(DISTINCT Class.ID)
FROM Class
JOIN Gym ON Class.GID = Gym.ID
JOIN Type ON Class.TID = Type.ID
LEFT JOIN Attends ON Class.ID = Attends.CID
WHERE Gym.address Like '%Reykjavik%'
AND Type.capacity in (30, 40)
AND (SELECT COUNT(*) FROM Attends WHERE Attends.CID = Class.ID) < Type.capacity;

-- J --
-- All members --
SELECT Member.ID, Member.name, MAX(Class.minutes) AS total_time
FROM Class
INNER JOIN Member ON Class.ID = Member.ID
GROUP BY Member.ID, Member.name
ORDER BY total_time DESC;
-- All 90 min members --
SELECT Member.ID, Member.name, MAX(Class.minutes) AS total_time
FROM Class
INNER JOIN Member ON Class.ID = Member.ID
WHERE Class.minutes = 90
GROUP BY Member.ID, Member.name
ORDER BY total_time DESC;
