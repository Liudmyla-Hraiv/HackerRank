/* Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. ,
If more than one wand has same power, sort the result in order of descending age.
Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, 
and power denotes the quality of the wand (the higher the power, the better the wand is). 
Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. 
If the value of is_evil is 0, it means that the wand is not evil.  */

/*MySQL */
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
