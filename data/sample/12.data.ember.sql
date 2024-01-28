delete from ember_country_overview;

-- Source: https://raw.githubusercontent.com/ember-climate/ember-data-api/main/data/api_country_overview_yearly.csv
COPY ember_country_overview FROM '/path/to/your_data.csv' WITH CSV HEADER;--