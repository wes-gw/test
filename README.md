# The Glasswing Platform

### Table of Content
* [Overview](#overview)
* [Data](#data)
  + [Talent Data](#talent-data)
  + [Company Data](#company-data)
  + [News Data](#news-data)
    - [Goals](#goals-3)
  + [Deduplication](#deduplication)
* [Database](#database)
  + [Database Design](#database-design)
  + [Google Cloud SQL](#google-cloud-sql)
* [Modeling](#modeling)
  + [Database Design](#database-design)
  + [Google Cloud SQL](#google-cloud-sql)
* [Workflows](#workflows)
  + [Database Design](#database-design)
  + [Google Cloud SQL](#google-cloud-sql)
    
# Overview
The goal of this platform is to build a data platform which will enable Glasswing Ventures (“Glasswing”) to store, manage, and use a variety of proprietary information (“content”) in support of a broad range of investing and management decisions. The platform will assist Glasswing on multiple facets, including fundraising, portfolio support (both with recruiting talent and customers) & monitoring, deal sourcing, screening & diligence, as well as marketing and raising brand awareness

Originally there were multiple projects supporting different purposes, and most of them have gone through iterations. The platform is defined as a central data platform that consolidates all of those projects.  This wiki will host current and historical documentations on all related projects. 

Reference here for the [full design document](PlatformDesign.md) on the platform.

# Data

## Talent Data
The Talent Database project started as a separate project: to build a database of people in the Glasswing network from LinkedIn connections. Originally the people data are in Airtable as a separate database. Reference here for documentation on the first version of the project. To accommodate the complexity of the dataset, we consolidated the data into a cloud SQL database along with other data for other projects. Although the project started based on Linked connections, we are expanding our sources.
[Full Documentation](data_talent_data.md)


## Company Data
The company database originally started solely as the machine learning database. We accumulated multitudes of datasets from various sources for our modeling experiments. A single database became important to store data in one place with data pipelines that can update and track changes with timestamps automatically. After multiple iterations, we built it using Postgres SQL and deployed to Google's Cloud SQL. In addition to tracking startups for our modeling, we expanded the database to track startups in our deal flow pipeline and our portfolio companies.
[Full Documentation]()

### Goals

- Use company historical data to research models which predict company & investment success. This includes predicting the ability to raise the next financing round, IPO, or M&A
- The ultimate aim is to use such models to determine the attractiveness of investment prospects
- Record relevant information as deals move down or out the pipeline in accordance with GW decisions
- Record operational information about portfolio companies to enable the development of models which can monitor operational variables (burn rate, staffing, bug rates etc.) and anticipate issues, and help monitor the performance of portfolio companies.

### Pipeline

- Information about companies, investors, and people from CrunchBase and/or other investment-focused public sources, filings, relevant press, private sources including Glasswing’s own assessments to create company histories detailed in the Appendix; Note that the research data can include portfolio or deal flow companies (3.2.2 below)
- Semi-automatically extract data for the database from various sources
- Enrich the dataset by scraping other sources such as SEC filings and news
- Manually enter attributes about companies
- De-duplicate and correct conflicting data
- In addition to the data portion in section 3.2.1 b), record due diligence work created such as one-pagers, term sheets, and investment memos'
- Include information in Affinity: source of introduction, relationship to Glasswing, email and meeting actives, etc.
- Include a form that pipeline companies will fill out upon meeting with any of the Glasswing members

#### CrunchBase

The foundation of our data comes from CrunchBase, which include organizations from startups to investors, funding rounds, etc. An August 2019 snapshot was processed and stored into our database. We identified and marked a list of Pre-Series A companies in our databas for tracking timestamps on updates. Changes overtime in startups are important when it comes to the dataset for modeling, so the pipeline we built automatically updates and add new entries to our database regularly. Only Pre-Series A companies are updated, but perhaps we can apply the updates to all startups in the database to all data up-to-date.

From CrunchBase we were able to obtain 921k people's CrunchBase profiles, however LinkedIn by far has the most comprehensive data on people. There are serious limitations when it comes to acquiring data from LinkedIn, and we have an ongoing process in scraping LinkedIn for our Talent Database Project. There are two steps of actions here:

- Migrate data from Talent Database Project into here
    - The Talent Database Project contains all of the Glasswing's LinkedIn connections, which most certainly overlaps with the 921k people we have from CrunchBase.
    - Airtable, was originally used for the Talent Database Project, which can't accomadte the data we scraped from LinkedIn. This database however, is built to accomadate all of LinkedIn's data with timestamped updates.
    - We need to match and dedup the 2 sets of people data; they can potentially be matched by linkedin urls. People from the Talent Database Project will be stored in this database marked as in Glasswing Network so we retain all of the features from the Talent Database Project.
    - Refer to [Talent Database Project Github](https://github.com/kleida-martiro/gw_db/blob/master/company_database) for more details
- Explore ways to use scraping methods from the Talent Database to scrape people profiles from CrunchBase

*Note: LinkedIn also has the most accurate number on the size of companies, which can be a good indicator for growth overtime. SourceSrub, offers that as a metrics and they are able to obtain the numbers by hiring cheap labor to manually check and record the number of employees regularly*

#### Deal Tracker form
#### Affinity
#### Craft

## News Data
The media covers startups daily and startups also releases numerous press releases.  The topics range from funding events to product launches. The information in the text articles is potentially a rich complement to our structured datasets. Articles are timestamped and can contain useful signals for our modeling experiments. We built a pipeline that uses Feedly to extract articles that mention the companies that we are tracking. 
[Full Documentation]()


- Accumulate startup news articles and associate them with the startups that we are tracking in our database
- The full text of the articles along with published data are stored in the database


*Feedly API**

Feedly is a news aggregator that pulls and stores articles from websites' RSS Feeds. User can create a feed that includes multiple news publications and use the API to load articles from the feed stream. The API only allows you to pull articles from a feed by chronological order. For example, if you specify 1000 articles, it will pull the most recent 1000 articles despite the sources. Since most publications don't solely publish  articles about early stage startups, the feed include a significant amount of noise. 

The current list of new sources are the following:

- VentureBeat
- CrunchBase News
- TechCrunch
- Fast Company
- Forbes
- Cision PRWeb
- Inc.com
- ZDNet
- SaaStr
- Mashable
- MIT Technology REview
- Business Insider
- Fortune
- Venture Capital Access Online
- Xconomy
- Business wire

Fortunately, Feedly’s non-developer token does not have a limit when requesting all articles out of a Feed. We can create a feed with the desired sites and pull all historical articles from those sites. In practice, the API timed out after pulling 2.5 million articles, which became our initial data set. Currently a developer token is sufficient to extract relevant articles on a daily basis. 

*Scraping Articles*

The majority of the articles do not contain the full HTML content. We built a scraper to scrape the body of the content using the BeautifulSoup package. Given any URL, the scraper estimates which HTML tags contain the primary body text based on HTML tags and word counts.  

*Associate articles with companies*

Articles are not guaranteed to be relevant as they still can contain a wide range of topics. The goal is to associate each article with a company if the article covers a company. We define the association based on if an article contains a link to a company’s domain, we associate the article with that company. We can adjust the definition in the code by adding more criteria.

*Process data and insert into the database*

The data is processed and the HTML are parsed using BeautifulSoup. In the forms of data frames, they are inserted into the database.

# Database
The database is the cloud SQL database that host all of our data for the Glasswing Platform (People data, Company data, and news data). It was developed using Postgres SQL and deployed to Google Cloud SQL. Originally projects related to people and company data were stored differently, but we have consolidated the original company database attributes schema with our people database into a single database that can support different uses. 
[Full Documentation]()
