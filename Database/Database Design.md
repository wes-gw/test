# Background

Originally two separate datasets ([Talent Data]() and [Company Data]()) required two separate databases. 

The talent data required a database to query people given parameters such as job function, seniority, company name, etc. Suppose each person is a row in a table and the attributes are fields.  Each person can also have multiple job experiences. The dimension of the table is then defined by the person with the most number of job experiences. Each job experience has attributes such as company name, job function, start and end date, etc. The dimension of the table would be too big and needs to increase every time there is a new person with a higher number of job experiences. NoSQL or SQL databases are much better fit than a single table database such as Air table. 

The machine learning database were designed to hold a variety of attributes about companies. The most important and hardest function is to store updates with timestamps instead of overwriting the old data. For predictive modeling experiments we need a snapshot of the dataset for a specified time. If a company updates its location from Boston to San Fransisco on 08-01-2019, we should be able to retrieve the location as Boston when specifying a date before 08-01-2019. Data providers such as PitchBook and CrunchBase simply overwrite data, which was why built the database to track updates ourselves. 

Schematic overlaps exists between the two datasets . We are tracking where people worked in the talent dataset. For the company dataset, we are also tracking who worked at the companies. Note that the talent database is essentially a subset of the company dataset. The company dataset includes companies from CrunchBase and their people whereas the talent data dataset only pertains to Glasswing related people. The company dataset is a broader dataset. 

# Design

A single database that serve as the source of truth for data is a ideal design. All data are combined into a single schema that are designed to accommodate all data structures and relationships. On the high level, there are three major factors:

- Schema of the talent dataset
    - A person can have attributes such as name, location, and job experiences
    - A job experience contains attributes such as company name, job function, duration, seniority, etc.
- Schema of the CrunchBase dataset
    - A company can contain multiple people on the team
    - A company can have multiple funding events
    - A funding event can have attributes such as amount, type, and date. It can also relationships such as investors.
- Timestamp updates
    - Provide the ability to store updates without overwriting older entries.

- Full list of Required Attributes
    - Company Attributes
    - Talent Attributes
- Full list of use cases and feature requirements

We document the design of our database using a schema UML and versioned and timestamped Data Document Language file. The schema UML details presents a graphical representations of all the tables, fields, and relationships. The data document language file provides the SQL script that creates  the entire database, detailing all tables, fields, data types, and relationships. Each table represent an object and the three major ones are companies, people, and funding events. Each table contains attributes and reference to their related tables, detailed in the UML and DDL. Filtering certain types of companies or people based on specified attributes is straight forward in a SQL database. In order to query for a snapshot of companies give a specific date, we can not overwrite data during an update. For fields that we care about track history, such as location and funding event, we need to have a separate many-to-many table to track all the historical changes. Suppose "Startup A"  in the companies table has the value "50-100". Before 2019-10-20 the value was "10-50". The employee_count table exists to keep track of the changes and we can find there there are two entries referencing "Startup A". An entry with the value "10-50" dated 2019-8-1 and an entry with the value "50-100" dated 2019-10-20. If the company size is updated to "100-150" on 2019-9-20, a new entry would be inserted. The employee_count also has a field named current to mark the most recent data as True, all historical data is marked as False. The companies table also keeps the most recent data. We implemented the design pattern for all the fields. There are some exceptions. Company email and phone numbers change don't need to be tracked into a separate table since those attributes likely do not contain any signals in modeling.
