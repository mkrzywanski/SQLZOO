--1

SELECT matchid, player
FROM goal
where teamid = 'GER';
--2
SELECT id,stadium,team1,team2
  FROM game
where id = 1012
--3
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM game JOIN goal ON (id=matchid)
where goal.teamid = 'GER';
--4
SELECT game.team1, game.team2, goal.player
  FROM game JOIN goal ON (id=matchid)
where goal.player LIKE 'Mario%';
--5
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
  FROM goal join eteam on goal.teamid = eteam.id
 WHERE gtime<=10
--6
SELECT game.mdate, eteam.teamname
FROM game JOIN eteam on game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';
--7
SELECT goal.player
FROM game JOIN goal on game.id = goal.matchid
WHERE game.stadium = 'National Stadium, Warsaw';
--8
SELECT DISTINCT player
  FROM game JOIN goal ON goal.matchid = game.id 
    WHERE (game.team1='GER' OR game.team2 = 'GER') AND goal.teamid <> 'GER';
--9
SELECT eteam.teamname, COUNT(*)
FROM goal JOIN eteam on goal.teamid = eteam.id
GROUP BY eteam.teamname
--10
SELECT game.stadium, COUNT(goal.matchid)
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium
--11
SELECT matchid,mdate, COUNT(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;
--12
SELECT goal.matchid, game.mdate, COUNT(*)
FROM game JOIN goal on game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid, game.mdate;
--13

