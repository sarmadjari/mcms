# Clean the database server before starting (Fresh start)
DROP DATABASE IF EXISTS `customers_db`;
DROP USER IF EXISTS 'customers_admin'@'localhost', 'customers_mngr'@'%';

# Creat database and users if not exsists (if the above cleaning is not used)
CREATE DATABASE IF NOT EXISTS `customers_db`;
CREATE USER IF NOT EXISTS  'customers_admin'@'localhost' IDENTIFIED BY 'my-secret-pw';
CREATE USER IF NOT EXISTS  'customers_mngr'@'%' IDENTIFIED BY 'my-secret-pw';
GRANT ALL PRIVILEGES ON customers_db.* TO 'customers_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON customers_db.* TO 'customers_mngr'@'%';
FLUSH PRIVILEGES;

# Create table
USE `customers_db`;
DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `customers` (`customer_name`,`customer_email`,`customer_contact`,`customer_address`,`country`)
VALUES
  ("Ishmael Ingram","suscipit@protonmail.org","158-8034","Ap #200-4574 Lectus Rd.","Turkey"),
  ("Odysseus Peck","velit.in@hotmail.org","1-738-880-8788","Ap #318-9460 Aliquam Avenue","Belgium"),
  ("Steven Hunt","et.ultrices@yahoo.couk","1-436-442-7013","6089 Nisl. Street","Indonesia"),
  ("Bruce David","tortor@icloud.com","746-1775","P.O. Box 903, 6143 In Av.","Spain"),
  ("Jocelyn Snow","magna@aol.couk","1-924-642-8541","596-4448 Semper Ave","United Kingdom"),
  ("Abraham Salinas","lorem.eget.mollis@yahoo.couk","1-384-437-2157","Ap #201-3975 Dolor Rd.","Brazil"),
  ("Bell Peters","suscipit.est.ac@hotmail.net","751-5551","Ap #679-8276 Luctus Ave","Sweden"),
  ("Cullen Ward","enim.mi@hotmail.ca","491-6837","Ap #461-128 Molestie Avenue","Australia"),
  ("Nigel Morales","a.facilisis.non@google.net","1-657-844-3621","107-936 Proin St.","Costa Rica"),
  ("Kalia Webster","donec@aol.edu","1-412-353-8591","4940 Diam Street","Turkey"),
  ("Murphy Mayer","in.faucibus@google.com","1-357-380-3845","P.O. Box 521, 1407 Ac St.","Chile"),
  ("Imani Le","nec.urna@hotmail.ca","286-0238","154-7297 A Av.","Sweden"),
  ("Lawrence Mccullough","rhoncus@google.net","1-108-776-4552","138-2314 Ullamcorper, Avenue","Germany"),
  ("Celeste Lara","convallis.convallis@outlook.org","772-0816","2453 Lorem Avenue","Mexico"),
  ("Arden Houston","donec@outlook.couk","706-8400","Ap #550-5387 Id, Rd.","United States");