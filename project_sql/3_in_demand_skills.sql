WITH remote_job_skills AS (
    SELECT sj.*
    FROM skills_job_dim sj
    INNER JOIN job_postings_fact jp
    ON sj.job_id = jp.job_id
    WHERE jp.job_title_short = 'Data Analyst'
    AND jp.job_work_from_home = TRUE
)

SELECT
    s.skills AS skill,
    COUNT(*) AS count
FROM remote_job_skills rjs
INNER JOIN skills_dim s
ON rjs.skill_id = s.skill_id
GROUP BY s.skills
ORDER BY count DESC
LIMIT 10;