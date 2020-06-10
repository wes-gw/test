# Overview
Our datbase store the people, company, deal information, and news articles in a unified infrastructure. The data are interconnected across the categories in various ways (e.g., the company’s dataset will refer to staff in the people set). We decoupled requirements of the database and UI to make development objectives clearer. Each feature below will indicate if it applies to the back-end, front-end, or both.  

# Glossary
General
- [x]  [Search](#search)
- [x]  [Filter and Sort](#filter-and-sort)
- [ ]  [Tag](#tag) - In Progress
- [x]  [Export](#export)
- [x]  [Import and Edit](#import-and-edit)
- [x]  [Timestamp Tracking and Version control](#timestamp-tracking-and-version-control)
- [x]  [Add notes](#add-notes)
- [ ]  [Visualization(Need Better Defination](#visualization) - Not Started
- [x]  [Lists](#lists)
- [ ]  [Dynamic](#dynamic)- In Progress
- [x]  [Back up](#back-up)
- [x]  [Compare](#compare)
- [ ]  [Integration](#integration) - In Progress
- [x]  [Access Control](#access-control)

Features applied specifically to talent data
- [ ]  [Tier Level](#tier-level) - In Progress
- [ ]  [Email notification](#email-notification) - Not Started
- [ ]  [Email and Business Card Reader](#email-and-business-card-reader) - Not Started
- [ ]  [LinkedIn Profile Extraction](#linkedin-profile-extraction) - In Progress

Features applied specifically to company data
- [ ]  [Automated sourcing list](#automated-sourcing-list) - Not Started
- [ ]  [Startup success score](#startup-sucess-score) - Not Started
- [ ]  [Fall off rate](#fall-off-rate) - Not Started

# General
## Search
|Feature|Search|
| --- | --- |
|Description|Provide the ability to search over the structured and unstructured data for all attributes, news, characteristics etc. The search will be able to take explicit arguments in a logical expression only. for structured data.|
|Purpose|Allow users to quickly search lists of people or companies by key words|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|

## Filter and Sort
|Feature|Filter and Sort|
| --- | --- |
|Description|Ability to filter and sort, even within a specific search criteria by attributes existing in the structured data format, such as name, last name, function, title, company, location, seniority, education, industry, size of company, deal type, round, partner association, year founded, total funding amount, last contacted (via email, phone and/or in person), source of introduction, event introductions, information incoming source etc.|
|Purpose|Help users to identify talent and customers for portfolio support, industry experts for due diligence, important people to develop and strength relationships with through emails and events|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|

## Tag
|Feature|Tag|
| --- | --- |
|Description|Ability to tag by a pre-determined category of tags in a drop-down form, including marketing event, newsletter emailing list, limitation (geography), tier (relationship strength). Marketing will only be able to add tags related to events and email lists. Data team will have control and access to everything. No arbitrary tags are allowed, unless decided by the data team. Should keep track of changes by date, time and person’s email.|
|Purpose|Allow users to augment the database with information collected to track attributes about talent and customers for portfolio support, industry experts for due diligence, important people to develop and strength relationships|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|
|Comments|This is possible by defining data types for a specific field. The categories of tags are not yet defined and implemented.|

## Export
|Feature|Export|
| --- | --- |
|Description|Ability to export lists and query results with all available fields.|
|Purpose|Query results can be exported to csv and printed out as final form of deliverables.|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|

## Import and Edit
|Feature|Import and Edit|
| --- | --- |
|Description|Ability to import one entry or lists of people and companies pertaining any of the information below: first name, last name, function, title, company name, company address, geographic location, size of company, personnel data, financing events, personnel seniority, industry, deal type, round, partner association, year founded, total funding amount, last contacted (via email, phone and/or in person), source of introduction, event introduction, competitive market intelligence information and/or other relevant news events, social media accounts/links, etc. Information about existing records can also be edited.|
|Purpose|Enrich the database as we encounter more people and companies of interest|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|

## Timestamp Tracking and Version control
|Feature|Import and Edit|
| --- | --- |
|Description|Ability to track when data is changed. Given a timestamp, snapshot of data can be viewed or exported according to that timestamp. In the backend, every change will be logged with a timestamp. |
|Purpose|To create snapshots of datasets for predictive modeling and have Version control as multiple users can write to the database. |
|Required|Back-end|
|Status|Back-end: Fulfilled|
|Notes| When an admin commits changes, it will be logged automatically as part of the database log. This is helpful for monotring and backup purposes, but not useful for analytics such as retreiving an old snapshot of the database. We built the database in ways that logs updates with timestamps without erasing older data. To retrieve a snapshot for an older date, one would need to write the SQL queries to specify the fields and filter by their date criteria.|


## Add Notes
|Feature|Add Notes|
| --- | --- |
|Description|Ability to add notes/comments that are searchable |
|Purpose|Help users to log accumulated information about people and companies we encounter for future reference|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|

## Visualization (Need better defination)
|Feature|Visualization|
| --- | --- |
|Description|Ability to track our network - most/least connections, companies, geographies of interest, functions, seniority, etc. Can be an integration with current CRMs or new vendors, such as PeriscopeData. Can generate simple line graphs from timestamp data.|
|Purpose|To better consume the wealth of information existing in the database|
|Required|Front-end|
|Status|Not Started|
|Comments|What kind of visualizations do we need specifically? We can create them as long as the data are there. BI tools also work with SQL. We can experiement by plugging into Power BI(Free).|

## Lists
|Feature|Lists|
| --- | --- |
|Description|Be able to create lists of people, companies and entities of interest, etc.|
|Purpose|Help group and categorize people and companies for purposes such as tracking prospective LPs|
|Required|Back-end & Front-end|
|Status|Back-end: Fulfilled, Front-end: Not Started|
|Comments|Once can create a table referecing the IDs of desired items.|

## Dynamic 
|Feature|Dynamic|
| --- | --- |
|Description|Ability to keep data up to date from sources. Automatically check LinkedIn accounts, CRM/marketing platforms, CrunchBase, news, etc. periodically. Phone call/email/text, and other communications can also be logged manually.|
|Purpose|Having the most accurate information to identifying talent and customers for portfolio support, industry experts for due diligence, important people to develop and strength relationships. Also, to track companies’ milestones for predictive modeling|
|Required|Back-end & Front-end|
|Status|Back-end: In progress, Front-end: Not Started|
|Comments|The pipeline for CrunchBase and News aritcles are complete. We need to expand the pipeline for other sources.|

## Back up
|Feature|Back up|
| --- | --- |
|Description|Backup database snapshot, 24-hour interval|
|Purpose|Not to lose data and work|
|Required|Back-end|
|Status|Fulfilled|
|Comments|Cloud SQL automatically backs up the database in the cloud.|

# Compare 
|Feature|Compare|
| --- | --- |
|Description|Be able to compare lists of tags, people, companies |
|Purpose|To create a better sense of comparing candidates, people, companies, deals etc.|
|Required|Front-end (Nice to Have)|
|Status|Front-end: Not Started|
|Comments|SQL queries can retrieve different lists based on filter criterias.|

## Integration  
|Feature|Integration|
| --- | --- |
|Description|Ability to integrate with current CRM, marketing platform etc. by reading and writing to these third-party platforms. The existing platforms may be bound to change|
|Purpose|To create an eco-system of our data and be able to track, record, and draw insights from a collective, systemized and integrated database |
|Required|Back-end|
|Status|Not Started|
|Comments|It is not yet clear what how the platforms should communicate. We need to define the [data flow between systems]().|

## Access Control  
|Feature|Access Control|
| --- | --- |
|Description|Different users will have different access privileges|
|Purpose|Control access to potentially sensitive information|
|Required|Back-end & Front-end|
|Status|Back-end: Yes, Front-end: Not Started|
|Comments|The privileges for different users have yet to be defined, but it is a feature of Google Cloud SQL.|


# Features applied specifically to talent data 
## Tier Level
|Feature|Tier Level|
| --- | --- |
|Description|Develop a score or tiers based on overall communication via email, phone, text, in-person, number of overall communications, number of referrals, level of first and second connections, etc.|
|Purpose|Help to identify which person we are close enough to reach out to and which ones we should strengthen or develop relationships with. |
|Required|Back-end & Front-end|
|Status|Back-end: In Progress, Front-end: Not Started|
|Comments|The feature of labeling people with their tier level is there (as a field in the table). The current process is to have the connection owner rate how well they know the person and we manually enter the data. [Here]() is the current defination of tiers. There is no automatic way of deriving from overall communications yet. The closet we have is Affinity's connection stregnth. Although Affinity's connection stregnth is derived from email and calendar, that piece of data is not available through API or CSV exports.|

## Email Notification 
|Feature|Tier Level|
| --- | --- |
|Description|Alert stakeholders via email for requests coming from the Glasswing website ([Talent tracker form]()) AND companies requesting new hires|
|Purpose|Provide an efficient system for portfolio support and notifying our team with newly interested talents.|
|Required|Back-end|
|Status|Back-end: Not Started|

## Email and Business Card Reader
|Feature|Email and Business Card Reader|
| --- | --- | 
|Description|Ability to scrape emails and business cards and extract information (name, title, email, phone numbers, company name, title, social media profiles, etc.). The data can be ingested into the database to the corresponding contacts, and new contact is created if not already in the database.|
|Purpose|Help to keep track of new connections made automatically from emails and business cards.|
|Required|Back-end & Front-end|
|Status|Back-end: Not Started, Front-end: Not Started|

## LinkedIn Profile Extraction
|Feature|LinkedIn Profile Extraction|
| --- | --- |
|Description|Ability to automatically scape linked profile and store the profile data when a contact is entered to the database.|
|Purpose|Better leverage new connections made and to identify if a relationship need to be developed for purposes mentioned above.|
|Required|Back-end|
|Status|Back-end: In Progress|
|Comment|There is a pipeline for [scraping a linkedIn profile](), but the process is not automated yet. The process requires some manual work and it is not clear if it can be automoated in sync with the database.|

# Features applied specifically to talent company data 
## Automated Sourcing List
|Feature|Automated sourcing list|
| --- | --- |
|Description|Periodically suggests list of companies that meet our basic investment criteria|
|Purpose|Help to cover more grounds when it comes to sourcing.|
|Required|Back-end & Front-end (Nice to Have)|
|Status|Back-end: Not Started, Front-end: Not Started|
|Comment|This is a low hanging fruit. We can set up a pipeline to filter the database with defined criteria. The intergration with Affinity should be set up so we also have data on our sourcing list.|

## Startup Success Score
|Feature|Startup success score|
| --- | --- |
|Description|Develop a success score based on company’s content to understand its potential into moving down or out the pipeline|
|Purpose|To assess startup success and feed into the ML for future predictive analysis|
|Required|Back-end & Front-end|
|Status|Back-end: In Progress, Front-end: Not Started|
|Comment|Ongoing [modeling effort]().|

## Fall off Rate
|Feature|Fall off Rate|
| --- | --- |
|Description|One of the measurements of the platform should be that a lot of deals go offline and are made in person.|
|Purpose|A worthy goal would be to track at which point a deal would go offline, or people's decision making would go offline|
|Required|Back-end & Front-end (Nice to Have)|
|Status|Back-end: Not Started, Front-end: Not Started|
 
 
