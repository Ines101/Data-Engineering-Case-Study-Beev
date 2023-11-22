-- a. We want to find the total number of cars by model by country.

SELECT cm.model, cc.country, COUNT(*) AS total_cars
FROM car_model cm
JOIN car_consumer cc ON cm.id_model = cc.id_model
GROUP BY cm.model, cc.country;

-- b. We want to know which country has the most of each model
WITH RankedModels AS (
  SELECT cm.model,
         cc.country,
         COUNT(*) AS total_cars,
         RANK() OVER (PARTITION BY cm.model ORDER BY COUNT(*) DESC) as rank
  FROM car_model cm
  JOIN car_consumer cc ON cm.id_model = cc.id_model
  GROUP BY cm.model, cc.country
)
SELECT model, country, total_cars
FROM RankedModels
WHERE rank = 1;

-- c. We want to know if any model is sold in the USA but not in France

SELECT c.model
FROM car_consumer cc
JOIN car_model c ON cc.id_model = c.id_model
WHERE cc.country = 'USA'
EXCEPT
SELECT c.model
FROM car_consumer cc
JOIN car_model c ON cc.id_model = c.id_model
WHERE cc.country = 'France';

-- d. We want to know how much the average car costs in every country by engine type.
SELECT cc.country, cs.engine_type, AVG(cs.price) as average_price
FROM car_sales cs
JOIN car_consumer cc ON cs.id_model = cc.id_model
GROUP BY cc.country, cs.engine_type;

-- e. We want to know the average ratings of electric cars vs thermal cars

SELECT 'Electric' as type, AVG(cc.review_score) as average_rating
FROM car_consumer cc
JOIN car_sales cs ON cc.id_model = cs.id_model
WHERE cs.engine_type = 'Electric'
UNION
SELECT 'Thermal' as type, AVG(cc.review_score) as average_rating
FROM car_consumer cc
JOIN car_sales cs ON cc.id_model = cs.id_model
WHERE cs.engine_type != 'Electric';

-- show the amount of electric vs thermal cars sold per year.

SELECT cm.year, cs.engine_type, SUM(cc.sales_volume) AS total_sales
FROM car_sales cs
JOIN car_model cm ON cs.id_model = cm.id_model
JOIN car_consumer cc ON cm.id_model = cc.id_model
WHERE cs.engine_type IN ('Electric', 'Thermal')
GROUP BY cm.year, cs.engine_type
ORDER BY cm.year, cs.engine_type;

