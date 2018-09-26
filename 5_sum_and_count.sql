--1
SELECT SUM(population)
FROM world
--2
SELECT DISTINCT continent
FROM world
--3
SELECT sum(gdp)
FROM world
WHERE continent = 'Africa';
--4
SELECT COUNT(name)
FROM world
where area >= 1000000;
--5
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');
--6
Select continent, COUNT(name)
FROM world
GROUP BY continent;
--7
Select continent, COUNT(name)
FROM world
where population >= 10000000
GROUP BY continent;
--8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;