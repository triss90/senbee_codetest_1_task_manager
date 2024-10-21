-- schema.sql

-- Create the tasks table
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    is_completed INTEGER DEFAULT 0, -- SQLite doesn't have BOOLEAN, use INTEGER (0 for false, 1 for true)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Trigger to automatically update the updated_at column on row update
CREATE TRIGGER IF NOT EXISTS update_timestamp
AFTER UPDATE ON tasks
FOR EACH ROW
BEGIN
    UPDATE tasks
    SET updated_at = CURRENT_TIMESTAMP
    WHERE id = OLD.id;
END;

-- Sample data insertion (optional)
INSERT INTO tasks (title, description, is_completed) VALUES
('Sample Task 1', 'This is a sample task description.', 0),
('Sample Task 2', 'Another sample task.', 1);
