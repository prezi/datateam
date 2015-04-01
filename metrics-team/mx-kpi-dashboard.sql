-- Active

-- Data quality [%]
-- Line; 0-100

SELECT
  w.first_day as "Week",
  ROUND(AVG(data_quality))::INT AS "Data quality",
  ROUND(AVG(data_quality_w_candidates))::INT AS "Data quality with candidates"
FROM metrics.aux_weeks w
LEFT JOIN (
  SELECT
    d.day,
    GREATEST(100 - NVL(SUM(CASE WHEN i.is_candidate=0 THEN i.severity ELSE 0 END), 0), 0) AS data_quality,
    GREATEST(100 - NVL(SUM(i.severity), 0), 0) AS data_quality_w_candidates
  FROM metrics.aux_days d
  LEFT JOIN metrics.mx_data_quality_issues i
  ON i.first_day <= d.day
  AND (i.last_day IS NULL OR i.last_day >= d.day)
  WHERE d.day >= '2015-03-02'
  GROUP BY d.day
) d
ON d.day BETWEEN w.first_day AND w.last_day
WHERE w.first_day >= '2015-03-02' AND w.last_day < DATE(GETDATE())
GROUP BY w.first_day
ORDER BY w.first_day;


-- PA and DD usage [# of unique users]
-- Line

SELECT
  w.first_day,
  pa.user_count AS "Prezi Analytics",
  dd.user_count AS "DataDoc"
FROM
  metrics.aux_weeks w
LEFT JOIN
  metrics.mx_pa_usage pa
ON
  pa.week = w.first_day
LEFT JOIN
  metrics.mx_dd_usage dd
ON
  dd.week = w.first_day
WHERE
  (pa.week IS NOT NULL OR dd.week IS NOT NULL)
  AND w.first_day >= '2015-02-09'
ORDER BY
  w.first_day
;


-- PA and DD NPS
-- Line; -100..100

SELECT
  survey_date AS "Survey date",
  ROUND(100.0*(pa_promoter_count-pa_detractor_count)/pa_score_count)::INT AS "Prezi Analytics",
  ROUND(100.0*(dd_promoter_count-dd_detractor_count)/dd_score_count)::INT AS "DataDoc"
FROM
  metrics.mx_nps_stats
ORDER BY
  survey_date
;


-- Core dataset usage (manual)
-- Line; Dual axis

SELECT
  week AS "Week",
  user_count AS "# of unique users",
  query_count AS "# of queries"
FROM
  metrics.mx_redshift_queries_using_core_datasets
ORDER BY
  week
;


-- Core dataset usage (automatic)
-- Line

SELECT
  w.first_day AS "Week",
  MIN(user_job_count) AS "# of user jobs"
FROM
  metrics.mx_core_dataset_usage cdu
INNER JOIN
  metrics.aux_weeks w
ON
  cdu.date = w.last_day
GROUP BY
  w.first_day
ORDER BY
  w.first_day
;


-- False positive alerts
-- Bar+Line; Dual axis

SELECT
  DATE(DATE_TRUNC('week', finished_at)) AS "Week",
  SUM(CASE WHEN acknowledged IS TRUE AND ack_reason = 'F' THEN 1 ELSE 0 END) AS "Number",
  ROUND(100.0*SUM(CASE WHEN acknowledged IS TRUE AND ack_reason = 'F' THEN 1 ELSE 0 END)/COUNT(1))::INT AS "Ratio"
FROM
  metrics.mx_datadoc_alerts
WHERE
  status IN ('T', 'W', 'E', 'X')
  AND finished_at >= '2015-02-23 00:00:00'
  AND DATE(DATEADD(day, 6, DATE_TRUNC('week', finished_at))) < DATE(GETDATE())
GROUP BY
  DATE(DATE_TRUNC('week', finished_at))
ORDER BY
  DATE(DATE_TRUNC('week', finished_at))
;


-- Unhandled alerts
-- Bar+Line; Dual axis

SELECT
  DATE(DATE_TRUNC('week', finished_at)) AS "Week",
  SUM(CASE WHEN acknowledged IS FALSE THEN 1 ELSE 0 END) AS "Number",
  ROUND(100.0*SUM(CASE WHEN acknowledged IS FALSE THEN 1 ELSE 0 END)/COUNT(1))::INT AS "Ratio"
FROM
  metrics.mx_datadoc_alerts
WHERE
  status IN ('T', 'W', 'E', 'X')
  AND finished_at >= '2015-02-23 00:00:00'
  AND DATE(DATEADD(day, 6, DATE_TRUNC('week', finished_at))) < DATE(GETDATE())
GROUP BY
  DATE(DATE_TRUNC('week', finished_at))
ORDER BY
  DATE(DATE_TRUNC('week', finished_at))
;




-- Deprecated

-- Hours spent on interrupts
-- Area

SELECT
  week AS "Week",
  planned AS "Planned",
  unplanned AS "Unplanned"
FROM
  metrics.mx_interrupts
ORDER BY
  week
;


-- Out/In Ratio
-- Bar+Line

SELECT
  week AS "Week",
  ROUND(done_real+(1.0*done_real/done_planned*notdone_planned))::INT AS "In",
  done_real AS "Out",
  ROUND(100.0*done_real/(done_real+(1.0*done_real/done_planned*notdone_planned)))::INT AS "Out/In Ratio"
FROM
  metrics.mx_in_out_ratio
ORDER BY
  week
;
