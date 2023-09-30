-- Create the Book table
CREATE TABLE IF NOT EXISTS Book (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NULL,
    Price_rent NUMERIC CHECK (Price_rent > 0) NOT NULL,
    Book_category VARCHAR(10) CHECK (Book_category IN ('MANGA', 'NOVEL', 'MAGAZINE'))
);

-- Create the Customer table
CREATE TABLE IF NOT EXISTS Customer (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL,
    identity_card_number VARCHAR(50) NOT NULL,
    address VARCHAR(50)
);

-- Create the Rent table
CREATE TABLE IF NOT EXISTS Rent (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    book_id INTEGER,
    date_rent DATE NOT NULL,
    date_return DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(Id),
    FOREIGN KEY (book_id) REFERENCES Book(Id)
);