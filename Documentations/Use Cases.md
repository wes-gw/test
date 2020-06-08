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
  - In-person, networking events, business traveling – manual entry unless information can be automatically pulled from LinkedIn, a business card, business card etc. Section 5.1 Feature E: Import & Edit

- If the information does not exist or is incorrect: [[Import & Edit](./Requirements.md#import-and-edit), [Timestamp Tracking and Version control](./Requirements.md#timestamp-tracking-and-version-control)
]
  - Data team will assist in updating that information by tracking down the source
  - If source is not online or accessible via external platforms, data team will reach out to management, investment, marketing, and ops teams to inquire said information 
  - Once information is found, data team and if necessary, the investment team will update the database with either the new or correct information
  
- Since a lot of deal-making goes off-line or at least off-platform, Glasswing should be able to track which talent and deal opportunities are attracted and then closed via personal interaction, with the goal of helping the company fund allocate personal attention to the opportunities which show the most promise, but may require personal attention from a fund member or team in order to succeed [[Tag](./Requirements.md#tag), [Add Notes](./Requirements.md#add-notes)]


### Automation
- [Email and Business Card Reader](./Requirements.md#email-and-business-card-reader)]
- [LinkedIn Profile Extraction](./Requirements.md#linkedin-profile-extraction)
- [Integration](./Requirements.md#integration)

















############################################################################################################
[Compare](./Requirements.md#compare)
[Tier Level](./Requirements.md#tier-level)
[Tag](./Requirements.md#tag)
[Add Notes](./Requirements.md#add-notes)
[Import & Edit](./Requirements.md#import-and-edit)
[Integration](./Requirements.md#integration)
[Email & Notification](./Requirements.md#email-nortification)]
[Email and Business Card Reader](./Requirements.md#email-and-business-card-reader)]
[LinkedIn Profile Extraction](./Requirements.md#linkedIn-profile-extraction)
[Search](./Requirements.md#search)
[Filter and Sort](./Requirements.md#filter-and-sort)
[Compare](./Requirements.md#compare)
[Export](./Requirements.md#export)
[Import & Edit](./Requirements.md#import-and-edit)
[Timestamp Tracking and Version control](./Requirements.md#timestamp-tracking-and-version-control)
