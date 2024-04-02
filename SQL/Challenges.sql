/* Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student.
Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
Hackers: The "hacker_id" is the id of the hacker, and "name" is the name of the hacker.
Challenges: The "challenge_id" is the id of the challenge, and "hacker_id" is the id of the student who created the challenge.*/

/* MySQL */
WITH t1 AS (
    SELECT H.hacker_id, H.Name, COUNT(C.challenge_id) AS created
    FROM Hackers AS H
    JOIN Challenges AS C 
    USING (hacker_id)
    GROUP BY H.hacker_id, H.Name
    ORDER BY created DESC, H.hacker_id), 
t2 AS (
    SELECT created
    FROM t1
    GROUP BY created
    HAVING COUNT(hacker_id) = 1
    OR created = (SELECT MAX(created) FROM t1)
)
SELECT *
FROM t1
WHERE created 
IN (SELECT * FROM t2);
