-- Sample Data for Library Management System

-- Publishers
INSERT INTO publishers (name) VALUES
('Pearson'),
('Oxford'),
('McGraw Hill'),
('NCERT');

-- Authors
INSERT INTO authors (full_name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Robert C. Martin'),
('Paulo Coelho'),
('NCERT');

-- Books (General)
INSERT INTO books (title, isbn, publisher_id, published_year) VALUES
('Harry Potter', '1234567890123',
 (SELECT publisher_id FROM publishers WHERE name = 'Pearson'), 1997),

('1984', '9876543210123',
 (SELECT publisher_id FROM publishers WHERE name = 'Oxford'), 1949);

-- CBSE / NCERT Books – Class 10
INSERT INTO books (title, isbn, publisher_id, published_year) VALUES
('Mathematics – Class 10', '1111111111111',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025),

('Chemistry – Class 10', '2222222222222',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025),

('Comm. English – Class 10', '3333333333333',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025),

('History – Class 10', '4444444444444',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025),

('Sanskrit – Class 10', '5555555555555',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025),

('Physics – Class 10', '6666666666666',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025),

('Biology – Class 10', '7777777777777',
 (SELECT publisher_id FROM publishers WHERE name = 'NCERT'), 2025);

-- Book–Author Mapping
INSERT INTO book_authors (book_id, author_id)
SELECT b.book_id, a.author_id
FROM books b, authors a
WHERE a.full_name = 'NCERT'
  AND b.title ILIKE '%Class 10%';

-- Book Copies
INSERT INTO book_copies (book_id)
SELECT book_id FROM books;

-- Members
INSERT INTO members (full_name, member_type, email) VALUES
('Amit Kumar', 'STUDENT', 'amit@gmail.com'),
('Neha Sharma', 'STAFF', 'neha@gmail.com');
