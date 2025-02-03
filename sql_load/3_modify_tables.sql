-- COPY company_dim 
-- FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/company_dim.csv' 
-- WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- COPY skills_dim 
-- FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/skills_dim.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- COPY job_postings_fact
-- FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/job_postings_fact.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- COPY skills_job_dim
-- FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/skills_job_dim.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy company_dim FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM '/Users/44752/Documents/Data Analytics/SQL_Project_Data_Job_Analysis/csv_files/skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
