-- Triggers and Functions for Library Management System

-- Trigger Function: Mark Book as ISSUED

=====================================================
CREATE OR REPLACE FUNCTION mark_book_issued()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE book_copies
    SET status = 'ISSUED'
    WHERE copy_id = NEW.copy_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

======================================================
CREATE TRIGGER trg_mark_issued
AFTER INSERT ON issues
FOR EACH ROW
EXECUTE FUNCTION mark_book_issued();

======================================================
-- Trigger Function: Mark Book as AVAILABLE on Return

CREATE OR REPLACE FUNCTION mark_book_returned()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.return_date IS NOT NULL THEN
        UPDATE book_copies
        SET status = 'AVAILABLE'
        WHERE copy_id = NEW.copy_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

======================================================
CREATE TRIGGER trg_mark_returned
AFTER UPDATE ON issues
FOR EACH ROW
EXECUTE FUNCTION mark_book_returned();

======================================================
-- Fine Calculation Function

CREATE OR REPLACE FUNCTION calculate_fine(p_issue_id INT)
RETURNS INT AS $$
DECLARE
    late_days INT;
BEGIN
    SELECT GREATEST(0, return_date - due_date)
    INTO late_days
    FROM issues
    WHERE issue_id = p_issue_id;

    RETURN late_days * 5;
END;
$$ LANGUAGE plpgsql;
======================================================
