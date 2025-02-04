WITH remote_jobs AS (
    SELECT COUNT(job_id) as count
    FROM job_postings_fact
    WHERE job_work_from_home = TRUE
)

SELECT rj.count::FLOAT/ COUNT(jp.job_id) * 100 as percentage
FROM job_postings_fact jp
CROSS JOIN remote_jobs rj
GROUP BY rj.count