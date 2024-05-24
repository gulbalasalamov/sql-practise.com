-- Start with tables that have no foreign keys
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    description TEXT
);


INSERT INTO categories (category_name, description)
VALUES 
('Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
('Confections', 'Desserts, candies, and sweet breads'),
('Structural & Misc Steel Erection', 'Malig neoplasm of prph nerves of left lower limb, inc hip'),('Fire Sprinkler System', 'Inj flexor musc/fasc/tend l mid finger at forarm lv, init'),
('Granite Surfaces', 'Poisoning by oth narcotics, intentional self-harm, subs'),
('EIFS', 'Polymyositis with other organ involvement'),
('Construction Clean and Final Clean', 'Dislocation of metacarpophalangeal joint of other finger'),
('Construction Clean and Final Clean', 'Crohn''s disease of small intestine with complications'),
('Structural & Misc Steel Erection', 'Underdosing of agents primarily affecting GI sys'),
('Electrical', 'Displ oblique fx shaft of unsp rad, init for opn fx type I/2'),
('Construction Clean and Final Clean', 'Open bite, unspecified foot, sequela'),
('Structural and Misc Steel (Fabrication)', 'Congenital cyst of mediastinum');

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_title VARCHAR(255),
    address TEXT,
    city VARCHAR(255),
    postal_code VARCHAR(20),
    country VARCHAR(255),
    phone VARCHAR(20)
);

INSERT INTO suppliers (company_name, contact_name, contact_title, address, city, postal_code, country, phone)
VALUES ('Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', 'EC1 4SD', 'UK', '171-555-2222'),
       ('New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', '70117', 'USA', '504-555-4280'),
       ('Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', '48104', 'USA', '313-555-5735');
      
INSERT INTO suppliers (supplier_id, company_name, contact_name, contact_title, address, city, postal_code, country, phone)
VALUES (DEFAULT, 'Stoltenberg, Zulauf and Metz', 'John', 'Ms', 'PO Box 17979', 'Yaodian', NULL, 'China', '473-451-3600'),
 (DEFAULT, 'Konopelski-Kirlin', 'Rogerio', 'Mr', '6th Floor', 'Burnside', 'EH52', 'United Kingdom', '680-416-6680'), 
 (DEFAULT, 'Wunsch, Jast and Bruen', 'Leon', 'Mr', 'PO Box 54870', 'Puno', NULL, 'Peru', '300-947-0684'), 
 (DEFAULT, 'Schultz-Abbott', 'Rodie', 'Mrs', 'Suite 9', 'Hamilton', NULL, 'Bermuda', '114-110-4667'), 
 (DEFAULT, 'Lockman and Sons', 'Bonita', 'Rev', 'Apt 55', 'Myitkyina', NULL, 'Myanmar', '661-878-4733'), 
 (DEFAULT, 'Harber LLC', 'Maryjane', 'Rev', 'Apt 231', 'Lazarevac', NULL, 'Serbia', '203-916-7803'), 
 (DEFAULT, 'Kunze and Sons', 'Batsheva', 'Honorable', 'Apt 975', 'Langsepan', NULL, 'Indonesia', '445-627-0222'), 
 (DEFAULT, 'O''Conner Inc', 'Billi', 'Dr', 'Suite 83', 'Dallas', '75397', 'United States', '214-358-1643'), 
 (DEFAULT, 'Abernathy, Koepp and Lebsack', 'Millicent', 'Mrs', 'PO Box 84349', 'Indianapolis', '46202', 'United States', '317-998-2317'),
 (DEFAULT, 'Halvorson, Cummings and Dickinson', 'Bella', 'Dr', 'Suite 56', 'Poigar', NULL, 'Indonesia', '443-749-7751');

CREATE TABLE shippers (
    shipper_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);

INSERT INTO shippers (company_name, phone)
VALUES ('Speedy Express', '(503) 555-9831'),
       ('United Package', '(503) 555-3199'),
       ('Federal Shipping', '(503) 555-9931');
      
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Wordtune', '947-862-9180');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Zazio', '840-386-6953');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Thoughtmix', '926-766-1845');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Tagpad', '553-514-3236');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Layo', '890-929-9372');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Aibox', '801-822-6618');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Mita', '637-466-6894');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Yozio', '170-951-9813');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Quimm', '800-336-6069');
insert into shippers (shipper_id, company_name, phone) values (DEFAULT, 'Zooxo', '855-132-1142');

CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    region_description TEXT NOT NULL
);

INSERT INTO region (region_description)
VALUES ('Eastern'), ('Western'), ('Northern'), ('Southern');

-- Then create tables that reference the above tables

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    supplier_id INTEGER REFERENCES suppliers(supplier_id),
    category_id INTEGER REFERENCES categories(category_id),
    quantity_per_unit VARCHAR(255),
    unit_price NUMERIC(14, 2) NOT NULL CHECK (unit_price >= 0),
    discontinued BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO products (product_name, supplier_id, category_id, quantity_per_unit, unit_price, discontinued)
VALUES ('Chai', 1, 7, '10 boxes x 20 bags', 18, FALSE),
       ('Chang', 1, 7, '24 - 12 oz bottles', 19, FALSE),
       ('Aniseed Syrup', 1, 8, '12 - 550 ml bottles', 10, FALSE),
       ('Chef Anton''s Cajun Seasoning', 2, 9, '48 - 6 oz jars', 22, FALSE),
       ('Chef Anton''s Gumbo Mix', 2, 7, '36 boxes', 21.35, TRUE),
       ('Grandma''s Boysenberry Spread', 3, 10, '12 - 8 oz jars', 25, FALSE),
       ('Uncle Bob''s Organic Dried Pears', 3, 10, '12 - 1 lb pkgs.', 30, FALSE);

-- units_in_stock, units_on_order ve reorder_level columns added
ALTER TABLE products
    ADD COLUMN units_in_stock INTEGER,
    ADD COLUMN units_on_order INTEGER,
    ADD COLUMN reorder_level  INTEGER;

-- units_in_stock, units_on_order ve reorder_level columns filled
UPDATE products
SET units_in_stock = FLOOR(RANDOM() * 100)::INTEGER,
    units_on_order = FLOOR(RANDOM() * 100)::INTEGER,
    reorder_level  = FLOOR(RANDOM() * 100)::INTEGER;

CREATE TABLE territories (
    territory_id VARCHAR(20) PRIMARY KEY,
    territory_description TEXT NOT NULL,
    region_id INTEGER REFERENCES region(region_id)
);

INSERT INTO territories (territory_id, territory_description, region_id)
VALUES ('01581', 'Westboro', 1),
       ('01730', 'Bedford', 1),
       ('01833', 'Georgetow', 1);
      
      
INSERT INTO territories (territory_id, territory_description, region_id)
VALUES 
('02116', 'Boston', 4),
('02139', 'Cambridge', 3),
('02184', 'Braintree', 2),
('02421', 'Lexington', 2),
('03060', 'Nashua', 3),
('03101', 'Manchester', 4),
('03301', 'Concord', 1);
        

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    title_of_courtesy VARCHAR(255),
    birth_date DATE,
    hire_date DATE,
    address TEXT,
    city VARCHAR(255),
    region VARCHAR(255),
    postal_code VARCHAR(20),
    country VARCHAR(255),
    home_phone VARCHAR(20),
    extension VARCHAR(20),
    reports_to INTEGER REFERENCES employees(employee_id)
);

INSERT INTO employees (last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension)
VALUES 
('Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '2024-05-01', '507 - 20th Ave. E. Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '1'),
('Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '2024-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '1'),
('Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '2024-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '2'),
('Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '2024-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '3'),
('Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '2024-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453'),
('Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '2024-10-17', 'Coventry House Miner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428'),
('King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '2024-01-02', 'Edgeham Hollow Winchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '3'),
('Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '2024-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '4'),
('Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '2024-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452');

CREATE TABLE customers (
    customer_id VARCHAR(5) PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_title VARCHAR(255),
    address TEXT,
    city VARCHAR(255),
    region VARCHAR(255),
    postal_code VARCHAR(20),
    country VARCHAR(255),
    phone VARCHAR(24),
    fax VARCHAR(24)
);


INSERT INTO customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax)
VALUES 
('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745'),
('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL),
('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750'),
('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67'),
('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924'),
('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32'),
('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99'),
('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41'),
('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');

      
      
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id VARCHAR(5) REFERENCES customers(customer_id),
    employee_id INTEGER REFERENCES employees(employee_id),
    order_date DATE,
    shipped_date DATE,
    ship_via INTEGER REFERENCES shippers(shipper_id),
    freight NUMERIC(14, 2) CHECK (freight >= 0),
    ship_name VARCHAR(255),
    ship_address TEXT,
    ship_city VARCHAR(255),
    ship_region VARCHAR(255),
    ship_postal_code VARCHAR(20),
    ship_country VARCHAR(255)
);

INSERT INTO orders (customer_id, employee_id, order_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
VALUES ('ALFKI', 1, '2024-07-04', '2024-07-16', 3, 32.38, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France'),
       ('ANATR', 2, '2024-07-05', '2024-07-10', 1, 11.61, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
      
INSERT INTO orders (customer_id, employee_id, order_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country)
VALUES 
('ALFKI', 1, '2024-07-04', '2024-07-16', 3, 32.38, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France'),
('ANATR', 2, '2024-07-05', '2024-07-10', 1, 11.61, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany'),
('ANTON', 3, '2024-07-06', '2024-07-12', 2, 58.17, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico'),
('AROUT', 4, '2024-07-07', '2024-07-13', 3, 22.98, 'Around the Horn', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK'),
('BERGS', 5, '2024-07-08', '2024-07-14', 1, 13.97, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden'),
('BLAUS', 6, '2024-07-09', '2024-07-15', 2, 30.26, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany'),
('BLONP', 7, '2024-07-10', '2024-07-16', 3, 40.35, 'Blondesddsl père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France'),
('BOLID', 8, '2024-07-11', '2024-07-17', 1, 50.15, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain'),
('BONAP', 9, '2024-07-12', '2024-07-18', 2, 60.28, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France'),
('BOTTM', 9, '2024-07-13', '2024-07-19', 3, 70.32, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');

-- Forgetten. Added later
ALTER TABLE orders ADD COLUMN required_date DATE;
UPDATE orders SET required_date = order_date + INTERVAL '1 day' * ROUND(RANDOM() * 30);


CREATE TABLE order_details (
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    unit_price NUMERIC(14, 2) NOT NULL CHECK (unit_price >= 0),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    discount NUMERIC(3, 2) NOT NULL CHECK (discount >= 0 AND discount <= 1)
);

INSERT INTO order_details (order_id, product_id, unit_price, quantity, discount)
VALUES 
(1, 1, 14, 12, 0),
(1, 1, 9.8, 10, 0),
(2, 2, 34.8, 5, 0),
(4, 1, 10, 7, 0),
(3, 4, 22, 5, 0),
(1, 2, 16.5, 6, 0),
(2, 3, 99, 2, 0),
(6, 2, 35, 3, 0),
(4, 1, 14.5, 10, 0),
(1, 4, 9.2, 4, 0);



CREATE TABLE employee_territories (
    employee_id INTEGER REFERENCES employees(employee_id),
    territory_id VARCHAR(20) REFERENCES territories(territory_id)
);

INSERT INTO employee_territories (employee_id, territory_id)
VALUES 
(1, '01581'),
(2, '01730'),
(1, '01833'),
(3, '02116'),
(4, '02139'),
(5, '02184'),
(6, '02421'),
(7, '03060'),
(8, '03101'),
(9, '03301');

