-- Views for Library Management System

-- Overdue Books View

CREATE VIEW overdue_books AS
SELECT 
    m.full_name AS member_name,
    b.title AS book_title,
    i.due_date,
    CURRENT_DATE - i.due_date AS overdue_days
FROM issues i
JOIN members m ON i.member_id = m.member_id
JOIN book_copies bc ON i.copy_id = bc.copy_id
JOIN books b ON bc.book_id = b.book_id
WHERE i.return_date IS NULL
  AND i.due_date < CURRENT_DATE;
