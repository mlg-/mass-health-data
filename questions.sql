-- What 3 towns have the highest population of citizens that are 65 years and older?
SELECT name, seniors_pop
FROM town_health_records
WHERE name != 'Massachusetts Total'
ORDER BY seniors_pop DESC
LIMIT 3;

-- What 3 towns have the highest population of citizens that are 19 years and younger?
SELECT name, children_pop
FROM town_health_records
WHERE name != 'Massachusetts Total'
ORDER BY children_pop DESC
LIMIT 3;

-- What 5 towns have the lowest per capita income?
SELECT name, income_per_capita
FROM town_health_records
ORDER BY income_per_capita ASC
LIMIT 5;

-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?
SELECT name, teen_births
FROM town_health_records
WHERE name != 'Boston' AND name != 'Becket' AND name != 'Beverly'
AND teen_births IS NOT NULL
ORDER BY teen_births DESC
LIMIT 1;

-- Omitting Boston, what town has the highest number of infant mortalities?
SELECT name, infant_mortality
FROM town_health_records
WHERE name != 'Boston'
AND infant_mortality IS NOT NULL
ORDER BY infant_mortality DESC
LIMIT 1;
