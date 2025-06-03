SELECT name FROM world
  WHERE name LIKE 'Y%'

SELECT name FROM world
  WHERE name LIKE '%Y'

SELECT name FROM world
  WHERE name LIKE '%x%'

SELECT name FROM world
  WHERE name LIKE '%land'

SELECT name FROM world
  WHERE name LIKE 'C%ia'

SELECT name FROM world
  WHERE name LIKE '%oo%'

SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

SELECT name FROM world
 WHERE name LIKE '%o__o%'

SELECT name FROM world
 WHERE name LIKE '____'

SELECT name
  FROM world
 WHERE name=capital

SELECT name
  FROM world
 WHERE capital LIKE '%city'

SELECT capital, name
   FROM world 
WHERE capital LIKE CONCAT('%',name,'%')

SELECT capital, name
   FROM world
WHERE capital LIKE CONCAT(name,'%') AND capital <> name

SELECT name, REPLACE(capital, name, '')
   FROM world
WHERE capital LIKE CONCAT(name,'%') 
   AND capital <> name
