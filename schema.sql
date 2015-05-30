DROP TABLE IF EXISTS town_health_records;

CREATE TABLE town_health_records (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  population INT,
  children_pop INT,
  seniors_pop INT,
  income_per_capita MONEY,
  poverty_line_pop INT,
  poverty_line_percent_pop DECIMAL(5,2),
  adequate_maternal_care DECIMAL(5,2),
  c_sections DECIMAL(5,2),
  infant_deaths INT,
  infant_mortality DECIMAL(5,2),
  low_birthweight DECIMAL(5,2),
  multiple_births DECIMAL(5,2),
  publicly_financed_prenatal DECIMAL(5,2),
  teen_births DECIMAL(5,2)
);
