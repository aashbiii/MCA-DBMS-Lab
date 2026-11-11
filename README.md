# MCA 107: Database Management Systems (DBMS) Laboratory

> **Master of Computer Applications (MCA) — Semester 1**  
> **Course Code:** MCA 107 | **Subject:** Database Management Systems Laboratory  
> **Institution:** Department of Computer Science, Rajagiri College of Social Sciences (Autonomous), Kalamassery  
> **Student:** Ashbi Saju  

---

## Repository Overview

This repository contains the complete SQL and PL/SQL scripts, database schemas, practical lab cycle solutions, and semester database project for Oracle Database 19c / 21c and Microsoft Access.

The laboratory curriculum centers on a relational **University Course Management System** schema spanning 5 core entities: `Departments`, `Professors`, `Courses`, `Students`, and `Enrollments`.

---

## Table of Contents

- [Database Schema Architecture](#database-schema-architecture)
- [Lab Cycle Structure & Curriculum Sections](#lab-cycle-structure--curriculum-sections)
- [SQL DDL & DML Exercise Catalog](#sql-ddl--dml-exercise-catalog)
- [PL/SQL Program Mapping (PL1 – PL19)](#plsql-program-mapping-pl1--pl19)
- [Semester Project: Event Photography Order Tracking System](#semester-project-event-photography-order-tracking-system)
- [Execution & Verification](#execution--verification)

---

## Database Schema Architecture

The relational schema implements full entity and referential integrity constraints across 5 tables:

```
[Departments] (Dept_ID PK, Dept_Name UNIQUE, Building, Number_of_Classrooms)
      │
      ├──< [Professors] (Prof_ID PK, Prof_Name, Dept_ID FK, Experience_Years)
      │         │
      │         └──< [Courses] (Course_ID PK, Course_Name, Dept_ID FK, Prof_ID FK, Credits, Total_Students)
      │                   │
      └──< [Students]     │
                │         │
                └──< [Enrollments] (Student_ID PK/FK, Course_ID PK/FK, Semester, Marks)
```

---

## Lab Cycle Structure & Curriculum Sections

The laboratory is organized into six formal sections:
1. **Section 1 & 2:** Installation & Configuration of Oracle Database & Table Design.
2. **Section 3:** Practice SQL Data Definition Language (DDL) Commands.
3. **Section 4:** Practice SQL Data Manipulation Language (DML) Commands (11 Subsections).
4. **Section 5:** PL/SQL Programming (Basic Blocks, Cursors, Procedures, Functions, Triggers, Views).
5. **Section 6:** Course Project (Relational Database Design & Implementation).

---

## SQL DDL & DML Exercise Catalog

### Section 3: Data Definition Language (DDL)
- **3.1 Table Creation and Alteration**
  1. Create all 5 tables (`Departments`, `Professors`, `Courses`, `Students`, `Enrollments`) with Primary Keys, Foreign Keys, and CHECK constraints.
  2. Alter table `Departments`: Add column `Dept_Head` (`VARCHAR2(50)`).
  3. Alter table `Professors`: Modify size of `Experience_Years` to `NUMBER(3)`.
  4. Alter table `Courses`: Rename `Student_Count` to `Total_Students`.
  5. Drop and recreate the `Enrollments` table with composite primary key constraint.

### Section 4: Data Manipulation Language (DML)
- **4.1 Insertion, Deletion, Update & Transactions**
  1. Populate baseline records into all five tables.
  2. Insert department `('D04', 'Civil Engg', 'Block C', 5)`.
  3. Create table `high_achievers` populated with students scoring > 85 in any course.
  4. Create backup tables `Courses_Backup` and `Professors_Backup`.
  5. Add new course `'CIV101'` under department `'D04'`.
  6. Update course instructor and create savepoint `SP1`.
  7. Change course credits and create savepoint `SP2`.
  8. Delete low-credit courses from `Courses_Backup`.
  9. Delete junior professors from `Professors_Backup`.
  10. Rollback to `SP1` and rename table to `Course_Master`.
- **4.2 Data Retrieval (SELECT)**
  1. Retrieve all department names.
  2. Display all data from `Professors`.
  3. Retrieve student names and birth dates.
  4. List course names and credit weightage.
  5. Select courses offered by the `'Computer Science'` department.
  6. Query professors with title `'Dr%'`.
  7. Filter courses with credits > 3.
  8. Search courses matching `'Theory'` wildcard pattern.
  9. Find students born after Jan 1, 2003.
  10. Query faculty members with 10+ years experience.
  11. Filter courses with student enrollment > 1.
  12. Select distinct semesters from `Enrollments`.
  13. Query student details by explicit IDs (`S0001`, `S0002`).
  14. Query courses excluding `'Mechanical Engg'`.
- **4.3 SQL Built-in Functions**
  - Numeric functions (`ROUND`, `MOD`, `POWER`), String functions (`LENGTH`, `SUBSTR`, `INSTR`, `UPPER`, `LOWER`), Date formatting, aggregate statistics (`COUNT`, `MAX`, `MIN`, `AVG`).
- **4.4 Date Functions**
  - Day of birth extraction, `DD-Month-YYYY` formatting, `DD-MM-YY` formatting, date arithmetic (+100 days), month filtering, year range filtering.
- **4.5 Set Operators**
  - `UNION`, `UNION ALL`, `INTERSECT`, and `MINUS` between `Courses` and `Top_Courses`.
- **4.6 Sorting & Ordering**
  - Sort faculty in descending order of experience.
- **4.7 GROUP BY & HAVING**
  - Departmental student distribution (`HAVING COUNT(*) > 1`), department average classroom capacity, multi-course faculty loads.
- **4.8 Subqueries (Single-row & Multi-row)**
  - Enrolled student names, student department lookups, departments with >1 student, courses taught by senior professors.
- **4.9 NOT EXISTS Queries**
  - Departments where every professor has >5 years experience; departments with zero enrollments.
- **4.10 Correlated Subqueries**
  - Students with marks above the overall class average; students born later than any Electrical Engg student.
- **4.11 Table Joins**
  - Inner joins of Student & Department; Courses & Enrollment counts; Course & Professor associations; Multi-table department joins.

---

## PL/SQL Program Mapping (PL1 – PL19)

The standalone PL/SQL files in this repository directly implement the curriculum requirements of **Section 5**:

| File | Category | Title / Objective | Description |
| :--- | :--- | :--- | :--- |
| [`PL1.sql`](./PL1.sql) | **Basic Block** | Course Enrollment Counter | Accepts Course ID and prints total student count |
| [`PL2.sql`](./PL2.sql) | **Basic Block** | Department Existence Validator | Inserts `'Biotech'` (`'D05'`) if it does not already exist |
| [`PL3.sql`](./PL3.sql) | **Basic Block** | Department Student Totalizer | Calculates total students in `'Computer Science'` |
| [`PL4.sql`](./PL4.sql) | **Cursors** | Implicit Cursor - Insert Student | Inserts a new student and reports `SQL%ROWCOUNT` |
| [`PL5.sql`](./PL5.sql) | **Cursors** | Implicit Cursor - Update Marks | Updates marks and reports affected row count |
| [`PL6.sql`](./PL6.sql) | **Cursors** | Explicit Cursor - High Achievers | Iterates and lists students with marks > 80 |
| [`PL7.sql`](./PL7.sql) | **Cursors** | Explicit Cursor - Faculty Courses | Fetches and displays all courses taught by professor `P1001` |
| [`PL8.sql`](./PL8.sql) | **Procedures** | Enrolled Courses Lookup | Procedure accepting Student ID and returning enrolled course count |
| [`PL9.sql`](./PL9.sql) | **Procedures** | Conditional Course Creation | Procedure inserting course only if department and professor exist |
| [`PL10.sql`](./PL10.sql) | **Procedures** | Credit Update with Audit Log | Updates course credits and logs previous/new credits into `Course_Log` |
| [`PL11.sql`](./PL11.sql) | **Functions** | Student Age Calculator | Stored function `get_student_age` returning age from DOB |
| [`PL12.sql`](./PL12.sql) | **Functions** | Department Course Counter | Stored function `count_courses_by_dept` returning total courses |
| [`PL13.sql`](./PL13.sql) | **Functions** | Faculty Workload Checker | Stored function checking if a professor teaches more than 2 courses |
| [`PL14.sql`](./PL14.sql) | **Triggers** | Course Deletion Guard | Row-level trigger blocking deletion of courses with > 2 credits |
| [`PL15.sql`](./PL15.sql) | **Triggers** | Marks Modification Audit | Trigger logging old and new marks into `Enrollments_Log` table |
| [`PL16.sql`](./PL16.sql) | **Triggers** | Duplicate Enrollment Guard | Before-insert trigger preventing duplicate course registrations |
| [`PL17.sql`](./PL17.sql) | **Triggers** | Weekend Modification Lockdown | Trigger blocking `UPDATE` and `DELETE` on Saturdays and Sundays |
| [`PL18.sql`](./PL18.sql) | **Views** | Student Course Count View | Creates view `Student_Course_Count` mapping students to enrolled counts |
| [`PL19.sql`](./PL19.sql) | **Views** | Course Average Marks View | Creates view `Course_Avg_Marks` for courses with >1 student |

---

## Semester Project: Event Photography Order Tracking System

- **Database File:** [`EventPhotographyDB.accdb`](./EventPhotographyDB.accdb)
- **Description:** A relational database management application developed to streamline event photography workflows:
  - Client profiles and booking scheduling
  - Package selection (Weddings, Corporate, Portraits)
  - Photographer equipment allocation and assignment tracking
  - Deliverable milestone progress (Shooting, Editing, Final Delivery)
  - Invoice billing, payment status, and customer receipt generation

---

## Execution & Verification

### Executing PL/SQL Scripts in SQL*Plus / Oracle SQL Developer:
```sql
-- Enable DBMS Output
SET SERVEROUTPUT ON;

-- Execute script
@PL1.sql
@PL8.sql
```

### Complete Lab Record Documentation:
- Complete step-by-step documentation with code listings and query outputs is available in [`3. DBMS LAB CYCLE - FULL.pdf`](./3.%20DBMS%20LAB%20CYCLE%20-%20FULL.pdf).
- Course problem statements and question lists are available in [`QNS.pdf`](./QNS.pdf).
- Verified front certificate is included in [`1. DBMS LAB FRONT.pdf`](./1.%20DBMS%20LAB%20FRONT.pdf).
