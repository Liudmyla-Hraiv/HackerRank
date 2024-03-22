SELECT w.id, wp.age, w.coins_needed, w.power
FROM WANDS AS  w
JOIN WANDS_PROPERTY AS wp USING (code)
JOIN (SELECT wp2.age as g, MIN(w2.coins_needed) AS min, w2.power AS p
        FROM WANDS AS  w2
        JOIN WANDS_PROPERTY AS wp2 USING (code)
        WHERE wp2.is_evil = 0
        GROUP BY w2.power, wp2.age) AS B
ON wp.age = g AND w.coins_needed = min AND w.power = p
ORDER BY w.power DESC, wp.age DESC
