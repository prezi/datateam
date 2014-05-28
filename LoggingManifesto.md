The Logging Manifesto
=====================

Who whould read this?
---------------------
You should read this if you:

- are an engineer, or
- manage engineers, or
- manage the product, or
- manage the website

Full-stack developer
--------------------
- current definition of full-stack developer
    - understanding the back-end, the front-end
    - building it, running it
    - writing it, testing it
    - hiring, teaching
    - many other facets of the full-stack guy/gal
    - with the advent of "data-driven" product development, we learned that we need to **measure**
        - write code to change a button
        - write logs for button
        - write tests
        - run tests
        - release to 2%
        - conduct A/B test whether new button is better than old button
        - evaluate test results
        - ...
    - how does logging come into play?

Startup cycles
--------------
- lean startup says: Build - Measure - Learn
- we know what the Measure phase means, and we're doing it at Prezi
- there's a zeroth phase: Plan
- full cycle is: Plan - Build - Measure - Learn
- when a startup is small, planning is implicit and nobody even notices it
- as it grows, **planning** becomes more apparent and important and meta layers appear:
    - setting company-level goals (hox)
    - building a financial/product model of the company (analytics)
    - setting a financial forecast for the next year (finance)
    - deriving product, engineering, marketing, sales, hiring plans from the above

Action items
------------
- data-driven means that the **Planning** phase must also be driven and informed by data
- what does this mean for a full-stack developer, at the current stage/scale of Prezi:
    - sorry, it's not enough to write logs to measure how many users click the button
    - you have to understand what logging event streams your code feeds into, and ultimately what business planing that feeds into
    - that way you can gauge the impact of your logging code
    - sometimes, it's not important: if you log the current cpu usage, that won't be used by Doug
    - but if you log something that ultimately causes a user to be an active user, that matters very much
    - or if you log something that is related to the virality of Prezi, such as sharing
- if you accept the importance of logging, it means logging should also be:
    - explictily part of planning (PMs)
    - acceptance tests in Jenkins
    - static analysis
    - agreements should be reached between teams how to do it, like for builds, testing, continuous integration
    - documentation (maybe generated automatically from log lines?)

Who should do it?
-----------------
- why you? why can't the data team take care of this?
    - there is no such thing as the data team
    - it doesn't scale: one team 5% the size of the engineering organization can't hunt down all log lines you write
    - you should do it: it's now part of your job description

What happens if you don't do it
-------------------------------
- this is where we're at right now
- the upper layers of the company won't have good, reliable data fed to them
- lots of waste (muda) in planning: bad decisions, bad models, bad forecasts, missed goals
- this eventually leads to bad morale for everybody at the company :(

