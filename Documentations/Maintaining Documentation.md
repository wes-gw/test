# TOC
- [General](#general)
  - [Editing](#editing)
  - []()
- [Database]
- [Development Roadmap]


# General
## Editing 
To edit a page, click the pencil icon on the right corner and make desired changes.
![Image of Yaktocat](images/editing.png)

Press the "commit changes" button at the bottom to save any changes. 
![Image of Yaktocat](/images/commit_changes.png)

For each commit, we label and describe the changes. Labeling and commenting our changes provide a clear process for tracking history.
![Image of Yaktocat](https://octodex.github.com/images/history_tracking.png)

We can also make edits from our local repo and commit through terminal, similar to pushing our code.

Refer to the [**Markdown Cheatsheet**](https://guides.github.com/features/mastering-markdown/) for writing in Markdown. 

## Versioning
To label versions of our documentation, we create releases. 
![Image of Yaktocat](https://octodex.github.com/images/history_tracking.png)



# Database
A proposed system for versioning and updating the schema involves creating a feedback time-period before each new version. Changing the schema will become an involved process of updating scripts, front-ends, testing and version-control. Due to this breaking up the lifecycle of the database into n-month periods in which feedback from all stakeholders on updating schema (adding and deleting columns, adding tables, changing data types, etc.) is compiled. Once the nth month is hit, all the proposed feedback is implemented and a new version is rolled out. At which that time new ddl files and a new UML diagram are updated as well and the next period of n months starts.This avoids a tiresome process of allowing schema to change on request as well as staying organized with a shorter timestamped history of versioned schemas.

## UML
Steps on how to update the UML

## DDL
Steps on how to update the DDL

# Development Roadmap



