require 'csv'
require 'pg'
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "mass_health")
    yield(connection)
  rescue PG::UniqueViolation
  ensure
    connection.close
  end
end

def import_csv_data
  CSV.foreach("mass-chip-data.csv", headers: true) do |row|
    row_array = []
    row.each do |entry|
      if entry[1] == "NA"
        entry[1] = nil
        row_array << entry[1]
      elsif entry[1].is_a? String
        entry[1].delete!(',')
        row_array << entry[1]
      elsif entry[1]
        row_array << entry[1]
      end
    end
    sql ="INSERT INTO town_health_records (name, population,
      children_pop, seniors_pop, income_per_capita,
      poverty_line_pop, poverty_line_percent_pop, adequate_maternal_care, c_sections,
      infant_deaths, infant_mortality, low_birthweight,
      multiple_births, publicly_financed_prenatal, teen_births)
      VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11,
      $12, $13, $14, $15)"
    db_connection { |conn| conn.exec_params(sql, row_array) }
  end
end

import_csv_data
