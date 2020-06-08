# Glossary
- [ ] Fundraising
- [ ] Portfolio Support
- [ ] Portfolio Monitoring
- [ ] Deal Sourcing and Initial Screening
- [ ] Due Diligence
- [ ] Deal Tracking
- [ ] Marketing & Operations
- [ ] ML/AI Modeling

**Some usecases are contingent on development of an front-end application since the partners will not be writing SQL queries**

# Fundraising
**Front-end dependent**

Partners look for new sources to raise the next fund. They need to search, sort, filter, tag, compare and export information regarding LPs, family offices, institutional funds etc. It’s important to be able to index relationships as they progress or weaken. [[Tier Level](./Requirements.md#tier-level)]

## Ownership - Partners
### Responsibilities
- Find information about LPs, family offices, institutional funds etc. [[Search](./Requirements.md#search), [Filter and Sort](./Requirements.md#filter-and-sort),[Compare](./Requirements.md#compare), [Export](./Requirements.md#export)]
- Tagging existing sources of fundraising versus new and potential ones, and adding notes such as last communication and medium of communication, and follow up, dead end, etc. [[Tag](./Requirements.md#tag), [Add Notes](./Requirements.md#add-notes)]
- Manually entering new referrals into the database that’s outside of our network [[Import and Edit](./Requirements.md#import-and-edit)]

### Automation
- [[Tier Level](./Requirements.md#tier-level)]
- [[Email and Business Card Reader](./Requirements.md#email-and-business-card-reader)]
- [[LinkedIn Profile Extraction](./Requirements.md#linkedin-profile-extraction)]

# Portfolio Support
**Front-end dependent**

Partner and investment team need to identify suitable talent and customers in our network to help portfolio companies. They receive and log request from portfolio companies. Through the UI, they can search, filter, sort, compare and export people of interest by any parameters and tags. Tags can also be applied as they go through lists of people. They can review candidates’ profiles, skills and experiences; keep track of their recommendations & sources; and denote final decisions. 

## Ownership - Partners & Investment Team

### Responsibilities
- Taking in requests from portfolio companies via in-person, phone call, or email etc.
- Find talents or customers based on parameters given [[Search](./Requirements.md#search), [Filter & Sort](./Requirements.md#filter-and-sort), [Compare](./Requirements.md#compare), [Export](./Requirements.md#export)]
- Denote relationship strength, log recommendation and hiring decisions, add track other attributes [[Tag](./Requirements.md#tag), [Add Notes](./Requirements.md#add-notes)]
- Review and narrow down the list to their preferred candidates or prospects
- Collect new referral information and import interested talents [[Import & Edit](./Requirements.md#import-and-edit)]

### Automation
- Partners and Investment team should be notified of new talent requests through the notification system [[Email notification](./Requirements.md#email-nortification)]
- Import data from Glasswing’s talent tracker form [[Import & Edit](./Requirements.md#import-and-edit)]

# Portfolio Monitoring
**Front-end dependent**

Partners and investment team can use the platform to look at a variety of trends related to the performance of portfolio companies. Analysts can enter data with timestamps such as financials, team hiring/firing, customer base and size, etc. [Visualization](./Requirements.md#visualization)

## Ownership - Partners & Investment Team

### Responsibilities
- Entering data collected from partners or portfolio companies regarding the financial situation, team hiring/firing, customer base and size, etc.  [[Import & Edit](./Requirements.md#import-and-edit)]

### Automation
- [[Timestamp Tracking and Version control](./Requirements.md#timestamp-tracking-and-version-control)]


# Deal Sourcing
**Front-end dependent**

Investment team reviews AI-powered investment opportunities, and it is the first initial point of contact with startups. The team has the leverage to make educated decisions and recommendations about passing a deal forward or not. An UI will prompt the parties responsible in the sourcing and screening to log in records detailed below.
## Ownership - Investment Team

### Responsibilities
- The team finds companies either via networking events, conferences, referrals or companies reaching out to them via email, Twitter, LinkedIn and/or phone [[Add Notes](./Requirements.md#add-notes), [Import & Edit](./Requirements.md#import-and-edit)] 

- They enter attributes about the startups that are moving down the investment pipeline, including pass reasons at any stage.  [[Add Notes](./Requirements.md#add-notes), [Import & Edit](./Requirements.md#import-and-edit)] 

- First screening note is entered manually until a new process of collecting this information is introduced. The new process entails asking the founder to enter the data below in a survey form [[Add Notes](./Requirements.md#add-notes), [Import & Edit](./Requirements.md#import-and-edit)] 
  - Company info: industry, type of service, business model, customer base, ARR, MRR, total revenue, GTM, Ask, current participating angels/VCs
  - Source of introduction, parties participating in the first screening 
  - Next steps
- If passes, second screening is with partner. All notes from this meeting should be recorded [[Add Notes](./Requirements.md#add-notes), [Import & Edit](./Requirements.md#import-and-edit)] 
- If passes, one pager is created and presented to all partners. Feedback from all partners should be collected [[Add Notes](./Requirements.md#add-notes), [Import & Edit](./Requirements.md#import-and-edit)] 
- If passes, deeper due diligence is required. Refer to section 4.5 below for more details. [[Add Notes](./Requirements.md#add-notes), [Import & Edit](./Requirements.md#import-and-edit)]


### Automation
- [[CrunchBase Profile Extraction](./Requirements.md#crunchBase-profile-extraction)]
- [[Integration](./Requirements.md#integration)]


# Due Diligence
**Front-end dependent**

Partners, investment, marketing, operations and data teams will need to do their own due diligence depending on the need, which can be from an investment, marketing, ops and data POVs. 

## Ownership
Partners, investment, marketing, operations and data teams, firm’s advisors and legal teams own the due diligence process

### Responsibilities
- The various stakeholders can search, sort, filter, compare and export information needed [[Search](./Requirements.md#search), [Filter and Sort](./Requirements.md#filter-and-sort), [Compare](./Requirements.md#compare), [Export](./Requirements.md#export)]
- Coordinate all due technical diligence for potential investments activities across stakeholders, including artificial intelligence and technology architecture deep dives, product roadmap analysis, etc.  
- Conduct company research on company’s data, company’s key risks, financial standing and cap table modeling
- Conduct market-related research on business economics, go-to-market strategy and expansion plans, market dynamics, market research and market sizing, competitive dynamics analysis, customer interviews and reference checks
- Manually enter any new data that is collected from: [Import & Edit](./Requirements.md#import-and-edit)
  - Phone: manual entry into the database
  - In-person, networking events, business traveling
  – manual entry unless information can be automatically pulled from LinkedIn, a business card, business card etc. [Import & Edit](./Requirements.md#import-and-edit)

- If the information does not exist or is incorrect: [[Import & Edit](./Requirements.md#import-and-edit), [Timestamp Tracking and Version control](./Requirements.md#timestamp-tracking-and-version-control)
]
  - Data team will assist in updating that information by tracking down the source
  - If source is not online or accessible via external platforms, data team will reach out to management, investment, marketing, and ops teams to inquire said information 
  - Once information is found, data team and if necessary, the investment team will update the database with either the new or correct information
  
- Since a lot of deal-making goes off-line or at least off-platform, Glasswing should be able to track which talent and deal opportunities are attracted and then closed via personal interaction, with the goal of helping the company fund allocate personal attention to the opportunities which show the most promise, but may require personal attention from a fund member or team in order to succeed [[Tag](./Requirements.md#tag), [Add Notes](./Requirements.md#add-notes)]


### Automation
- [Email and Business Card Reader](./Requirements.md#email-and-business-card-reader)
- [LinkedIn Profile Extraction](./Requirements.md#linkedin-profile-extraction)
- [Integration](./Requirements.md#integration)


# Marketing & Operations
**Front-end dependent**

Partners, investment, marketing, operations and data teams will need to do their own due diligence depending on the need, which can be from an investment, marketing, ops and data POVs. 

## Ownership - Marketing, Platform & Ops

### Responsibilities
- The platform team will access lists and tags for people that we want to develop or strengthen relationships. Integration with Mailchimp and Affinity will also allow them to plan marketing audience and events invitees and track effectiveness. [[Tag](./Requirements.md#tag), [Integration](./Requirements.md#integration)]. Data will be used for: 
  - Networking events: to increase Glasswing’s awareness in the ecosystem and invite the appropriate audience to each networking event 
  - Distribution of marketing materials/newsletter: have the ability to share important information and at a regular cadence with different audiences in the ecosystem. In addition, have the ability to alter these lists based on changes regarding change of job, new entrances, etc. 
- Populate the database with lists of people that attend events that are not in our database
  - Lists would include people’s full name and other available information [[Import & Edit](./Requirements.md#import-and-edit)]
  - Lists would populate with data from LinkedIn and other sources [[LinkedIn Profile Extraction](./Requirements.md#linkedIn-profile-extraction)]
  - Lists would also be used to track LPs, VCs, Angel investors, entrepreneurs to invite to events [[Tag](./Requirements.md#tag), [Integration](./Requirements.md#integration)]
  - They would create these lists and filter by list name [[Filter and Sort](./Requirements.md#filter-and-sort), [List](./Requirements.md#list)]
  - They would have the ability to filter by past event attendance [[Filter and Sort](./Requirements.md#filter-and-sort)]
  - They would leverage these lists for newsletter updates as well [[List](./Requirements.md#list)]
- Operational procedure:
  - Have ease and access to information to enhance the operational procedure, systems and principles in the areas of information flow. In addition, support communication with the management team and external parties
  - Be able to use the database information to build relationships and alliances with external organizations and provide the assistance needed, while being fully informed on all internal communications and decisions 

### Automation
- Integration with MailChimp, Affinity and other resources used in the future to keep tags and fields up to date [[Dynamic](./Requirements.md#dynamic), [Integration](./Requirements.md#integration)]


# ML/AI  Modeling
**Front-end dependent**

The data science team will have an ETL pipeline for predictive modeling and will also track changes to the database.

## Ownership
The data team owns the predictive modeling efforts.

### Responsibilities
- Use company information to derive attributes to supplement the people dataset (e.g., successful serial founder etc.) [Export](./Requirements.md#export)
- Develop models which can generate lists of companies of interest, and assess their investment viability 
- Support all stakeholders in their needs to find, source, update and/or remove data they need in order to help the workflow with correct data, maintain data integrity, and maintain our competitive reputation in the market 
- Further enrich the data with new information and leverage all data points to work on data projects, such as the AI project. 
- Use data extracted from CrunchBase and/or Pitchbook about companies that are in their pre-seed round of financing 
  - Main data needed is startup name, founder, founder history, team size, industry, service, type of company
  - Angel investors, round of financing if any, lifetime of startup 
- Export structured and unstructured data in bulk for modeling
  - Using scripts/configuration files, flexibly extract desired data subsets suitable for training, evaluation and testing, and present these to the selected data wrangling and training pipeline. The sub-setting should be specifiable in terms of time (absolute, relative) and company attributes.
- Data team should keep track when any of the following changes: startup name, founder, founder history, team size, industry, service, type of company, Angel investors, round of financing if any, lifetime of startup. These updates will be updated automatically via CrunchBase API, but human input is needed when CrunchBase miss an update in their database.

### Automation
a)	A UI that periodically delivers analysts a list of companies that meet our investment thesis, automated collected from external source such as CrunchBase API and Accelerator websites [Automated Sourcing List](./Requirements.md#automated-sourcing-list)
b)	AI should score or rank the startups based on criteria that we know we care about (scoring can be used when ML model is ready to deploy) [Startup Success Score](./Requirements.md#startup-success-score)
c)	Automatically check for changes in the companies in our database via CrunchBase API (other providers or website) weekly [Dynamic](./Requirements.md#dynamic)


############################################################################################################
[Automated Sourcing List](./Requirements.md#automated-sourcing-list)
[Startup Success Score](./Requirements.md#startup-success-score)
[Compare](./Requirements.md#compare)
[Dynamic](./Requirements.md#dynamic)
[Tier Level](./Requirements.md#tier-level)
[Tag](./Requirements.md#tag)
[Add Notes](./Requirements.md#add-notes)
[Import & Edit](./Requirements.md#import-and-edit)
[Integration](./Requirements.md#integration)
[Email & Notification](./Requirements.md#email-nortification)]
[Email and Business Card Reader](./Requirements.md#email-and-business-card-reader)]
[LinkedIn Profile Extraction](./Requirements.md#linkedIn-profile-extraction)
[List](./Requirements.md#list)
[Search](./Requirements.md#search)
[Filter and Sort](./Requirements.md#filter-and-sort)
[Compare](./Requirements.md#compare)
[Export](./Requirements.md#export)
[Import & Edit](./Requirements.md#import-and-edit)
[Timestamp Tracking and Version control](./Requirements.md#timestamp-tracking-and-version-control)
