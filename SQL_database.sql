CREATE DATABASE IF NOT EXISTS petshop_db;
USE petshop_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user'
);

INSERT INTO users (first_name, last_name, email, password, role) VALUES 
('Simona', 'Scerra', 'admin@petshop.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin'),
('Nazar', 'Prylypko', 'user@petshop.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'user');

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    iva INT NOT NULL DEFAULT 22,
    quantity INT NOT NULL DEFAULT 0,
    image VARCHAR(255) DEFAULT 'images/logo.png'
);

INSERT INTO products (name, description, price, iva, quantity, image) VALUES 
('Royal Canin Dry Food', 'Premium dry food for adult dogs', 45.90, 22, 20, 'images/royal_canin.png'),
('Almo Nature Wet Food', 'Premium wet food for cats chicken flavor', 2.50, 22, 100, 'images/almo.png'),
('Seresto Flea Collar', 'Flea and tick collar for cats and dogs', 32.00, 22, 15, 'images/seresto.png'),
('Cat Scratching Post', 'Cardboard scratching post with catnip included', 12.99, 22, 8, 'images/scratcher.png');

CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Processing',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    historical_price DECIMAL(10, 2) NOT NULL,
    historical_iva INT NOT NULL DEFAULT 22,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
