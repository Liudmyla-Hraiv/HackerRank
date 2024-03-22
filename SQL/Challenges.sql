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
