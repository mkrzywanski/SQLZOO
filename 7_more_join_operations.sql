--1
SELECT id, title
 FROM movie
 WHERE yr=1962
 --2
 SELECT yr
FROM movie
WHERE title = 'Citizen Kane'
--3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
--4
SELECT id
FROM actor
WHERE  name = 'Glenn Close';
--5
SELECT id
FROM movie
WHERE title = 'Casablanca';
--6
SELECT actor.name
FROM casting JOIN movie on movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.id = 11768;
--7
SELECT actor.name
FROM casting JOIN movie on movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.title = 'Alien';
--8
SELECT movie.title
FROM casting JOIN movie on movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford';
--9
SELECT movie.title
FROM casting JOIN movie on movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND casting.ord <> 1;
--10
SELECT movie.title, actor.name
FROM casting JOIN movie on movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1 AND movie.yr = 1962;
--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)
--12
SELECT movie.title, actor.name
FROM movie join casting on movie.id = casting.movieid
JOIN actor on casting.actorid = actor.id
WHERE movie.id IN (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
AND casting.ord = 1;
--13
SELECT actor.name
FROM casting JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(*) >=30
ORDER BY actor.name;
--14
SELECT movie.title, COUNT(casting.actorid)
FROM movie JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(*) DESC, title;
--15

