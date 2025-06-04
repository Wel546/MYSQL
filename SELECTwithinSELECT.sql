SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
WHERE gdp/population > (
   SELECT gdp/population FROM world 
   WHERE name = 'United Kingdom'
   )
   AND continent = 'Europe'

SELECT name, continent FROM world
WHERE continent IN (
   SELECT continent FROM world
   WHERE name IN ('Argentina','Australia'))
/* Fiz assim apenas pelo objetivo das atividades 
que seria utilizar os subselects, mas profissionalmente 
bastaria olhar quais os continentes de ambos os 
países descritos e colocá-los como filtro no WHERE*/

SELECT name, population FROM world 
WHERE population > (
   SELECT population FROM world 
   WHERE name = 'United Kingdom'
   ) 
   AND population < (
      SELECT population FROM world 
      WHERE name = 'Germany'
   )

SELECT name
   ,CONCAT(ROUND(100*population/(
   SELECT population FROM world
   WHERE name = 'Germany')),'%')
FROM world
WHERE continent = 'Europe'

SELECT name FROM world
 WHERE gdp > ALL(
   SELECT gdp FROM world
   WHERE continent = 'Europe'
      AND gdp > 0)

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

SELECT continent, name FROM (
   SELECT continent
   ,name
   ,ROW_NUMBER() OVER (PARTITION BY continent 
   ORDER BY name) AS ROWnumber FROM world
   ) AS SUBselect
WHERE ROWnumber=1
ORDER BY name

SELECT name, continent, population FROM world
WHERE continent in (
   SELECT continent
   FROM world 
   GROUP BY continent
   HAVING SUM(population) <= 25000000) 

SELECT name, continent FROM world x
WHERE population > ALL (
   SELECT y.population*3 FROM world y
   WHERE x.continent = y.continent
      AND x.name != y.name
    )
