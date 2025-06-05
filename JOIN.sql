SELECT matchid, player FROM goal
WHERE teamid = 'GER'

SELECT id,stadium,team1,team2 FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate
FROM goal g JOIN game gm ON g.matchid=gm.id
WHERE g.teamid = 'GER'

SELECT team1, team2, player 
FROM game gm JOIN goal g ON gm.id=g.matchid
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal g JOIN eteam t ON g.teamid=t.id
 WHERE gtime<=10

SELECT mdate, teamname 
FROM game gm JOIN eteam t ON gm.team1 = t.id
WHERE coach = 'Fernando Santos'

SELECT player
FROM goal g JOIN game gm ON g.matchid=gm.id
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player 
FROM game gm JOIN goal g ON matchid = id
WHERE gm.id NOT IN (
   SELECT id FROM game
   WHERE team1 != 'GER'
   AND team2 != 'GER'
   )
   AND teamid != 'GER'

SELECT teamname, COUNT(matchid)
FROM eteam t JOIN goal g ON t.id=g.teamid
GROUP BY teamid
ORDER BY teamname

SELECT stadium, COUNT(1) 
FROM game gm JOIN goal g ON gm.id = g.matchid
GROUP BY stadium

SELECT matchid, mdate, COUNT(1)
FROM goal g JOIN game gm ON g.matchid = gm.id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY id

SELECT matchid, mdate, COUNT(1)
FROM goal g JOIN game gm ON g.matchid = gm.id
WHERE teamid = 'GER'
GROUP BY matchid

SELECT mdate
   ,team1
   ,SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1
   ,team2
   ,SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid
