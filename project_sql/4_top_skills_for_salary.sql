SELECT
    s.skills,
    ROUND(AVG(jp.salary_year_avg), 0) AS salary_avg
FROM skills_job_dim sj
INNER JOIN job_postings_fact jp
ON jp.job_id = sj.job_id
INNER JOIN skills_dim s 
ON s.skill_id = sj.skill_id
WHERE jp.job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL
GROUP BY s.skills
ORDER BY salary_avg DESC
LIMIT 10;