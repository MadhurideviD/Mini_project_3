CREATE DATABASE whr;

USE whr;

DROP TABLE world_happyiness_5_years;


DROP TABLE country;
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100)
);


SELECT * FROM country;

DROP TABLE factors; 
CREATE TABLE factors (
	year YEAR,
    family FLOAT,
    life_expectancy FLOAT,
    freedom FLOAT,
    government_corruption FLOAT,
    generosity FLOAT,
    dystopia_residual FLOAT,
    gdp_per_capita FLOAT,
    happiness_rank INT,
    happiness_score FLOAT,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
    );
    

SELECT * FROM factors;

SELECT country_id, happiness_score, gdp_per_capita FROM factors;

SELECT c.country_name, f.year, f.gdp_per_capita, f.happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
WHERE f.gdp_per_capita < 0.6 AND f.happiness_score > 5.0
ORDER BY f.happiness_score DESC
LIMIT 10;

SELECT 
    ROUND(MIN(f.gdp_per_capita), 3) AS min_gdp, -- 0
    ROUND(MAX(f.gdp_per_capita), 3) AS max_gdp, -- 1.871
    ROUND(AVG(f.gdp_per_capita), 3) AS avg_gdp -- 0.915
FROM factors f;

SELECT 
    ROUND(MIN(f.happiness_score), 3) AS min_hs, -- 2.693
    ROUND(MAX(f.happiness_score), 3) AS max_hs, -- 7.769
    ROUND(AVG(f.happiness_score), 3) AS avg_hs -- 5.377
FROM factors f;

SELECT
	c.country_name,
    ROUND(AVG(f.gdp_per_capita), 3) AS avg_gdp_per_capita,
    ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
GROUP BY c.country_name
HAVING avg_gdp_per_capita < 0.9 AND avg_happiness_score > 5
ORDER BY avg_happiness_score DESC;


SELECT
	c.country_name,
    ROUND(AVG(f.gdp_per_capita), 3) AS avg_gdp_per_capita,
    ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
GROUP BY c.country_name
HAVING avg_gdp_per_capita < 0.6 AND avg_happiness_score > 4.5
ORDER BY avg_happiness_score DESC;


SELECT freedom, AVG(happiness_score)
FROM factors
GROUP BY freedom
ORDER BY freedom;

-- Healthcare investment and happiness 
SELECT year, AVG(life_expectancy) AS avg_life, AVG(happiness_score) AS avg_happiness_score
FROM factors
GROUP BY year
ORDER BY year;


-- FREEDOM AND HAPPINESS
SELECT c.country_name, f.year, f.freedom, f.happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
WHERE f.freedom IS NOT NULL
ORDER BY f.freedom DESC
LIMIT 50;


SELECT * FROM factors;

SELECT c.country_name, f.year, f.freedom, f.life_expectancy, f.happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
WHERE f.freedom IS NOT NULL
ORDER BY f.freedom DESC
LIMIT 50;

SELECT
	c.country_name,
    ROUND(AVG(f.freedom), 3) AS avg_freedom,
    ROUND(AVG(f.life_expectancy), 3) AS avg_life_expectancy,
    ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
GROUP BY c.country_name
HAVING avg_freedom > 0.6 AND avg_life_expectancy > 0.6 AND avg_happiness_score > 5
ORDER BY avg_happiness_score DESC;


-- Ranking of the TOP 5 countries
(
  SELECT c.country_name, f.year, f.happiness_score
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2015
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2016
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2017
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2018
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2019
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
;

-- the same but comparing with life expectancy
(
  SELECT c.country_name, f.year, f.happiness_score, f.life_expectancy
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2015
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score, f.life_expectancy
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2016
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score, f.life_expectancy
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2017
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score, f.life_expectancy
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2018
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
UNION ALL
(
  SELECT c.country_name, f.year, f.happiness_score, f.life_expectancy
  FROM factors f
  JOIN country c ON f.country_id = c.country_id
  WHERE f.year = 2019
  ORDER BY f.happiness_score DESC
  LIMIT 5
)
;

SELECT * FROM factors;

SELECT c.country_name, f.year, f.government_corruption, f.happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
WHERE f.government_corruption IS NOT NULL
ORDER BY f.happiness_score ASC
;

SELECT 
    ROUND(MIN(f.government_corruption), 3) AS min_corr,
    ROUND(MAX(f.government_corruption), 3) AS max_corr,
    ROUND(AVG(f.government_corruption), 3) AS avg_corr
FROM factors f;


SELECT
	c.country_name,
    ROUND(AVG(f.government_corruption), 3) AS avg_government_corruption,
    ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
GROUP BY c.country_name
HAVING avg_government_corruption > 0.3 AND avg_happiness_score > 6
ORDER BY avg_happiness_score DESC;

SELECT
	c.country_name,
    ROUND(AVG(f.family), 3) AS avg_family,
    ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors AS f
JOIN country AS c ON f.country_id = c.country_id
GROUP BY c.country_name
ORDER BY avg_happiness_score DESC
LIMIT 20;

SELECT * FROM factors;

SELECT * FROM factors f
JOIN country c ON c.country_id = f.country_id
WHERE `country_name` = "Finland"
ORDER BY happiness_score DESC;


-- Greater freedom in a country correlates positively with happiness score, 
-- meaning personal and political freedoms significantly impact overall happiness
SELECT 
  ROUND(freedom, 1) AS freedom_range,
  ROUND(AVG(happiness_score), 3) AS avg_happiness_score,
  COUNT(*) AS num_registros
FROM factors
GROUP BY ROUND(freedom, 1)
ORDER BY freedom_range;


-- Top countries with high freedom and hapiness
SELECT
  c.country_name,
  ROUND(AVG(f.freedom), 3) AS avg_freedom,
  ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors f
JOIN country c ON f.country_id = c.country_id
GROUP BY c.country_name
HAVING avg_freedom > 0.6
ORDER BY avg_happiness_score DESC
LIMIT 10;

-- countries with low freedom and hapiness
SELECT
  c.country_name,
  ROUND(AVG(f.freedom), 3) AS avg_freedom,
  ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors f
JOIN country c ON f.country_id = c.country_id
GROUP BY c.country_name
HAVING avg_freedom < 0.4 -- lower than the average
ORDER BY avg_happiness_score ASC
LIMIT 10;

SELECT
	f.year,
	c.country_name,
	ROUND(AVG(f.freedom), 3) AS avg_freedom,
	ROUND(AVG(f.happiness_score), 3) AS avg_happiness_score
FROM factors f
JOIN country c ON f.country_id = c.country_id
GROUP BY f.year, c.country_name
HAVING avg_freedom > 0.6
ORDER BY avg_happiness_score DESC
LIMIT 10;

SELECT 
  year,
  ROUND(AVG(freedom), 3) AS avg_freedom,
  ROUND(AVG(happiness_score), 3) AS avg_happiness_score
FROM factors
GROUP BY year
ORDER BY year;


SELECT max(freedom) FROM factors;
SELECT avg(freedom) FROM factors;

-- compare gov corruption vs freedom
SELECT
  c.country_name,
  ROUND(AVG(f.government_corruption), 3) AS avg_corruption,
  ROUND(AVG(f.freedom), 3) AS avg_freedom
FROM factors f
JOIN country c ON f.country_id = c.country_id
GROUP BY c.country_name
ORDER BY avg_corruption DESC
LIMIT 20;


-- evolution of gov perception over time
SELECT
  f.year,
  c.country_name,
  ROUND(AVG(f.government_corruption), 3) AS avg_corruption
FROM factors f
JOIN country c ON f.country_id = c.country_id
GROUP BY f.year, c.country_name
ORDER BY c.country_name, f.year
LIMIT 25;


