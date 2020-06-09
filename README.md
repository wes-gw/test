# The Glasswing Platform

### Table of Content
* [Overview](#overview)
* [Maintaining Documentation](#maintaining-documentation)
* [Use Cases](#use-cases)
* [Requirements](#requirements)
* [Data](#data)
  + [Talent Data](#talent-data)
  + [Company Data](#company-data)
  + [News Data](#news-data)
  + [Deduplication](#deduplication)
* [Database](#database)
  + [Database Design](#database-design)
  + [Google Cloud SQL](#google-cloud-sql)
* [Front End](#front-end)
* [Modeling](#modeling)
  + [Predictive Modeling]()
    - [Dataset](#dataset)
    - [Baselines](#baselines)
    - [Modeling Experiements](#modeling-experiements)
  + [Language Modeling](language-modeling)
* [Workflows](#workflows)
  + [Pre-Series A Reporting](#pre-series-a-reporting)
  + [Portfolio Support](#portfolio-support)
  + [Dealflow-tracker](#portfolio-support)
  + [Talent-tracker](#portfolio-support)
  + [Exit-tracker](#exit-tracker)
* [Other Projects](#other-projects)
  + [Affinity Mailchimp](#affinity-mailchimp)
  + [New Startup Detector](#new-startup-detector)
  + [AI Index](#ai-index)
* [Risks](#risks)
* [Development Roadmap](#development-roadmap)
* [Appendix](#appendix)
  + [List of Systems](#list-of-systems)

    
# Overview
The goal of this platform is to build a data platform which will enable Glasswing Ventures (“Glasswing”) to store, manage, and use a variety of proprietary information (“content”) in support of a broad range of investing and management decisions. The platform will assist Glasswing on multiple facets, including fundraising, portfolio support (both with recruiting talent and customers) & monitoring, deal sourcing, screening & diligence, as well as marketing and raising brand awareness

Originally we developed multiple projects to support different purposes. After multiple iterations, we defined our overall goal and strategy for leveraging data. Naturally, we consolidated those projects into a single platform, known as the Glasswing Platform. This wiki hosts our current and historical documentations. 

Download the [Glasswing Platform Design Document]() as a Word document.

<br>
<br>

# [Maintaining Documentation](Documentations/Maintaining&#32;Documentation.md)
The documentation in this repository serves as the central knowledge base, written in Markdown format. Github provides robust features for versioning, structure, and reference between documentation and code. Clear documentation fosters clear development. Hosting our documentation on Github will help us centralize information while enforcing best practices. This section details how to update and maintain documentation following best practices.  

<br>
<br>

# Data
The data content we collect and store can be divided up to four sections: Talent, Company, News, and Twitter. For each section, we describe the goal of data collection, the sources and pipelines, and the related challenges. Since data from different sources are all aggregated and stored in a single SQL Database, we also define our process for data deduplication.

## [Talent Data](Documentations/Data/Talent&#32;Data.md)
The talent data stem from the Talent Database project. The Talent Database project started as a separate project - a database of people in the Glasswing network from LinkedIn connections. Originally the people data was in Airtable as a separate database. To accommodate the complexity of the dataset, we consolidated the data into our cloud SQL database.

## [Company Data](Company&#32;Data.md)
We accumulated multitudes of datasets from various sources for our modeling experiments to predict startup success. To centralize data storage and allow data pipelines to track updates dynamically, we set out to build a machine learning database. We evaluated different solutions and went through multiple iterations. Utlimately, we consolidted the data with all of our other data into our single SQL database as the Glasswing platform to service a variety of requests. 

## [News Data](data_news_data.md)
To supplement our data set for modeling experiments, we turned to the media. The media publishes articles frequently and cover a variety of startups. Startups also issues press releases to announce updates such as funding, product launches, and partnership announcements. The narrative and semantics can embed some useful signals about startups. We built a pipeline that extract and store startup articles in our database. Using natural language models, we can potentially understand what startups are being covered in news, how are they being talked about, or related sentiment. Ultimately the data might be of use to our modeling experiments. 

## [Twitter](data_twitter_data.md)
Twitter is a active platform for startups, investors, and thougt leaders. Most startups have a twitter account and we can potentially use natural language models to uncover more insights from startups' tweets or tweets mentioning startups.

<br>
<br>

# [Requirements](database_requirements.md)
We hope to store the people, company, and deal information in a unified infrastructure, each of these three data categories will have their own schema. The data will be interconnected across the categories in various ways (e.g., the company’s dataset will refer to staff in the people set), but the categories will be in standalone forms. For more a more detailed view, refer to the schema shown in the [UML]().
<br>
<br>
# Use Cases
We documented all use cases for our platform and the types of users. For each use cases we also indiciates the relevent workflow and whose responsibility they fall under.


<br>
<br>

# Database
The database is the cloud SQL database that host all of our data for the Glasswing Platform. 
We designed the database to accomadate as many requirements as possible. After evaluating different options,  we developed it using Postgres SQL and deployed it to Google Cloud SQL. The documentation contains our design, structure, schema, and analysis of the different options. The use cases and requirements of the Glasswing Platform are also included in this section. 

## [Database Design](Documentations/Database/Database&#32;Design.md)
To accommodate our most of our use cases and requirements, we evaluated multiple designs and tested different NoSQL and SQL databases. Ultimately, we landed on Postgres SQL. Our design revolved around the most difficult feature requirement: Timestamp Tracking. The structure is designed in a way that would track updates with timestamps instead of simply overwriting data. In this section, we document the structure and schema of our database, as well as the reasons behind design decisions. 

## [Google Cloud SQL]()
After evaluating different services for cloud databases, we ultimately landed on Google Cloud SQL. Google Cloud Platform offers a robust set of services for Cloud Machine Learning beyond data base and data storage. As we expand our ML application, having our application in GCP ecosystem will be valuable. In this section, we provide information on how to connect and maintain Google Cloud SQL with all relevant documentations.

<br>
<br>

# Front End
- Need to define requirements and goals (who will use it)
- Analysis comparing building, and BI tools
- Documented Experiemented with R shiny

<br>
<br>

# Modeling (need update)
The overall aim of this project was to leverage data science and machine learning to predict founder and startup success. The target variable for the project is created based on whether a startup can successfully raise a “Series A” funding round (“Opportunity Qualification”). Using data from CrunchBase Pro, we acquired a 2013 snapshot of data which we cleaned and visualized. After performing a review of relevant literature, we created a feature set for the prediction of startup success, which we defined as series A funding. Using this manufactured feature set, which included some features provided by CrunchBase, as well as novel features, we performed several machine learning and deep learning experiments. These experiments were performed after a cleaned company set had been split into train and test sets. Using F1 scores for both classes as the evaluation metrics, we determined the optimal neural network configuration for success identification given our parameters, as well as important features of a successful startup company.

<br>
<br>

## [Predictive Modeling]()
### Dataset
### Baselines
### Modeling Experiements
## Language Modeling

# Current Workflows
## Pre-Series A Reporting
## New Startup Notification  
## AI Index

# Other Projects
## Affinity Mailchimp
## New Startup Notification  
## AI Index

# Risks
# Appendix
## List of Systems
- Airtable
- AskFora
- Box
- CrunchBase
- Feedly
- Google Cloud Product
    - Google Cloud SQL
    - Goolge Colaboratory
    - Google Drive
- Github
- LinkedIn
- PostgreSQL
- PhantomBuster
- PythonAnyWhere
- Zapier
- 123FormBuilder


# Development Roadmap
The development roadmap provides a development history, as well as a list of outstanding tasks and next steps. Use the roadmap to track our development process and set pirorities. This should be frequently updated as we push updates. At the end of each week, we should update our progress on [here](development_roadmap.md). 

