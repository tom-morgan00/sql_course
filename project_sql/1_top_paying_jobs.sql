/*
 1. What are the top-paying data analyst jobs?

 - Identify the top 10 highest paying, remote data analyst roles
 - Focus on job postings with salaries (remove nulls)
 */

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