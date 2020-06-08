# Company Data

### Table of Content
* [Overview](#overview)
* [Goals](#goals)
* [Pipeline](#pipeline)
  + [CruchBase](#crunchbase)
  + [Deal Tracker form](#deal-tracker-form)
  + [Affinity](#affinity)
  + [Craft.co](#craft)
* Challenges
    
## Overview
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

### CrunchBase

The foundation of our data comes from CrunchBase, which include organizations from startups to investors, funding rounds, etc. An August 2019 snapshot was processed and stored into our database. We identified and marked a list of Pre-Series A companies in our databas for tracking timestamps on updates. Changes overtime in startups are important when it comes to the dataset for modeling, so the pipeline we built automatically updates and add new entries to our database regularly. Only Pre-Series A companies are updated, but perhaps we can apply the updates to all startups in the database to all data up-to-date.

From CrunchBase we were able to obtain 921k people's CrunchBase profiles, however LinkedIn by far has the most comprehensive data on people. There are serious limitations when it comes to acquiring data from LinkedIn, and we have an ongoing process in scraping LinkedIn for our Talent Database Project. There are two steps of actions here:

- Migrate data from Talent Database Project into here
    - The Talent Database Project contains all of the Glasswing's LinkedIn connections, which most certainly overlaps with the 921k people we have from CrunchBase.
    - Airtable, was originally used for the Talent Database Project, which can't accomadte the data we scraped from LinkedIn. This database however, is built to accomadate all of LinkedIn's data with timestamped updates.
    - We need to match and dedup the 2 sets of people data; they can potentially be matched by linkedin urls. People from the Talent Database Project will be stored in this database marked as in Glasswing Network so we retain all of the features from the Talent Database Project.
    - Refer to [Talent Database Project Github](https://github.com/kleida-martiro/gw_db/blob/master/company_database) for more details
- Explore ways to use scraping methods from the Talent Database to scrape people profiles from CrunchBase

*Note: LinkedIn also has the most accurate number on the size of companies, which can be a good indicator for growth overtime. SourceSrub, offers that as a metrics and they are able to obtain the numbers by hiring cheap labor to manually check and record the number of employees regularly*

### Deal Tracker form
### Affinity
### Craft.co

## Challenges
