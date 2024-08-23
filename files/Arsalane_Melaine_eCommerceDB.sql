SHOW DATABASES; -- when executed, all current databases are displayed.

CREATE DATABASE eCommerce; -- this command has created the eCommerceDB database.

SELECT DATABASE(); -- the above database has been selected.

USE eCommerce; -- the specified database is ready to be used.

CREATE TABLE tbl_products (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- INT = whole number, NOT NULL = cannot be empty, AUTO_INCREMENT = new value auto assigned to each product, PRIMARY KEY = unique and can be used in child table.
    name VARCHAR(100) NOT NULL, -- VARCHAR(100) = variable length string with given 100 character maximum.
    description TEXT NOT NULL, -- TEXT allows for large amounts of text to be stored.
    price DECIMAL(8, 2) NOT NULL, -- DECIMAL(8, 2) = decimal number including 2 decimal places and a maximum of 8 total digits.
    stock_quantity INT NOT NULL
); -- tbl_products is created with the specified column names and their parameters.

SHOW TABLES; -- all tables will be displayed.

DESC tbl_products; -- the attributes of tbl_products are presented.

DROP TABLE products_tbl; -- products_tbl was deleted.

CREATE TABLE tbl_customers (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(70) UNIQUE NOT NULL, -- UNIQUE = each email address must be unique.
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(150) NOT NULL
);

EXPLAIN tbl_customers; -- EXPLAIN has the same function as DESC above.

CREATE TABLE tbl_orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES tbl_customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
); -- customer_id collumn is retreived from tbl_customers. if deleted or updated in parent table, the child table will correspond.

DESC tbl_orders;

CREATE TABLE tbl_order_items (
    order_item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES tbl_orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES tbl_products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

EXPLAIN tbl_order_items;

INSERT INTO tbl_products (name, description, price, stock_quantity) VALUES
('Running Shoes', 'High-performance running shoes with cushioned soles.', '79.99', '17'),
('Baseball', 'Official NBA basketball for indoor and outdoor play.', '11.50', '19'),
('Yoga Mat', 'Non-slip yoga mat for comfortable workouts.', '13.75', '12'),
('Dumbells', 'Pair of 10-pound dumbbells for strength training.', '23.80', '14'),
('Tennis Racket', 'Lightweight tennis racket for beginners.', '27.75', '12'),
('Soccer Ball', 'Size 5 soccer ball suitable for practice and matches.', '8.25', '23'),
('Gym Towel', 'Absorbent microfiber gym towel.', '7.99', '20'),
('Resistance Bands', 'Set of five resistance bands for home workouts.', '9.75', '15'),
('Swimming Goggles', 'Anti-fog swimming goggles with UV protection.', '12.45', '23'),
('Baseball Glove', 'Leather baseball glove for fielding.', '11.75', '20'),
('Climbing Shoes', 'High-friction climbing shoes for bouldering and sport climbing.', '95.00', '9'),
('Cycling Helmet', 'Safety-certified helmet for cyclists.', '16.99', '15'),
('Fitness Tracker', 'Wearable device to track steps, heart rate, and calories burned.', '50.99', '18'),
('Barbell', 'Olympic-style barbell for weightlifting.', '34.00', '7'),
('Golf Clubs', 'Complete set of golf clubs for various shots.', '110.00', '7'),
('Shuttlecocks', 'Feather shuttlecocks for badminton matches.', '9.75', '17'),
('Tredmill', 'Electric treadmill for indoor running.', '157.99', '6'),
('Kettlebell', 'Cast iron kettlebell for functional fitness.', '19.75', '12'),
('Heavy Bag', 'Heavy-duty punching bag for boxing training.', '60.00', '13'),
('Boxing Gloves', 'Padded boxing gloves for sparring and training.', '37.25', '17'),
('Surfboard', 'Fiberglass surfboard for riding waves.', '69.99', '8'),
('Skates', 'Inline roller skates with sturdy frames.', '35.00', '11'),
('Skipping Rope', 'Adjustable jump rope for cardio workouts.', '10.75', '21'),
('Compound Bow', 'Compound bow for target shooting.', '83.00', '7'),
('Ping Pong Paddles', 'Professional-grade table tennis paddles.', '15.75', '20'),
('Snowboard', 'Freestyle snowboard for winter sports enthusiasts.', '48.25', '15'),
('Backpack', 'Sturdy backpack with multiple compartments for hiking.', '67.99', '16'),
('Volleyball', 'Official-size volleyball for indoor and beach play.', '9.95', '24'),
('Skateboard', 'Maple wood skateboard deck with grip tape.', '47.00', '11'),
('Wetsuit', 'Neoprene wetsuit for water sports.', '50.99', '14'),
('Harness', 'Safety harness for rock climbing.', '20.99', '9'); -- 31 rows of data inserted into specified columns in tbl_products.

DELETE from tbl_products WHERE product_id >= 1; -- all inserted data removed from table.

SELECT * FROM tbl_products; -- table with all its data is displayed.

INSERT INTO tbl_customers (first_name, last_name, email, phone_number, address) VALUES
('Clemmy', 'Bayly', 'cbayly0@lycos.com', '07464839273', '48 Michigan Parkway'),
('Chick', 'Seniour', 'cseniour1@hatena.ne.jp', '07852545691', '62629 Oakridge Point'),
('Yvonne', 'Hardingham', 'yhardingham2@goo.ne.jp', '07742091456', '291 Debs Place'),
('Daryl', 'Briant', 'dbriant3@ihg.com', '07762714287', '61 Lakeland Way'),
('Kendell', 'Sangster', 'ksangster4@mail.ru', '07411869941', '5009 Onsgard Street'),
('Heath', 'Japp', 'hjapp5@ed.gov', '07718953598', '431 Ridgeview Place'),
('Kaylil', 'Alsobrook', 'kalsobrook6@bloomberg.com', '07437387492', '943 Mcbride Park'),
('Cybil', 'Bathurst', 'cbathurst7@ucla.edu', '07827605810', '5 Hansons Lane'),
('Cristian', 'Trinkwon', 'ctrinkwon8@shop-pro.jp', '07972111095', '3 Waywood Way'),
('Farlie', 'Grimwad', 'fgrimwad9@bloomberg.com', '07846860407', '18461 6th Avenue'),
('Marquita', 'Rustidge', 'mrustidgea@cornell.edu', '07823476995', '87168 Sunnyside Trail'),
('Chrystal', 'McKinlay', 'cmckinlayb@blinklist.com', '07737869048', '270 Lakeland Pass'),
('Lockwood', 'Berkley', 'lberkleyc@linkedin.com', '07499756931', '583 Westport Lane'),
('Lorna', 'Beadnall', 'lbeadnalld@google.es', '07847309627', '23 Dorton Park'),
('Maxy', 'Walkinshaw', 'mwalkinshawe@indiegogo.com', '07879471494', '15 Union Lane'),
('Jo', 'Ewebank', 'jewebankf@blogger.com', '07763262569', '237 Lillian Hill'),
('Matelda', 'Abyss', 'mabyssg@cnbc.com', '07488337928', '12 Truax Lane'),
('Mac', 'Morton', 'mmortonh@hc360.com', '07915674393', '2400 Reinke Court'),
('Nealson', 'Bruinsma', 'nbruinsmai@hostgator.com', '07822401678', '287 Shelley Crossing'),
('Joe', 'Few', 'jfewj@techcrunch.com', '07885754582', '78 Arizona Terrace'),
('Jolie', 'Hain', 'jhaink@deliciousdays.com', '07466779188', '355 Pennsylvania Way'),
('Ignace', 'Noel', 'inoell@addthis.com', '07881224356', '74 Westerfield Street'),
('Maggy', 'Wallhead', 'mwallheadm@macromedia.com', '07779615679', '874 Wayridge Circle'),
('Fran', 'Cheater', 'fcheatern@uiuc.edu', '+07703248490', '920 Grayhawk Lane'),
('Jeanelle', 'Rosell', 'jrosello@scribd.com', '07498563022', '8 Warrior Trail'),
('Akim', 'Oliveti', 'aolivetip@msu.edu', '07993828027', '9661 Stuart Center'),
('Turner', 'Kivelhan', 'tkivelhanq@sun.com', '07721358064', '6 Morningstar Trail'),
('Benoit', 'Bray', 'bbrayr@reuters.com', '07481009498', '6522 Cottonwood Alley'),
('Charlena', 'Nyssens', 'cnyssenss@photobucket.com', '07842344071', '21352 Monterey Junction'),
('Michele', 'Swindlehurst', 'mswindlehurstt@simplemachines.org', '07882637627', '889 Arkansas Plaza'),
('Guglielma', 'Merrydew', 'gmerrydewu@fotki.com', '07835016927', '613 Little Fleur Center'),
('Vanda', 'Phorsby', 'vphorsbyv@blinklist.com', '07416509043', '62006 Pennsylvania Trail'),
('Wileen', 'Cornwall', 'wcornwallw@facebook.com', '07776547113', '52487 Mesta Crossing'),
('Aggie', 'Blackett', 'ablackettx@zdnet.com', '07821051274', '6 Mesta Road'),
('Job', 'Littlepage', 'jlittlepagey@mysql.com', '07735672584', '66 Rieder Junction'),
('Sheffie', 'Coping', 'scopingz@squarespace.com', '07467928128', '281 Havey Point'),
('Ewell', 'Furmedge', 'efurmedge10@deviantart.com', '07739124285', '3505 Blue Bill Park Pass'),
('Anderson', 'Iwanczyk', 'aiwanczyk11@vkontakte.ru', '07741346285', '3130 Bunker Hill Place'),
('Binni', 'Blacklidge', 'bblacklidge12@kickstarter.com', '07731341614', '54134 5th Junction'),
('Maybelle', 'Jessard', 'mjessard13@wikia.com', '07824954935', '0521 Heffernan Avenue'),
('Shaina', 'Clarke', 'sclarke14@usatoday.com', '07734839692', '87820 Ruskin Plaza'),
('Hobard', 'Stembridge', 'hstembridge15@networkadvertising.org', '07782868410', '1 Hanover Drive'),
('Deana', 'De Bischop', 'ddebischop16@google.nl', '07729091698', '69 Mccormick Trail'),
('Hobey', 'Cleverley', 'hcleverley17@mozilla.org', '07779258162', '86 Karstens Court'),
('Aldridge', 'Callow', 'acallow18@cmu.edu', '07756661840', '70014 Charing Cross Place');

SELECT * FROM tbl_customers;

INSERT INTO tbl_orders (customer_id, order_date, status) VALUES
(1, '2024-06-21', 'Delivered'),
(2, '2024-07-17', 'Accepted'),
(3, '2024-07-03', 'Delivered'),
(4, '2024-06-15', 'Delivered'),
(5, '2024-07-01', 'In Transit'),
(6, '2024-07-10', 'Delivered'),
(7, '2024-06-28', 'In Transit'),
(8, '2024-07-05', 'Delivered'),
(9, '2024-06-18', 'Delivered'),
(10, '2024-07-12', 'Delivered'),
(11, '2024-06-23', 'In Transit'),
(12, '2024-07-08', 'Delivered'),
(13, '2024-06-30', 'In Transit'),
(14, '2024-07-15', 'Delivered'),
(15, '2024-06-25', 'In Transit'),
(16, '2024-07-03', 'Delivered'),
(17, '2024-06-20', 'In Transit'),
(18, '2024-07-07', 'Delivered'),
(19, '2024-06-27', 'Delivered'),
(20, '2024-07-14', 'Accepted'),
(21, '2024-06-26', 'In Transit'),
(22, '2024-07-19', 'Accepted'),
(23, '2024-06-29', 'In Transit'),
(24, '2024-07-11', 'Delivered'),
(25, '2024-06-22', 'In Transit'),
(26, '2024-07-21', 'Accepted'),
(27, '2024-06-19', 'Delivered'),
(28, '2024-07-13', 'Delivered'),
(29, '2024-06-24', 'In Transit'),
(30, '2024-07-04', 'Delivered'),
(31, '2024-06-17', 'In Transit'),
(32, '2024-07-02', 'Delivered'),
(33, '2024-06-16', 'Delivered'),
(34, '2024-07-18', 'Delivered'),
(35, '2024-06-21', 'In Transit'),
(36, '2024-07-16', 'Delivered'),
(37, '2024-06-14', 'Delivered'),
(38, '2024-07-19', 'Delivered'),
(39, '2024-06-13', 'Delivered'),
(40, '2024-07-20', 'Accepted'),
(41, '2024-06-12', 'Delivered'),
(42, '2024-07-21', 'Accepted'),
(43, '2024-06-21', 'Delivered'),
(44, '2024-07-17', 'In Transit'),
(45, '2024-07-23', 'Accepted');

SELECT * FROM tbl_orders;

INSERT INTO tbl_order_items (order_id, product_id, quantity, price) VALUES
('1', '2', '1', '11.50'),
('2', '24', '1', '83.00'),
('3', '9', '2', '24.50'),
('4', '12', '2', '33.98'),
('5', '28', '1', '9.95'),
('6', '19', '3', '180.00'),
('7', '25', '2', '31.50'),
('8', '7', '1', '7.99'),
('9', '31', '2', '41.98'),
('10', '14', '2', '68.00'),
('11', '22', '1', '35.00'),
('12', '3', '1', '13.75'),
('13', '18', '2', '39.50'),
('14', '9', '1', '12.45'),
('15', '27', '1', '67.99'),
('16', '20', '2', '74.50'),
('17', '5', '1', '27.75'),
('18', '30', '3', '152.97'),
('19', '15', '1', '110.00'),
('20', '26', '1', '48.25'),
('21', '11', '1', '95.00'),
('22', '23', '2', '21.50'),
('23', '6', '5', '41.25'),
('24', '29', '2', '94.00'),
('25', '17', '2', '314.98'),
('26', '8', '1', '9.75'),
('27', '21', '3', '209.97'),
('28', '13', '2', '101.98'),
('29', '4', '1', '23.80'),
('30', '10', '3', '35.25'),
('31', '1', '2', '159.98'),
('32', '2', '1', '11.50'),
('33', '30', '1', '50.99'),
('34', '16', '2', '19.50'),
('35', '12', '1', '16.99'),
('36', '28', '6', '59.70'),
('37', '19', '2', '120.00'),
('38', '25', '1', '15.75'),
('39', '7', '3', '23.97'),
('40', '31', '2', '41.98'),
('41', '14', '1', '34.00'),
('42', '6', '3', '24.75'),
('43', '22', '1', '35.00'),
('44', '4', '2', '47.60'),
('45', '11', '1', '95.00');

SELECT * FROM tbl_order_items;

UPDATE tbl_products -- stock_quantity to be updated in tbl_products
SET stock_quantity = stock_quantity - ( -- stock_quantity is subtracted by the total of each product_ids quantity(item ordered) in tbl_order_items.
    SELECT SUM(quantity)
    FROM tbl_order_items
    WHERE tbl_order_items.product_id = tbl_products.product_id -- the calculation is performed where product_ids match in both tables.
); 

SELECT product_id, SUM(quantity) AS total_sales -- each products total quantity ordered is calculated using SUM function and stored as total_sales.
FROM tbl_order_items -- product_id and quantity columns are selected from tbl_order_items.
GROUP BY product_id -- data is grouped using the product_id column.
ORDER BY total_sales DESC; -- data is presented in descending order with reguardes to total_sales.

SELECT SUM(price) / (SELECT COUNT(*) FROM tbl_order_items) AS average_spend
FROM tbl_order_items; -- total of price column is divided by rows total in tbl_order_items, giving an average spend per customer.