The Logging Manifesto
=====================

Who whould read this?
---------------------
You should read this if you:

- are an engineer, or
- manage engineers, or
- manage the product, or
- manage the website

Startup cycles
--------------
- lean startup says: Build - Measure - Learn
- we know what the Measure phase means, and we're doing it at Prezi:
    - write code to change a button
    - write logs for button
    - write tests
    - run tests
    - release to 2%
    - conduct A/B test whether new button is better than old button
    - evaluate test results
    - ...
- but there's a zeroth phase: Plan
- full cycle is: Plan - Build - Measure - Learn
- when a startup is small, planning is implicit and nobody even notices it
- as it grows, **planning** becomes more apparent and important and meta layers appear:
    - setting company goals (hox)
    - building a quantitative model of the company (hox, finance, analytics)
    - creating a financial forecast (finance)
    - deriving product, engineering, marketing, sales, hiring plans from the above

Action items
------------
- **planning** is driven by data
- what does this mean for a full-stack developer, at the current stage/scale of Prezi:
    - sorry, it's not enough to write logs to measure how many users click the button
    - you have to understand what logging event streams your logging() code feeds into
    - and ultimately what business planning that feeds into
    - that way you can gauge the impact of your logging code
    - sometimes, it's not that important: if you log the current cpu usage, that won't be used by Doug
    - but, if you log something that ultimately causes a user to be an active user, that matters very much
    - or, if you log something that is related to the virality of Prezi, such as sharing
- if you accept the importance of logging, it means logging should also be:
    - explictily part of planning (PMs)
    - acceptance tests in Jenkins
    - static analysis
    - agreements should be reached between teams how to do it, like for builds, testing

Who should do it?
-----------------
- why you? why can't the data team take care of this?
    - there is no such thing as the data team
    - it doesn't scale: one 2 person team can't hunt down all log lines you write (or can they? how does the security team do it?)
    - it's now part of your job description (what is?)

What happens if you don't do it
-------------------------------
- this is where we're at right now
- the upper layers of the company won't have good, reliable data fed to them
- lots of waste (muda) in planning: bad decisions, bad models, bad forecasts, missed goals
- this eventually leads to bad morale for everybody at the company :(


Good first step: let's get the core metrics right
-------------------------------------------------
Actually, there are not that many core metrics:
- website visits (we don't have it)
- user registrations
- daily active user
- nps
- trial enter
- payments

We connect these (except website visits) to users, and then segment by:
- registration source (bad)
- location (first IP address we see in the logs)
- license
- platform (we don't have it)

Other ideas
-----------
1. talk to Analytics team (Balogh sucess story: ipad new editor logs kick ass)
2. if you log it like X, it will go into redshift automatically
3. charting tool for redshift (charting.io)
4. lead metric for each team: % of active users who use your feature
