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
[Full Documentation](data_company_data.md)


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
