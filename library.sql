START TRANSACTION;

DROP TABLE IF EXISTS locations, books, patrons;

CREATE TABLE locations (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  address VARCHAR(45) NOT NULL
);

CREATE TABLE books (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(45) NOT NULL,
 location_id INT NOT NULL REFERENCES locations(id),
 is_checked_out BOOLEAN NOT NULL,
 last_checked_out TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE patrons (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(45),
 last_name VARCHAR(45),
 checked_out_book_id INT REFERENCES books(id) -- patron can only check out one book at a time
                                              -- can be set to null, indicating no book is checked out
);

INSERT INTO locations (address) VALUES ('123 Main St.');
INSERT INTO locations (address) VALUES ('137 Branch Dr.');

INSERT INTO books (TITLE, location_id, is_checked_out) VALUES ('Frankenstein', 1, true);
INSERT INTO books (TITLE, location_id, is_checked_out) VALUES ('Dracula', 2, true);
INSERT INTO books (TITLE, location_id, is_checked_out) VALUES ('The Hunger Games', 2, false);

INSERT INTO patrons (first_name, last_name, checked_out_book_id) VALUES ('Aidan', 'Beck', 1);
INSERT INTO patrons (first_name, last_name, checked_out_book_id) VALUES ('Natalie', 'Kies', 2);

COMMIT;