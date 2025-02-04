-- WITH in_demand_skills AS (
--     SELECT 
--         s.skill_id,
--         s.skills,
--         COUNT(sj.job_id) as count
--     FROM skills_job_dim sj
--     INNER JOIN job_postings_fact jp
--     ON sj.job_id = jp.job_id
--     INNER JOIN skills_dim s
--     ON sj.skill_id = s.skill_id
--     WHERE jp.job_title_short = 'Data Analyst'
--     AND salary_year_avg IS NOT NULL
--     AND jp.job_work_from_home = TRUE
--     GROUP BY s.skill_id
-- ),

-- high_salary_skills AS (
--     SELECT
--         s.skill_id,
--         s.skills,
--         ROUND(AVG(jp.salary_year_avg), 0) AS salary_avg
--     FROM skills_job_dim sj
--     INNER JOIN job_postings_fact jp
--     ON jp.job_id = sj.job_id
--     INNER JOIN skills_dim s 
--     ON s.skill_id = sj.skill_id
--     WHERE jp.job_title_short = 'Data Analyst'
--     AND salary_year_avg IS NOT NULL
--     AND jp.job_work_from_home = TRUE
--     GROUP BY s.skill_id
-- )

-- SELECT 
--     ids.skill_id,
--     ids.skills,
--     ids.count,
--     hss.salary_avg
-- FROM in_demand_skills ids
-- INNER JOIN high_salary_skills hss
-- ON ids.skill_id = hss.skill_id
-- WHERE ids.count > 30
-- ORDER BY 
--     hss.salary_avg DESC,
--     ids.count DESC
-- LIMIT 25;

SELECT 
    s.skills,
    sj.skill_id,
    COUNT(sj.job_id),
    ROUND(AVG(jp.salary_year_avg), 0) AS salary_avg
FROM skills_job_dim sj 
INNER JOIN job_postings_fact jp
ON jp.job_id = sj.job_id
INNER JOIN skills_dim s 
ON s.skill_id = sj.skill_id
WHERE jp.job_title_short = 'Data Analyst'
AND jp.salary_year_avg IS NOT NULL
AND jp.job_work_from_home = TRUE
GROUP BY sj.skill_id, s.skills
HAVING COUNT(sj.job_id) > 10
ORDER BY salary_avg DESC
LIMIT 25;