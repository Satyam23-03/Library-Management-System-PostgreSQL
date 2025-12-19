-- Library Management System Schema
-- Database: PostgreSQL

CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    publisher_id INT REFERENCES publishers(publisher_id),
    published_year INT CHECK (published_year > 1500)
);

CREATE TABLE book_authors (
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    author_id INT REFERENCES authors(author_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE book_copies (
    copy_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    status VARCHAR(20)
        CHECK (status IN ('AVAILABLE', 'ISSUED'))
        DEFAULT 'AVAILABLE'
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    member_type VARCHAR(20)
        CHECK (member_type IN ('STUDENT', 'STAFF')),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE issues (
    issue_id SERIAL PRIMARY KEY,
    copy_id INT REFERENCES book_copies(copy_id),
    member_id INT REFERENCES members(member_id),
    issue_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE
);
