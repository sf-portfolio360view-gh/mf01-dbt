


Use case: Mutual fund project using snowflake + DBT

--------------------------Lending--------------

Azure:

1. Storage account
	- Data storage
		- container - folders (investor, fund, nav, transaction)
		- queue
	- Event subscription

source files (.csv) format
1. investor_master
2. fund_master
3. nav_history
4. mutual_fund_transactions

---------------------------RAW---------------------
Snowflake:

1. DB/Schema/Tables
2. File format/Stage/Storage configuration/Notification configuration/PIPE/Copy into /stream

Database: MF01
Schema: RAW, STG, PRSNT, ADT

Tables: 
1. investor_master
2. fund_master
3. nav_history
4. mutual_fund_transactions


-------------------------STG + PRSNT -----------------------
DBT:
1. Installation + Configuration
2. New Project folder
3. Implementation
		- Model  - STG, PRSNT
		- snapshot
		- test
		- seed
		- documents
		- analyses
		- Micro

--------------------------Reporting-----------------------
1. stream lit

--------------------------Deployment---------------------
1. git setup
2. code deployment


--------------------------orchestration-----------------
1. TASK + Store proc 
or
2. ???





