# Overview
We store the people, company, deal information, and news articles in a unified infrastructure, these three data categories are stored in our database schema. The data are interconnected across the categories in various ways (e.g., the company’s dataset will refer to staff in the people set). We decoupled requirements of the database and UI to make development objectives clearer. The features and functionalities below pertain only to the database. For features and functionalities related to a UI, refer to this section.

# Glossary

- [x]  [Search](#search)
- [x]  [Filter and Sort](#filter-and-sort)
- [ ]  [Tag(WIP)](#tag) 
- [x]  [Export](#export)
- [x]  [Import and Edit](#import-and-edit)
- [x]  [Timestamp Tracking and Version control](#timestamp-tracking-and-version-control)
- [x]  [Add notes](#add-notes)
- [ ]  [Visualization(Need Better Defination](#visualization)
- [x]  [Lists](#lists)
- [ ]  [Dynamic(WIP)](#dynamic)
- [x]  [Back up](#back-up)
- [x]  [Compare](#compare)
- [ ]  [Integration](#integration)
- [x]  [Access Control](#access-control)
- [ ]  [Tier Level](#tier-level)
- [ ]  [Email notification](#email-notification)
- [ ]  [Email and Business Card Reader](#email-and-business-card-reader)
- [ ]  [LinkedIn Profile Extraction](#linkedin-profile-extraction)
- [ ]  [Automated sourcing list](#automated-sourcing-list)
- [ ]  [Startup success score](#startup-sucess-score)
- [ ]  [Fall off rate](#fall-off-rate)

# Search
|Feature|Search|
| --- | --- |
|Description|Provide the ability to search over the structured and unstructured data for all attributes, news, characteristics etc. The search will be able to take explicit arguments in a logical expression only. for structured data.|
|Purpose|Allow users to quickly search lists of people or companies by key words|
|Required|Yes|
|Status|Fulfilled|



# Filter and Sort
|Feature|Filter and Sort|
| --- | --- |
|Description|Ability to filter and sort, even within a specific search criteria by attributes existing in the structured data format, such as name, last name, function, title, company, location, seniority, education, industry, size of company, deal type, round, partner association, year founded, total funding amount, last contacted (via email, phone and/or in person), source of introduction, event introductions, information incoming source etc.|
|Purpose|Help users to identify talent and customers for portfolio support, industry experts for due diligence, important people to develop and strength relationships with through emails and events|
|Required|Yes|
|Status|Fulfilled|

# Tag
|Feature|Tag|
| --- | --- |
|Description|Ability to tag by a pre-determined category of tags in a drop-down form, including marketing event, newsletter emailing list, limitation (geography), tier (relationship strength). Marketing will only be able to add tags related to events and email lists. Data team will have control and access to everything. No arbitrary tags are allowed, unless decided by the data team. Should keep track of changes by date, time and person’s email.|
|Purpose|Allow users to augment the database with information collected to track attributes about talent and customers for portfolio support, industry experts for due diligence, important people to develop and strength relationships|
|Required|Yes|
|Status|Fulfilled|
|Comments|This is possible by defining data types for a specific field. The categories of tags are not yet defined and implemented.|


# Export
|Feature|Export|
| --- | --- |
|Description|Ability to export lists and query results with all available fields.|
|Purpose|Query results can be exported to csv and printed out as final form of deliverables.|
|Required|Yes|
|Status|Fulfilled|

# Import and Edit
|Feature|Import and Edit|
| --- | --- |
|Description|Ability to import one entry or lists of people and companies pertaining any of the information below: first name, last name, function, title, company name, company address, geographic location, size of company, personnel data, financing events, personnel seniority, industry, deal type, round, partner association, year founded, total funding amount, last contacted (via email, phone and/or in person), source of introduction, event introduction, competitive market intelligence information and/or other relevant news events, social media accounts/links, etc. Information about existing records can also be edited.|
|Purpose|Enrich the database as we encounter more people and companies of interest|
|Required|Yes|
|Status|Fulfilled|

# Timestamp Tracking and Version control
|Feature|Import and Edit|
| --- | --- |
|Description|Ability to track when data is changed. Given a timestamp, snapshot of data can be viewed or exported according to that timestamp. In the backend, every change will be logged with a timestamp. |
|Purpose|To create snapshots of datasets for predictive modeling and have Version control as multiple users can write to the database. |
|Required|Yes|
|Status|Fulfilled|
|Notes| When an admin commits changes, it will be logged automatically as part of the database log. This is helpful for monotring and backup purposes, but not useful for analytics such as retreiving an old snapshot of the database. We built the database in ways that logs updates with timestamps without erasing older data. To retrieve a snapshot for an older date, one would need to write the SQL queries to specify the fields and filter by their date criteria.|


# Add Notes
|Feature|Add Notes|
| --- | --- |
|Description|Ability to add notes/comments that are searchable |
|Purpose|Help users to log accumulated information about people and companies we encounter for future reference|
|Required|Yes|
|Status|Fulfilled|



# Visualization (Need better defination)
|Feature|Visualization|
| --- | --- |
|Description|Ability to track our network - most/least connections, companies, geographies of interest, functions, seniority, etc. Can be an integration with current CRMs or new vendors, such as PeriscopeData. Can generate simple line graphs from timestamp data.|
|Purpose|To better consume the wealth of information existing in the database|
|Required|Nice to Have|
|Status|Not Started|
|Comments|What kind of visualizations do we need specifically? We can create them as long as the data are there. BI tools also work with SQL. We can experiement by plugging into Power BI(Free).|

# Lists
|Feature|Lists|
| --- | --- |
|Description|Be able to create lists of people, companies and entities of interest, etc.|
|Purpose|Help group and categorize people and companies for purposes such as tracking prospective LPs|
|Required|Yes|
|Status|Fulfilled|
|Comments|Once can create a table referecing the IDs of desired items.|

# Dynamic 
|Feature|Dynamic|
| --- | --- |
|Description|Ability to keep data up to date from sources. Automatically check LinkedIn accounts, CRM/marketing platforms, CrunchBase, news, etc. periodically. Phone call/email/text, and other communications can also be logged manually.|
|Purpose|Having the most accurate information to identifying talent and customers for portfolio support, industry experts for due diligence, important people to develop and strength relationships. Also, to track companies’ milestones for predictive modeling|
|Required|Yes|
|Status|In progress|
|Comments|The pipeline for CrunchBase and News aritcles are complete. We need to expand the pipeline for other sources.|


# Back up
|Feature|Back up|
| --- | --- |
|Description|Backup database snapshot, 24-hour interval|
|Purpose|Not to lose data and work|
|Required|No|
|Status|Fufilled|
|Comments|Cloud SQL automatically backs up the database in the cloud.|

# Compare 
|Feature|Compare|
| --- | --- |
|Description|Be able to compare lists of tags, people, companies |
|Purpose|To create a better sense of comparing candidates, people, companies, deals etc.|
|Required|No|
|Status|Nice to Have|
|Comments|SQL queries can retrieve different lists based on filter criterias.|

# Integration  
|Feature|Integration|
| --- | --- |
|Description|Ability to integrate with current CRM, marketing platform etc. by reading and writing to these third-party platforms. The existing platforms may be bound to change|
|Purpose|To create an eco-system of our data and be able to track, record, and draw insights from a collective, systemized and integrated database |
|Required|Yes|
|Status|Not Started|
|Comments|It is not yet clear what how the platforms should communicate. We need to define the [data flow between systems]().|

# Access Control  
|Feature|Access Control|
| --- | --- |
|Description|Different users will have different access privileges|
|Purpose|Control access to potentially sensitive information|
|Required|Yes |
|Status|Fufilled|
|Comments|The privileges for different users have yet to be defined, but it is a feature of Google Cloud SQL.|
