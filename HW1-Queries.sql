-- A --
SELECT MAX(price) 
FROM Equipment;
-- B --
SELECT start_date
FROM Member
WHERE EXTRACT(MONTH FROM start_date) = 1;
-- C --
SELECT * FROM type WHERE name like '%fit%' OR name like 'fit%' OR name like '%Fit' or name like '%fiT%';
select * from class where tid='8' or tid = '14' or tid = '15';
-- D
-- E --
SELECT Type.name, ROUND(AVG(Attends.rating)) AS "Average Rating"
FROM Type
JOIN Class ON Type.ID = Class.TID
LEFT JOIN Attends ON Class.ID = Attends.CID
GROUP BY Type.name
ORDER BY "Average Rating" DESC;
-- F
-- G
-- H
-- I
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
