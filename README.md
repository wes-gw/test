# The Glasswing Platform

### Table of Content
* [Overview](#overview)
* [Data](#data)
  + [Talent Data](#talent-data)
    - [Goals](#goals)
    - [Pipelines](#pipelines)
    - [Challenges](#challenges)
  + [Company Data](#company-data)
    - [Goals](#goals-2)
  + [News Data](#twitter-api)
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
[Full Documentation](TalentData.md)

### Goals
- Search database for people and talent based on specific parameters and needs from Glasswing and/or its portfolio companies
- Make the search relevant and seamless by adding appropriate labels and notes to people
- Collect data from different sources, de-dup it and correct data to have the most correct version

### Pipelines

- Background and career Information for people who may be of interest to Glasswing’s portfolio companies. Data will be collected from public sources (such as LinkedIn, CrunchBase, AngelList, and potentially others), as well as from private sources (e.g., talent form on the Glasswing Web site, notes from Glasswing staff)
- Background and career information for LPs, VCs, and entrepreneurs whom we email and invite to events from MailChimp, Event Kingdom, and Affinity
- Information about people/connections we meet in-person (Names, phones, emails etc.). We will complement that data with LinkedIn data as mention above in (i)

#### LinkedIn
*Download Glasswing Employee's LinkedIn connections*

LinkedIn is notoriously difficult to scrape. A scraper can't simply scrapes an LinkedIn account's connections, but the user of an account can [download a list of connections](https://www.linkedin.com/help/linkedin/answer/50191/accessing-your-account-data?lang=en). Connections in the download will only contain name, most current job title, and most current company. This is not ideal because important search parameters such as location and years of experience are missing.

*Scrape detailed data from the connections*

To scrape a LinkedIn profile we need its profile url. Using the download mentioned above, we can scrape the urls based on name and job title. Reference here for the url scraping script.

The most reliable way we have found to scrape LinkedIn profiles is PhantomBuster. PhantomBuster is a tool that takes linkedIn session ids and performs automation on the behalf of the account. Glasswing has a premium PhantomBuster account, which has an hour execution time a day. With a LinkedIn premium account, we are able to obtain 130-150 profiles a day safely. This method is not risk free, the linkedIn account might get banned but under 150 profiles has been safe so far. If the linkedIn account is not premium, the number should be lowered to under 50/day. After configuring a session id, a list of linkedIn urls, and the frequency of scraping, it will automatically run on their servers. The result is a JSON and CSV file. The json file contains the full data, which includes most of the information found in a profile (location, all past jobs, durations, etc.)

Session cookie resets every-time you re-login. Fake LinkedIn accounts were created to scrape in parallel. More can be created to increase the scraping speed and they need to have believable details and connections. (Reasonable amount of LinkedIn connections, has full job history, etc.)

*Process scraped data*

The JSON files are parsed and turned into multiple CSVs, matching the SQL database schema. Reference here for the code.

#### Talent Tracker Form
The Talent Tracker Form is a web form designed to live on our website enabling website visitors and key potential hires to sign up into our talent database directly. The form has been carefully designed based on our information requirements. The website launched on May 15th, and ever since the form has been live.

The form is built on the website 123formbuilder.com and embed on the website through the same website. The form is connected to the talent tracker form database Airtable databases using the integration tool Zapier. 

*Maintenance*: If Sarah or anyone at Glasswing would like any changes to the form you could directly edit it on 123formbuilder.com and publish it, after any sort of change to the form the entire Zapier integration steps must be redone, and the website must be checked to make sure the form has changed over there as well.

*Next Steps*: Since we moved from Airtable to SQL database, we need to build a connector that ingests new entries into our SQL database using their webhook.

#### CrunchBase
The CrunchBase database also has over a million people profiles, including corporate executives, investors, and Entrepreneurs. Although the profiles are not as comprehensive as LinkedIn, they offer a wide range of people in the tech/business world that could potentially be of use to Glasswing or our modeling experiments.

From the CrunchBase API, we exported all of the people's data and transformed them matching our SQL database schema. They were also de-duped with our LinkedIn data, since there were overlaps. (Expand on the du-dups)

#### Affinity
Affinity is our CRM and automatically aggregated from our Glasswing email and calendar interactions. Users can export all of our connections from Affinity along with most related data. Some key data such as connection strength are unavailable to export. The API is also available for direct reads and writes to our data. 

(Expand on if we du-dup or have a process to ingest data into our SQL database)

### Problems & Challenges

- How do we keep the database up to date?

    Since we can only scrape 150 profiles/day, frequently checking updates is not feasible. One way is to potentially get the average amount of times that people stay in a job and predict who is likely to switch a new job. 

- People know their LinkedIn connections on a different level. How can we effectively label connections strength?

    When there is a search request, we send the results to their connection owners to ask how well they know those connections. The results are logged into the database. Perhaps there can be an automatic process for people to label their connections. (Note that Affinity has connection strength but do not allow users to export that piece of data)  

- Overlaps exist amongst the multiple sources, how do we identify and merge duplicate profiles?

    One way we have used is to group duplicates based on their LinkedIn profile urls. Note that a user can change their LinkedIn profile url, so there can be discrepancies.

- Classifying job titles based on a defined taxonomy.

    Companies have different definitions and titles for job functions. Seniority might vary as well depending on the company or industry. For better querying results, we need to standardized job function and seniority. Some manual labeling work and auto classifying were done, and can be continued. 

- The SQL database require writing queries, what is the best way to build a front-end so users can search by specifying parameters?

    Currently we are experimenting R shiny ..

- Using existing solution from our portfolio companies.

    AskFora is a portfolio company that helps people hire people based on data they aggregate automatically. There is an ongoing conversation with Omer (the founder) to use their platform for our talent use cases. It's an app that aggregates multiple sources of publicly available information about people and adds searching capabilities on job experience/expertise. Google Datastore and Big Query are used for their back-end, which can become one of the data enrichment channels for Glasswing's talent data content and their app itself can also be a viable solution. Refer to the documents on box for more details and their API and data architecture.

## Company Data
The company database originally started solely as the machine learning database. We accumulated multitudes of datasets from various sources for our modeling experiments. A single database became important to store data in one place with data pipelines that can update and track changes with timestamps automatically. After multiple iterations, we built it using Postgres SQL and deployed to Google's Cloud SQL. In addition to tracking startups for our modeling, we expanded the database to track startups in our deal flow pipeline and our portfolio companies.
[Full Documentation]()

### Goals

- Use company historical data to research models which predict company & investment success. This includes predicting the ability to raise the next financing round, IPO, or M&A
- The ultimate aim is to use such models to determine the attractiveness of investment prospects
- Record relevant information as deals move down or out the pipeline in accordance with GW decisions
- Record operational information about portfolio companies to enable the development of models which can monitor operational variables (burn rate, staffing, bug rates etc.) and anticipate issues, and help monitor the performance of portfolio companies.

### Sources & Pipeline

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

## News Data
The media covers startups daily and startups also releases numerous press releases.  The topics range from funding events to product launches. The information in the text articles is potentially a rich complement to our structured datasets. Articles are timestamped and can contain useful signals for our modeling experiments. We built a pipeline that uses Feedly to extract articles that mention the companies that we are tracking. 
[Full Documentation]()

### Goals

- Accumulate startup news articles and associate them with the startups that we are tracking in our database
- The full text of the articles along with published data are stored in the database

### Data & Sources

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
