# Introduction

This project explores the top-paying jobs within data analytics and I discover the most in-demand skills for those roles.

This is my first data analytics project and I followed a guide on YouTube linked below. Questions 1-5 are straight from the course but I also added questions 6-10 to test myself.
[SQL for Data Analytics](https://www.youtube.com/watch?v=7mz73uXD9DA)

### Original questions

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

### Additional questions

6. Which companies offer the highest average salary?
7. What are the most in-demand skills based on job postings?
8. What percentage of jobs are remote (work from home)?
9. Which job titles have the highest average salary?
10. What is the distribution of job postings across different countries?

Here are all the SQL queries: [project_sql folder](/project_sql/)

# Tools I Used

For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- SQL
- PostgreSQL
- Visual Studio Code
- Git & GitHub

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```sql
SELECT
    jp.job_title,
    ROUND(jp.salary_year_avg / 1000.0, 1) || 'k' AS salary_year_avg,
    jp.job_location,
    c.name AS company_name,
    jp.job_schedule_type,
    jp.job_posted_date
FROM job_postings_fact jp
LEFT JOIN company_dim c
ON jp.company_id = c.company_id
WHERE jp.job_title_short = 'Data Analyst'
AND jp.job_location = 'Anywhere'
AND jp.salary_year_avg IS NOT NULL
ORDER BY jp.salary_year_avg DESC
LIMIT 10;
```

Here's the breakdown of the top data analyst jobs in 2023:

- **Wide Salary Range:** Top 10 paying data analyst roles span from $184k to $650k, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specialisations within data analytics.
