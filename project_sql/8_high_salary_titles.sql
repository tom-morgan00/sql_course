SELECT
    jp.job_title_short,
    ROUND(AVG(salary_year_avg), 0) as salary_avg
FROM job_postings_fact jp
WHERE jp.salary_year_avg IS NOT NULL
GROUP BY jp.job_title_short
ORDER BY salary_avg DESC;
