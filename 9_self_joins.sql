--1
SELECT COUNT(stops.id)
FROM stops
--2
SELECT id
FROM stops
WHERE name = 'Craiglockhart'
--3
SELECT stops.id, stops.name
FROM stops join route on  stops.id = route.stop
where route.num = 4 AND route.company = 'LRT'
--4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) =2
--5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149;
--6
