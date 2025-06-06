# 📚 Library Management System – CS504 Project (Spring 2024)

This project was developed as part of the **CS504: Principles of Data Management and Mining** course at George Mason University. It focuses on designing and implementing a relational database system for managing a public library's operations, including materials, members, staff, borrowing activities, and overdue alerts.

## 🔍 Overview

The Library Management System allows:
- Efficient storage of books, magazines, e-books, and audiobooks.
- Membership management with borrowing history tracking.
- Staff-assisted borrowing and return processes.
- Automated overdue tracking and membership suspension logic.
- Analytical queries to support reporting and decision-making.

## ⚙️ Technologies Used

- **MySQL Workbench** – Database design and implementation
- **CSV Files** – Sample data input
- **Draw.io** – ER diagram creation
- **SQL (DDL & DML)** – Table creation, querying, updates, and triggers

## 🗂️ Project Structure

- `ER_Diagram.png` – Visual representation of database schema
- `schema.sql` – SQL code to create all tables and relationships
- `sample_data_import.sql` – Scripts to load data from 8 CSV files
- `queries.sql` – Solutions to 10 complex SQL tasks
- `triggers.sql` – Extended features: overdue alerts and membership deactivation
- `project_report.pdf` – Full documentation and screenshots

## 📌 Key Features

1. **Normalized ER Design** – Designed for 3NF to avoid redundancy.
2. **Borrowing System** – Tracks borrowing, due dates, and returns.
3. **Overdue Alerts** – SQL trigger to notify staff of overdue items.
4. **Membership Control** – Auto-deactivates members with 3+ overdue records.
5. **Reporting Queries**:
   - Top 10 most borrowed materials
   - Overdue materials list
   - Most popular genres
   - Materials written by multiple authors

## 📁 Sample CSV Files

- `Borrow.csv`
- `Genre.csv`
- `Catalog.csv`
- `Authorship.csv`
- `Author.csv`
- `Material.csv`
- `Staff.csv`
- `Member.csv`

## 🛠️ How to Run

1. Open MySQL Workbench and create a new schema.
2. Run `schema.sql` to create all tables.
3. Use `sample_data_import.sql` to load CSV data.
4. Run `queries.sql` to test required use cases.
5. Optional: Run `triggers.sql` to activate alert features.

## 👨‍🎓 Author

**Akhil Arekatika**  
George Mason University  
Student ID: G01445921  
Course: CS504 – Spring 2024

---
