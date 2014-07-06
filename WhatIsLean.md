What is lean
============

This is based on the book **This is Lean**.

http://www.amazon.com/This-Lean-Resolving-Efficiency-Paradox/dp/919803930X

These ideas are all derived from the Toyota Motor Corporation's internal work culture.

Flow efficiency vs resource efficiency
--------------------------------------
You have a process in which you serve a request or build something.
Let's say you are serving requests, like the Analytics team serves project requests.
A flow unit is a project.
Resource are the analysts working on the projects.
Flow is the system which the unit and the resource make up:
- analyst talks to PMs, takes requests
- prioritizes requests
- decides what to do, what not to do
- communicates 'no' decisions
- works on projects
- iterates with PM on the project
- delivers result
- receives acknowledgement that the project is done from the PM

**Resource efficiency** is when the resource (the analyst) is always busy.
We often think that if we are resource efficient (always busy), we are efficient.
This is not true.

**Flow efficiency** means that the throughput time (the time it takes for a flow unit to go through the system) is low, and the flow unit it being worked on during this time.
We should be optimizing for flow efficiency, not resource efficiency.
Why? Because this is what makes the customer (the PM) happy: if he receives his answer quickly. He doesn't care how hard the analyst works, how busy the analyst is.

More specifically, **flow efficiency** is the ratio of:
- the amount of time the flow unit is in the system, and it is being worked on in some form (value-adding time)
- the total time the flow unit spent in the system

In a flow efficient system, this ratio is high: the flow unit enter the system, the resouces quickly work on it like busy little ants, and the flow unit exits the system.

It's not that important, but **resource efficiency** can also be defined to be the ratio of:
- the amount of time a resource works on flow units (value-adding time)
- total time (eg. per day)

The efficiency paradox
----------------------
Concentrating on resource efficiency tends to introduce a lot of waste into the system:
- long queues
- long waiting time
- large inventory
- complex logistics when moving the inventory
- quality troubles (waits in inventory, goes bad)
- peopleware worrying (has to wait, has to handle long queues, eg. email)
- costly restarts (when something goes wrong or changes)
- ^ these then generate even more work, leading to the efficiency paradox

The efficiency paradox says that if you concentrate on resource efficiency, you will introduce extra work to handle the above work. Thus you will be always busy, and it will seem like you are very efficient. But you're not, you're not even being resource efficient, because you're not actually adding value to flow units when you're handling these superfluous issues.

Lean thinking
-------------
Five principles:

- specify value from the standpoint of the customer
- identify the value stream and eliminate all steps that do not add value
- make the remaining value-creating steps flow, so that the product flows smoothly towards the customer
- when the flow is established, let the customer **pull** value upstream from the next upstream activity
- when the previous step are complete, the process starts all over again to further reduce waste

The Toyota Way
--------------
Continuous improvement:

- challenge: we form a long-term vision and meet challenges with courage and creativity to realize our dreams
- kaizen: we continously improve our business operations, always striving for innovation and evolution
- genchi genbutsu: we go to the source to find the facts to make correct decisions, build consensus, and achieve goals at our best speed

Respect for people:

- respect: we respect others, make every effort to understand each other, take responsibility, and do our best to build mutual trust
- teamwork: we stimulate personal and professional growth, share the opportunities for development, and maximise individual and team performance

Toyota's 14 principles:

1. Base your management decisions on a long-term philosophy, even at the expense of short-term financial goals
2. Create cont. process flow to bring problems to the surface
3. Use 'pull' systems to avoid overproduction
4. Level out the workload
5. Don't build faulty product: stop the process if necessary to fix problems in order to get the quality right the first time
6. Standardise tasks and processes for cont. improvement and for employee empowerment
7. Use visual control so that no problems are hidden
8. Use only reliable, tested technology that serves your people and processes
9. Grow leaders who understand the work, live the philosophy, and teach it to others
10. Develop exceptional people and teams that follow the company's philosophy
11. Respect your partners and suppliers by challenging them and helping them improve
12. Go and see with your own eyes in order to understand the situation properly
13. Make decisions slowly by consensus, and implement decisions rapidly (I don't like this)
14. Become a learning organization through reflection and cont. improvement

Value pyramid
-------------
- values: how an organization should behave
- principles: how an organization should think (just-in-time, jidoka)
- methods: what an organization should do
- tools and activities: what an organization should have

Links
-----
A reall good Harvard Business Review article about the Toyota Production System:

http://www.clinicalmicrosystem.org/assets/toolkits/getting_started/decoding_dna.pdf

http://en.wikipedia.org/wiki/Toyota_Production_System  
http://en.wikipedia.org/wiki/Autonomation
