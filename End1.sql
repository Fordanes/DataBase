--PART 2
--No 6
SELECT m.title, avg(ra.stars) avgR
FROM movie m
JOIN rating ra
ON m.mID = ra.mID
GROUP BY avgR DESC, m.title ASC;

--No 7
SELECT title, MIN(stars)
FROM Movie
INNER JOIN Rating USING(mid)
GROUP BY mid
ORDER BY title;

--No 8
SELECT DISTINCT name
FROM Reviever, Rating
WHERE Reviewer.rID=Rating.rID
AND Rating.ratingDate IS NULL;

--No 9
CREATE MATERIALIZED VIEW movie AS SELECT title
FROM Movie
WHERE mid NOT IN(SELECT mID FROM Rating);

--No 10
CREATE ROLE movierole;
GRANT SELECT, INSERT ON movie TO movierole;

--PART 1

/*No 1
ANSWER C)
Because natural join is args join that creates an implicit join based on the same column
names in the joined tables. If each tuple has schema (A,B,C,D) then answer = C(1,2,4,6)

No 2
ANSWER D)
Because the intersect operator returns any rows that are available in both result sets.
In our case R and S have common (2,5,3) tuple.

No 3
ANSWER A)
Because a clustered index organizes table data, so data is queried quicket and more efficiently.
A clustered index consists of both index and data pages.
No 4
ANSWER D)
Because they dont have clear relations

No 5
ANSWER C)
Because CHECK function allow us to verify some condition. In the other words we can specify that the
value in a certain colmn satisfy a Boolean expression. In our case we are inserting (4,4,9) and variation
C will reject because condition in that sum(b) must be <= than inserting number. So we have inserting number c(9)
and sum(b) is 4 + 3 + 3 = 10, where 10 is not <=9
*/









