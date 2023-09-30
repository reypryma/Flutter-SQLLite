-- Insert data into the Book table
INSERT INTO Book (title, author, price_rent, book_category)
VALUES
    ('Book Manga', NULL, 3000, 'MANGA'),
    ('Book Novel', NULL, 5000, 'NOVEL'),
    ('Book Novel', NULL, 7000, 'MAGAZINE');

-- Insert data into the Customer table
INSERT INTO Customer (name, identity_card_number, address)
VALUES
    ('Customer 1', 'ID1', 'Address 1'),
    ('Customer 2', 'ID2', 'Address 2'),
    ('Customer 3', 'ID3', 'Address 3');

-- Insert data into the Rent table
INSERT INTO Rent (customer_id, book_id, date_rent)
VALUES
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000'),
    (1, 1, '2023-09-30T00:00:00.000');