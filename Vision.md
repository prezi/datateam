D.A.T.A. Vision
===============

One sentence: Prezilians can get answers to quantifiable questions about Prezi within an hour.

Medium term
-----------
- no data prio1 in 3 months
- codifed core metrics
- data warehouse and charting on top to replace GoodData
- **good process for doing business analytics**

Data culture
------------
- every Prezilians understand what she needs to do to enable a data-driven culture:
    - buy-in from engineering organization:
        - conscious logging choices because every engineer understands that the data/charts derived from these logs is the basis of our product, marketing, finance and hox organizations now and going forward
        - engineers think about the data that will be derived from their programs' logs the same way they think about testing or refactoring their code
        - this is treated as part of the "full-stack developer"
    - product managers and techleads allocate time for this the same way they allocate time for refactoring code
- self-service: **Prezilians can find, access and understand data** and create their own charts and dashboards without confusing data problems
- A/B testing is part of our culture
- industry leaders: we are invited to conferences to share our culture's details

Data tools and infrastructure
-----------------------------
- no more than 1 data prio1 per cycle
- 99.9% Hadoop uptime
- on-time delivery
- scales with prezi.com
- accurately preserves data flowing through it
- minimal manual intervention to keep it running
- real-time, fine-grained metrics and tools to query it (like Linkedin):
    - can tell whether CPU load of an app server is correlated with load time of Prezis loaded from that server
    - can tell whether ^ is correlated with long-term retention of those users
- Prezilians can create self-service funnels
- industry leaders: we are invited to conferences to share our system's details

Metrics and warehouse
---------------------
- clear definition of important company-wide metrics
- core datasets related to company-wide metrics available in a clean, structured, documented data warehouse

Data dashboards
---------------
- Prezi Circulatory System: a company-wide diagram which shows the flow of visitors, users, trials, revenue, etc. through our business to a fine detail, showing where and what each team impacts
    - seeded with real data from our warehouse
    - shows up-to-date information
    - includes forecast
    - supports impact modeling: "what happens if we increase trial-to-pay by 10%?"
    - teams know their place in this system, goals and metrics are in accordance, displayed and tracked on it
- replace GoodData with a dashboarding system (off-the-shelf or homegrown) that is able to show fine-segments like Prezi Analytics but supports self-service charts and dashboards like GoodData
- we open source our dashboards and it acts as a hiring magnet
- industry leaders: we are invited to conferences to share our system's details


Product Analytics
-----------------
- clear understanding of our user population:
    - user segments: elemantary school, high school, college, gov, smb, f500, private
    - what the value of the product for each segment is
    - parameters such as trial-to-pay and retention measured for each
    - funnel built for each user segment
    - interaction of segments wrt. virality
- thousands of A/B test experiments running in parallel to test the effect of individual changes (instead of causation vs. correlation discussions)
- equivalence of product managers and product analyst: our PMs have strong analytics skills and don't need help from analysts, and vica versa, our analysts can act as PMs
- relevant product changes are analyzed for their business impact

Business Analytics
------------------
- relevant product changes are analyzed for their business impact
- clear definition of important company-wide metrics
- every Prezilian knows what they are, their definitions, their current value
- changes in our metrics ("trial-to-pay went down") can be tracked back easily to root causes ("lots of students in europe went into trial a month ago because of an email campaign")

Data people and teams
---------------------
- separation of concerns: each function has a separate >= 2 man team assigned
    - infrastructure and tools
    - dashboards
    - metrics
    - product analytics
    - business analytics
