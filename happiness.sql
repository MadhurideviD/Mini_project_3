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
