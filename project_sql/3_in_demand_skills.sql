SELECT 
    s.skills,
    COUNT(sj.job_id) as count
FROM skills_job_dim sj
INNER JOIN job_postings_fact jp
ON sj.job_id = jp.job_id
INNER JOIN skills_dim s
ON sj.skill_id = s.skill_id
WHERE jp.job_title_short = 'Data Analyst'
AND jp.job_work_from_home = TRUE
GROUP BY s.skills
ORDER BY count DESC
LIMIT 10;