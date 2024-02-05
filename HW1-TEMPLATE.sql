-- HW1
-- Student names:

-- A. How much does the most expensive equipment cost? Return only the price.
250000
-- Explanation: Simply used the max func on the Equipment table

-- B. 792 members have started the gym in April (of any year). How many members have started the gym in January (of any year)? 899

-- Explanation: Used the EXTRACT fucntion so it knows what month to extract, at first i tried to us beetween then MONTH wich i learned is not for PostgreSQL


-- C. 154 classes were held with ‘burn’ somewhere in their type name. How many classes were held that 
-- have ‘fit’ somewhere in their type name? (Note that your query should be case-insensitive, 
-- i.e. classes with ‘fiT’ and ‘Fit’ in their type name should also be counted).
-- Explanation: 
--There had to be used 2 querys where one we find out about which type is the 'fit' type, and then we run another query in the class table to see how many those types of classes where dated.


-- D. How many different instructors have led at least one class in which a member that they have in personal training attended?
-- ANSWER = 52

-- Explanation: I joined the Class, Attends and Members tables because i need the instructors, attendees, and if the instructors have taught the attendees in personal training. Comparing instructors leading classes in (Class) and instructors in Member



-- E. Return the name of every class type along with the average rating that all classes of the type have received. 
-- The result should be rounded to the nearest integer and ordered from highest to lowest. 
-- Name the column with the average rating “Average Rating”.
-- Explanation:  I used the JOIN Class on Type.id and Class.TID. And then LEFT JOIN Attends ON Class.ID = Attends.CID. I was not sure if I should have used the AS for type of class.  But if it is a requirement, i would change the code to this: SELECT Type.name AS „Class Type“




-- F. How many members have not attended any classes and do not have a personal instructor? 6086
-- Explanation: Used left join to make a set containing the Member Table and Attends Table, then i use IS NULL func to check what is not in the setg


-- G. 43 instructors have led 15 or more classes. How many instructors have led 10 or more classes?
-- Explanation: joined instructor and class together, where there we can find out
-- how many times the specific IID(instructor id) has appeard.



-- H. For how many members is it true that there exists at least one other member with the same start date and quit date as them? 
-- (Note that if that is true for John and Mary, they should be counted as two results.
-- Note also that two people that have not quit cannot be considered as having the same quit date.).
-- Explanation: we need to count each member that has the same start/quit date more than 1 times 
-- and quit date can't be null. and we count those members from the member table.
--Then we just sum up the amount of members and we don´t need to name it.(auto named sum numeric)



--I. How many classes were held in gyms in Reykjavik and have a capacity of either 30 or 40 people, but the capacity was not used fully? 216
-- Explanation: Counted DISTINCT classes by joining 4 Tables Gym, Class, Type and Attends. I USed Class and Gym for the location, Class and type for the 30 or 40 people and Attend to Find out if the max capacity is met or not and put all that in a count so i get 1 row with the result



-- J. Return the ID and name of the member(s) that attended classes for the longest total time (in minutes) of all members?
-- Explanation: Selected information from the members and class tables with inner join. I left 2 similar versions of the code because I’m not sure which one answers the question better.

