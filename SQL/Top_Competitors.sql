SELECT h.hacker_id, h.name
FROM Hackers as h
JOIN Submissions as s USING (hacker_id)
JOIN Challenges as c USING (challenge_id)
JOIN Difficulty as d USING (difficulty_level)
WHERE s.score = d.score
GROUP BY h.hacker_id , h.name
HAVING count(*)>1
ORDER BY count(*) DESC, h.hacker_id ASC
