# Talent Data

## Table of Content
* [Talent Data](#talent-data)
  + [Overview](#overview)
  + [Goals](#goals)
  + [Pipeline](#pipeline)
    - [LinkedIn](#linkedin)
    - [CrunchBase](#crunchbase)
    - [Talent Tracker Form](#talent-tracker-form)
    - [AskFora](#askfora)
    - [Affinity](#affinity)
  - [Challenges](#challenges)


## Overview
The Talent Database project started as a separate project: to build a database of people in the Glasswing network from LinkedIn connections. Originally the people data are in Airtable as a separate database. Reference here for documentation on the first version of the project. To accommodate the complexity of the dataset, we consolidated the data into a cloud SQL database along with other data for other projects. Although the project started based on Linked connections, we are expanding our sources.


## Goals
- Search database for people and talent based on specific parameters and needs from Glasswing and/or its portfolio companies
- Make the search relevant and seamless by adding appropriate labels and notes to people
- Collect data from different sources, de-dup it and correct data to have the most correct version

## Pipeline

- Background and career Information for people who may be of interest to Glasswing’s portfolio companies. Data will be collected from public sources (such as LinkedIn, CrunchBase, AngelList, and potentially others), as well as from private sources (e.g., talent form on the Glasswing Web site, notes from Glasswing staff)
- Background and career information for LPs, VCs, and entrepreneurs whom we email and invite to events from MailChimp, Event Kingdom, and Affinity
- Information about people/connections we meet in-person (Names, phones, emails etc.). We will complement that data with LinkedIn data as mention above in (i)

### LinkedIn
*Download Glasswing Employee's LinkedIn connections*

LinkedIn is notoriously difficult to scrape. A scraper can't simply scrapes an LinkedIn account's connections, but the user of an account can [download a list of connections](https://www.linkedin.com/help/linkedin/answer/50191/accessing-your-account-data?lang=en). Connections in the download will only contain name, most current job title, and most current company. This is not ideal because important search parameters such as location and years of experience are missing.

*Scrape detailed data from the connections*

To scrape a LinkedIn profile we need its profile url. Using the download mentioned above, we can scrape the urls based on name and job title. Reference here for the url scraping script.

The most reliable way we have found to scrape LinkedIn profiles is PhantomBuster. PhantomBuster is a tool that takes linkedIn session ids and performs automation on the behalf of the account. Glasswing has a premium PhantomBuster account, which has an hour execution time a day. With a LinkedIn premium account, we are able to obtain 130-150 profiles a day safely. This method is not risk free, the linkedIn account might get banned but under 150 profiles has been safe so far. If the linkedIn account is not premium, the number should be lowered to under 50/day. After configuring a session id, a list of linkedIn urls, and the frequency of scraping, it will automatically run on their servers. The result is a JSON and CSV file. The json file contains the full data, which includes most of the information found in a profile (location, all past jobs, durations, etc.)

Session cookie resets every-time you re-login. Fake LinkedIn accounts were created to scrape in parallel. More can be created to increase the scraping speed and they need to have believable details and connections. (Reasonable amount of LinkedIn connections, has full job history, etc.)

*Process scraped data*

The JSON files are parsed and turned into multiple CSVs, matching the SQL database schema. Reference here for the code.

### Talent Tracker Form
The Talent Tracker Form is a web form designed to live on our website enabling website visitors and key potential hires to sign up into our talent database directly. The form has been carefully designed based on our information requirements. The website launched on May 15th, and ever since the form has been live.

The form is built on the website 123formbuilder.com and embed on the website through the same website. The form is connected to the talent tracker form database Airtable databases using the integration tool Zapier. 

*Maintenance*: If Sarah or anyone at Glasswing would like any changes to the form you could directly edit it on 123formbuilder.com and publish it, after any sort of change to the form the entire Zapier integration steps must be redone, and the website must be checked to make sure the form has changed over there as well.

*Next Steps*: Since we moved from Airtable to SQL database, we need to build a connector that ingests new entries into our SQL database using their webhook.

### CrunchBase
The CrunchBase database also has over a million people profiles, including corporate executives, investors, and Entrepreneurs. Although the profiles are not as comprehensive as LinkedIn, they offer a wide range of people in the tech/business world that could potentially be of use to Glasswing or our modeling experiments.

From the CrunchBase API, we exported all of the people's data and transformed them matching our SQL database schema. They were also de-duped with our LinkedIn data, since there were overlaps. (Expand on the du-dups)

### Affinity
Affinity is our CRM and automatically aggregated from our Glasswing email and calendar interactions. Users can export all of our connections from Affinity along with most related data. Some key data such as connection strength are unavailable to export. The API is also available for direct reads and writes to our data. 

(Expand on if we du-dup or have a process to ingest data into our SQL database)

## Challenges

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
