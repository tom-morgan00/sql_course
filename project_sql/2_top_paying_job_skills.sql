/*
 2. What skills are required for the top-paying data analyst jobs?

 - Use the top ten highest-paying jobs from the first query
 - Fetch the skills for these roles
 */

WITH top_paying_jobs AS (
    SELECT 
        jp.job_id,
        jp.job_title, 
        ROUND(jp.salary_year_avg, 0) AS salary_year_avg,
        c.name AS company_name
    FROM job_postings_fact jp
    LEFT JOIN company_dim c
    ON jp.company_id = c.company_id 
    WHERE jp.job_title_short = 'Data Analyst'
    AND jp.job_location = 'Anywhere'
    AND jp.salary_year_avg IS NOT NULL
    ORDER BY jp.salary_year_avg DESC
    LIMIT 10
)

SELECT 
    tj.job_title, 
    tj.salary_year_avg,
    STRING_AGG(s.skills, ', ') AS skills
FROM top_paying_jobs tj
LEFT JOIN skills_job_dim sj  
ON sj.job_id = tj.job_id
LEFT JOIN skills_dim s
ON sj.skill_id = s.skill_id
GROUP BY 
    tj.job_title, 
    tj,salary_year_avg, 
    tj.company_name
ORDER BY tj.salary_year_avg DESC;