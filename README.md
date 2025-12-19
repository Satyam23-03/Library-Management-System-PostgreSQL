\# Library Management System – PostgreSQL



\## 📌 Project Overview

This project is a DBMS mini project that implements a Library Management System using PostgreSQL.

It demonstrates core database concepts such as normalization, constraints, triggers, views, and functions.



\## 🛠 Technologies Used

\- PostgreSQL

\- pgAdmin 4

\- SQL / PLpgSQL



\## 📂 Database Features

\- Book, Author, Publisher management

\- Member management

\- Issue \& Return system

\- Automated inventory updates using triggers

\- Overdue reporting using views

\- Fine calculation using functions



\## 🗂 Database Structure

\- publishers

\- authors

\- books

\- book\_authors

\- book\_copies

\- members

\- issues



\## 📊 Entity Relationship (ER) Diagram
![ER Diagram](assets/er_diagram.png)




erDiagram

&nbsp;   PUBLISHERS ||--o{ BOOKS : publishes

&nbsp;   BOOKS ||--o{ BOOK\_COPIES : has

&nbsp;   BOOKS ||--o{ BOOK\_AUTHORS : mapped\_to

&nbsp;   AUTHORS ||--o{ BOOK\_AUTHORS : writes

&nbsp;   MEMBERS ||--o{ ISSUES : borrows

&nbsp;   BOOK\_COPIES ||--o{ ISSUES : issued\_as





===========================================================





PUBLISHERS {

&nbsp;   int publisher\_id PK

&nbsp;   varchar name

}



AUTHORS {

&nbsp;   int author\_id PK

&nbsp;   varchar full\_name

}



BOOKS {

&nbsp;   int book\_id PK

&nbsp;   varchar title

&nbsp;   varchar isbn

&nbsp;   int published\_year

&nbsp;   int publisher\_id FK

}



BOOK\_COPIES {

&nbsp;   int copy\_id PK

&nbsp;   int book\_id FK

&nbsp;   varchar status

}



MEMBERS {

&nbsp;   int member\_id PK

&nbsp;   varchar full\_name

&nbsp;   varchar member\_type

&nbsp;   varchar email

}



ISSUES {

&nbsp;   int issue\_id PK

&nbsp;   int copy\_id FK

&nbsp;   int member\_id FK

&nbsp;   date issue\_date

&nbsp;   date due\_date

&nbsp;   date return\_date

}



BOOK\_AUTHORS {

&nbsp;   int book\_id FK

&nbsp;   int author\_id FK

}







======================================================================================







\## ▶ How to Run

1\. Create a database named `library\_db`

2\. Run SQL files in this order:

&nbsp;  - `schema/library\_schema.sql`

&nbsp;  - `data/sample\_data.sql`

&nbsp;  - `triggers\_functions/triggers\_functions.sql`

&nbsp;  - `views/views.sql`



\## 📄 Report

The complete project report is available in the `report` folder.



\## 👤 Author

Satyam Bhardwaj

Email- sbbhardwaj1997@gmail.com





