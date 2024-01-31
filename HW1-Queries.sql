-- A
SELECT MAX(price) 
FROM Equipment;
-- B
SELECT start_date
FROM Member
WHERE EXTRACT(MONTH FROM start_date) = 1;
-- C
SELECT * FROM type WHERE name like '%fit%' OR name like 'fit%' OR name like '%Fit' or name like '%fiT%';
select * from class where tid='8' or tid = '14' or tid = '15';
-- D
-- E
-- F
-- G
-- H
-- I
-- J
