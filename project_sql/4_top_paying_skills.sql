/*
Question: What are the top skills basedon salary?
- Look at the averagesalary associated with eachskillforData Analyst positions
- Focuses on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for Data Analyst and 
    help identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills
ORDER BY avg_salary DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills
- High Salaries Linked to Big Data & Engineering Skills - 
    Data Analysts who upskill in cloud, pipelines, and distributed data processing 
    are commanding premium salaries, likely due to their ability to support 
    large-scale data workflows.
- Strong Preference for Python & Machine Learning Ecosystem - 
    Python-based tools are essential for high-paying roles, especially when paired 
    with modeling, scripting, or automation tasks.
- DevOps & Version Control Skills = More Money - 
    Analysts who understand CI/CD workflows and version control are being rewarded
    —this reflects the industry’s move toward treating analytics like 
    software development (often called Analytics Engineering).
- Niche & Specialized Tools Pay More - Specializing in less common but in-demand tools
     may be a lucrative career move, especially if combined with domain knowledge.
- Cloud & Scalable Data Systems Are Vital - 
    he modern analyst is increasingly expected to work with cloud-based systems, APIs,
    and scalable data platforms, not just spreadsheets and SQL.

[
  {
    "skills": "pyspark",
    "avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "watson",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500"
  },
  {
    "skills": "swift",
    "avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000"
  },
  {
    "skills": "golang",
    "avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "avg_salary": "141907"
  },
  {
    "skills": "linux",
    "avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436"
  },
  {
    "skills": "notion",
    "avg_salary": "125000"
  },
  {
    "skills": "scala",
    "avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619"
  }
]
*/