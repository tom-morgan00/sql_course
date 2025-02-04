SELECT 
    jp.company_id,
    c.name as company_name,
    COUNT(jp.company_id) as count,
    ROUND(AVG(jp.salary_year_avg), 0) as avg_salary
FROM job_postings_fact jp
INNER JOIN company_dim c
ON c.company_id = jp.company_id
WHERE jp.salary_year_avg IS NOT NULL
AND jp.job_title_short = 'Data Analyst'
GROUP BY jp.company_id, c.name
HAVING COUNT(jp.company_id) > 2
ORDER BY avg_salary DESC
LIMIT 10;