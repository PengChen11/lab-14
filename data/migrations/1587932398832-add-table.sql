-- 1.create new bookshelves table in DB
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- 2. pickup the value in books table and insert to bookshelf table
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
-- 3. add new column to books talbe
ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- 4. set values for bookshelf talbe id column based on values from books table bookshelf column
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- 5. delete bookshelf from book table
ALTER TABLE books DROP COLUMN bookshelf;
-- 6. setup FOREIGN key in books table related to bookshelf table 
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);