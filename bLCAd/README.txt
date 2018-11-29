-------------------------------
---- BUILDING LCA DATABASE ----
-------------------------------
v0.1
_______by Eirik Resch__________

This folder contains everything needed to set up the database.

-- Database Model --
"bLCAd.mwb" is a MySQL Workbench file. MySQL Workbench can be downloaded for free. 

-- Entity-Relationship-Diagram --
Open the "bLCAd" file to see the ER-Diagram.
There are detailed descriptions of tables and columns in the comments in the ER-Diagram.
There is also a png-file of the ERD in the folder.

-- Workflow --
1. In MySQL Workbench, click "Database-->Forward engineer" to set up the database on the server.
2. Run all .sql files in "\Scripts\A. Define Database"
3. Add buildings, materials, inventories, and LCA results. Example buildings are in the "B. Add entries" folder. Actual buildings are in the Buildings folder.

-- SQL scripts and queries --
The "Scripts" folder contains:
    A. Scripts for insertion of categorical data and stored procedures etc. Run all .sql files in this folder to make the database ready for use.
    B. Example scripts for inserting building information and inserting emission data.
    C. Atm only scripts where I play around with/test queries and calculations.
