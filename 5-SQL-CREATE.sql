---------------------------------------------------
--- SQL: CREATING AND UPDATING TABLES
---------------------------------------------------

-- P1: CREATE
-- P2: INSERT
-- P3: UPDATE & SET
-- P4: ALTER
-- P5: DROP

---------------------------------------------------
--- P1: Creating tables >> CREATE
--- Documentation: https://www.postgresql.org/docs/current/sql-createtable.html
---------------------------------------------------

/* Syntax:
CREATE TABLE table_name (
	column1_name column1_type ,
	column2_name column2_type ,
	column3_name column3_type
		) ;
*/

CREATE TABLE ew_demo_customer (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE ew_demo_friends (
	friend_id INT PRIMARY KEY,
	friend_name VARCHAR(50),
	team VARCHAR(50),
	hair_style_rating INT CHECK (hair_style_rating > 0 AND hair_style_rating < 11)
);

-- There are many data types to choose from:
-- INT, BIGINT, FLOAT, NUMERIC
-- VARCHAR, TEXT, CHAR
-- DATE, BOOL, ARRAY

---------------------------------------------------
--- P2: Inserting new data >> INSERT
--- Documentation: https://www.postgresql.org/docs/current/sql-insert.html
---------------------------------------------------
SELECT * FROM ew_demo_friends;

/* Syntax:

INSERT INTO table_name VALUES
	( value1_1, value1_2, value1_3 ),
	( value2_1, value2_2, value2_3 ) ;

*/


-- We can also specify the names of the columns


/* Syntax:

INSERT INTO table_name (column_1, column_2, column_3)
	VALUES (value_1, value_2, value_3) ;

*/
INSERT INTO
	ew_demo_friends (friend_id, friend_name, team, hair_style_rating)
VALUES
	(2, 'Sammy', 'Finance', 8),
	(3, 'Tom', 'Tech', 9);

SELECT * FROM ew_demo_friends;
---------------------------------------------------
--- P3: Updating existing data >> UPDATE & SET
--- Documentation: https://www.postgresql.org/docs/current/sql-update.html
---------------------------------------------------

-- We can update the existing data in our table on a specific record
-- We typically designate the record we want using the table's PRIMARY KEY


/* Syntax:

UPDATE table_name
SET column = new_value
WHERE ID = record_value

*/

UPDATE ew_demo_friends
SET friend_name = 'Thom'
WHERE friend_id = 3;

SELECT * FROM ew_demo_friends;

---------------------- Here's a typical example
-- UPDATE my_table
-- SET flag = 1
-- WHERE ID = 2337

---------------------------------------------------
--- P4: Modifying the table >> ALTER
--- Documentation: https://www.postgresql.org/docs/current/sql-altertable.html
---------------------------------------------------

-- The ALTER TABLE flag can interact with your table in many ways, such as
-- 1. Adding a new column

/* Syntax:

ALTER TABLE table_name
	ADD COLUMN column_name column_type ;

*/

ALTER TABLE ew_demo_friends
	ADD COLUMN favouritism_rating INT CHECK (favouritism_rating > 0 AND favouritism_rating < 6);

SELECT * FROM ew_demo_friends;

UPDATE ew_demo_friends
SET favouritism_rating = 6
WHERE friend_id = 2;

-- 2. Dropping an existing column

/* Syntax:

ALTER TABLE table_name
	DROP COLUMN column_name ;

*/

ALTER TABLE ew_demo_friends
	DROP COLUMN favouritism_rating;

SELECT * FROM ew_demo_friends;

-- 3. Changing the data type of an existing column

/* Syntax:

ALTER TABLE table_name
	ALTER COLUMN column_name TYPE new_column_type ;

*/

ALTER TABLE ew_demo_friends 
	ADD COLUMN description TEXT;

ALTER TABLE ew_demo_friends 
	ALTER COLUMN description TYPE TEXT;

-- 4. BONUS: Adding constraints

/* Syntax:

ALTER TABLE table_name
	ADD CONSTRAINT your_table_pkey PRIMARY KEY (column1, column2, ...);

*/

-- Overall: There are many, many possible use cases for ALTER TABLE

---------------------------------------------------
--- P5: Deleting your table >> DROP
--- Documentation: https://www.postgresql.org/docs/current/sql-droptable.html
---------------------------------------------------

-- This action is irreversible!
-- DROP will completely delete your table from the database. 
-- To remove its contents rather than deleting it, use DELETE

-- Syntax:
-- DROP TABLE IF EXISTS table_name ;

DROP TABLE ew_demo_customer;
DROP TABLE ew_demo_friends;

GRANT
	SELECT, INSERT, UPDATE
ON
	de_2506_a.ew_demo_friends
TO
	de_2506_a;

---
COPY de_2506_a.ew_demo_friends (friend_id, friend_name, team, hair_rating)
FROM '/path/on/server'
DELIMITER ', '
CSV HEADER;

