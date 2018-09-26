--1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='RUSSIA');
--2
SELECT name
FROM world
where continent = 'Europe' AND gdp / population > (SELECT gdp / population FROM world WHERE name = 'United Kingdom')
--3
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia')
ORDER by name;
--4
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');
--5
SELECT name, CONCAT(ROUND((population / (Select population from world where name = 'Germany')) * 100, 0), '%') as population
FROM world
WHERE continent = 'Europe'
--6
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);
--7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
--8
SELECT continent, name
FROM world w
WHERE name <= ALL(SELECT name FROM world w2 WHERE w.continent = w2.continent)
--9

--10
	  