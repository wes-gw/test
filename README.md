# The Glasswing Platform

### Table of Content
- [Overview](#overview)
  * [Development Tools](#development-tools)
    + [PostgreSQL](#postgresql)
  * [Data Sources](#data-sources)
    + [CrunchBase API](#crunchbase-api)
    + [Feedly API](#feedly-api)
    + [Twitter API](#twitter-api)
    + [LinkedIn](#linkedin)
    + [Affinity API](#affinity-api)
- [Development Roadmap](#development-roadmap)
- [Database Design](#database-design)
    + [Database Structure](#database-structure)
    + [Data Flow](#data-flow)
    + [Data Collection Process](#data-collection-process)
- [Notebooks](#notebooks)

# Overview
The goal of this platform is to build a data platform which will enable Glasswing Ventures (“Glasswing”) to store, manage, and use a variety of proprietary information (“content”) in support of a broad range of investing and management decisions. The platform will assist Glasswing on multiple facets, including fundraising, portfolio support (both with recruiting talent and customers) & monitoring, deal sourcing, screening & diligence, as well as marketing and raising brand awareness

Originally there were multiple projects supporting different purposes, and most of them have gone through iterations. The platform is defined as a central data platform that consolidates all of those projects.  This wiki will host current and historical documentations on all related projects. 

Reference here for the [full design document]() on the platform.

# Data Pipelines

## Talent Data
The Talent Database project started as a separate project: to build a database of people in the Glasswing network from LinkedIn connections. Originally the people data are in Airtable as a separate database. Reference here for documentation on the first version of the project. To accommodate the complexity of the dataset, we consolidated the data into a cloud SQL database along with other data for other projects. Although the project started based on Linked connections, we are expanding our sources. 

## Company Data
The company database originally started solely as the machine learning database. We accumulated multitudes of datasets from various sources for our modeling experiments. A single database became important to store data in one place with data pipelines that can update and track changes with timestamps automatically. After multiple iterations, we built it using Postgres SQL and deployed to Google's Cloud SQL. In addition to tracking startups for our modeling, we expanded the database to track startups in our deal flow pipeline and our portfolio companies.

## News Data
The media covers startups daily and startups also releases numerous press releases.  The topics range from funding events to product launches. The information in the text articles is potentially a rich complement to our structured datasets. Articles are timestamped and can contain useful signals for our modeling experiments. We built a pipeline that uses Feedly to extract articles that mention the companies that we are tracking. 

# Database
The database is the cloud SQL database that host all of our data for the Glasswing Platform (People data, Company data, and news data). It was developed using Postgres SQL and deployed to Google Cloud SQL. Originally projects related to people and company data were stored differently, but we have consolidated the original company database attributes schema with our people database into a single database that can support different uses. 
