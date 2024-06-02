[![CLA assistant](https://cla-assistant.io/readme/badge/Renovus-Tech/solarec-db)](https://cla-assistant.io/Renovus-Tech/solarec-db)

# Solarec - Database - Repository
The repository contains the different SQL's files required to create and populate a Solarec Database. For each database engine supported a folder will exists. At the **data** folder, a few samples files will exists to with different types of samples.

# SQL Files
The SQL files are sorted, and therefore, must be executed in the corresponding order. The different files are:

- **01.tables.sql**: contains all the tables definitions, only tables and columns.
- **02.pks.sql**: contains all the PK for each of the tables defined.
- **03.fks.sql**: contains all the FK for each of the tables defined.
- **04.indexs.sql**: contains all the indexs that are needed to improve the performance.
- **05.views.sql**: contains all the views definitions.
- **_history.sql**: contains the changes that are being made to the database in order / commit

# Database nomenclature

- Language: EN
- All lower case
- Last word if full, others are 3 letters
- Word separation _
- Columns use name of table 
- Views start with vw_
- FK are fk_<origin table>__<destination table>
- Index are <table>_index_#
