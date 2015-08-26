# Metrics team backlog

## Documentation

- index page: list of all possible sources (datadoc, google analytics, android app store something...) cf Is there a "What tool to use for what" doc? email from Drew Banks, Android from GA: https://chartio.com/prezi/android-getting-the-app/
- migrate from wiki to datadoc:
  - http://wiki.prezi.com/index.php?title=Main_Page#Data
  - https://drive.google.com/a/prezi.com/file/d/0B8cZfvprPRNlZTlGYnZJdXV5SDg/view
- link them in confluence


## Check SUL-MUL flow

https://datadoc.prezi.com/alert/167988


## Fix source in metrics.active_time_aggregated

It contains strange values like "edito", "editoc", "editov"


## Core vs user jobs

- migrate logbox rules from user to core that we depend on: desktop?
- migrate/take over user jobs we depend on


## 11k ISK Braintree chargeback

```sql
SELECT
  *
FROM
  metrics.braintree_disputes
WHERE parent_transaction_id = 'dqztjqr'
AND id = '6bpy39wytjf7gkcg'
ORDER BY updated_at
LIMIT
  500
;
```


## Misc

- braintree chargeback and refunds duplicates
- should_pay_day for monthly: first payment + full months (there's no trial)
- extended_access log - refcode_cookie_request and refcode_cookie_response are corrupted for 2015-06-03 to 2015-08-15

## check SnT
https://datadoc.prezi.com/alert/24517
https://datadoc.prezi.com/alert/25046

## check Flow metrics.staging_all_payment_events
https://datadoc.prezi.com/alert/25067


## Fix licenses

EDU Connect and JS Beta
Simple:
jobs/snt/daily-license-state/daily-user-license-state-old.pig
jobs/snt/daily-license-state/daily-user-license-state-with-payments.pig
jobs/user/pipeline/license/transform.sql
Tricky:
jobs/user/paying-status/transform.pig



## paypal flags, duplicates, refunds?

```sql
SELECT
  *
FROM
  metrics.staging_payment_events_paypal
WHERE updated_at = '2014-12-09-16'
LIMIT
  10
;

SELECT
  *
FROM
  metrics.paypal_ipn
WHERE
  txn_id IN ('1WR158294A743402N', '40G24535SG2913253')
  OR parent_txn_id IN ('1WR158294A743402N', '40G24535SG2913253')
LIMIT
  10
;

SELECT
  *
FROM
  metrics.paypal_ipn
WHERE
  txn_id = '63446118RT159872B'
  OR parent_txn_id = '63446118RT159872B'
LIMIT
  50
;
```



## staging_all_payment_events

- https://datadoc.prezi.com/alert/16181
- https://datadoc.prezi.com/alert/16182
- https://datadoc.prezi.com/alert/16183
- https://datadoc.prezi.com/alert/16185
- https://datadoc.prezi.com/alert/16187
- https://datadoc.prezi.com/alert/16188

```sql
SELECT
  *
FROM
  metrics.staging_payment_events_braintree p
LEFT JOIN
  metrics.user u
ON
  u.user_id = p.user_id
WHERE
  event_date='2014-11-24'
  AND u.user_id IS NULL
;

SELECT
  event_date,
  COUNT(1) as count,
  SUM(CASE WHEN u.user_id IS NULL THEN 1 ELSE 0 END) AS unknown_user_payment_count,
  ROUND(100.0 * SUM(CASE WHEN u.user_id IS NULL THEN 1 ELSE 0 END) / COUNT(1), 1) AS unknown_user_payment_rate
FROM
  metrics.staging_payment_events_braintree p
LEFT JOIN
  metrics.user u
ON
  u.user_id = p.user_id
WHERE
  event_date >= '2014-10-01'
GROUP BY
  event_date
ORDER BY
  event_date
;

SELECT
  *
FROM
  metrics.staging_payment_events_paypal p
LEFT JOIN
  metrics.user u
ON
  u.user_id = p.user_id
WHERE
  event_date='2014-11-24'
  AND u.user_id IS NULL
;

SELECT
  event_date,
  COUNT(1) as count,
  SUM(CASE WHEN u.user_id IS NULL THEN 1 ELSE 0 END) AS unknown_user_payment_count,
  ROUND(100.0 * SUM(CASE WHEN u.user_id IS NULL THEN 1 ELSE 0 END) / COUNT(1), 1) AS unknown_user_payment_rate
FROM
  metrics.staging_payment_events_paypal p
LEFT JOIN
  metrics.user u
ON
  u.user_id = p.user_id
WHERE
  event_date >= '2014-10-01'
GROUP BY
  event_date
ORDER BY
  event_date
;
```
