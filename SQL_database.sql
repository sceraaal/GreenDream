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
('Simona', 'Sceral', 'admin@petshop.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin'),
('Nazar', 'Prylypko', 'user@petshop.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'user');

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    iva INT NOT NULL DEFAULT 22,
    quantity INT NOT NULL DEFAULT 0,
    image VARCHAR(500) DEFAULT 'images/logo.png',
    category VARCHAR(30) NOT NULL DEFAULT 'cane'
);

INSERT INTO products (name, description, price, iva, quantity, image, category) VALUES
-- ===== CANE =====
('Crocchette Royal Canin Medium Adult', 'Crocchette complete per cani adulti di taglia media a base di pollo e riso. Saziano senza appesantire e aiutano a mantenere il pelo lucido giorno dopo giorno.', 45.90, 22, 20, 'https://placehold.co/600x400/3a7bd5/ffffff?text=Crocchette+Cane', 'cane'),
('Guinzaglio retrattile Flexi 5m', 'Guinzaglio allungabile fino a 5 metri con impugnatura comoda e nastro robusto. Lascia spazio al cane durante la passeggiata tenendolo sempre sotto controllo.', 24.50, 22, 30, 'https://placehold.co/600x400/3a7bd5/ffffff?text=Guinzaglio', 'cane'),
('Osso da masticare in pelle bovina', 'Osso pressato pensato per chi mastica senza sosta. Tiene impegnato il cane per ore e lo aiuta a mantenere i denti puliti.', 6.90, 22, 50, 'https://placehold.co/600x400/3a7bd5/ffffff?text=Osso', 'cane'),
('Cuccia imbottita con bordo rialzato', 'Cuccia morbida con sponda di sostegno e fondo antiscivolo, completamente sfoderabile e lavabile. Il posto perfetto dove crollare dopo il parco.', 39.99, 22, 12, 'https://placehold.co/600x400/3a7bd5/ffffff?text=Cuccia', 'cane'),

-- ===== GATTO =====
('Almo Nature cibo umido al pollo', 'Bocconcini di pollo in brodo, senza coloranti né conservanti aggiunti. Una ricetta semplice che mette d''accordo anche i gatti più difficili.', 2.50, 22, 100, 'https://placehold.co/600x400/e08a3c/ffffff?text=Umido+Gatto', 'gatto'),
('Tiragraffi in cartone con erba gatta', 'Tiragraffi in cartone ondulato con bustina di erba gatta inclusa. Salva il divano e dà al gatto il suo angolo dove farsi le unghie.', 12.99, 22, 18, 'https://placehold.co/600x400/e08a3c/ffffff?text=Tiragraffi', 'gatto'),
('Lettiera agglomerante 10L', 'Lettiera in argilla naturale ad alta assorbenza che trattiene gli odori a lungo. Forma grumi compatti e si pulisce in un attimo ogni giorno.', 8.40, 22, 40, 'https://placehold.co/600x400/e08a3c/ffffff?text=Lettiera', 'gatto'),
('Set 3 topolini con sonaglio', 'Tre topolini morbidi con sonaglio interno e codina di corda. Risvegliano la voglia di caccia anche nel gatto più pigro del divano.', 4.99, 22, 60, 'https://placehold.co/600x400/e08a3c/ffffff?text=Topolini', 'gatto'),

-- ===== PICCOLI ANIMALI =====
('Mangime completo per conigli nani', 'Misto di fieno, verdure ed erbe per conigli nani, ricco di fibre. Favorisce la digestione e il corretto consumo dei dentini.', 7.20, 22, 35, 'https://placehold.co/600x400/2e9e5b/ffffff?text=Conigli', 'piccoli-animali'),
('Ruota silenziosa per criceti', 'Ruota da corsa con base stabile e superficie chiusa, sicura per le zampe. Lascia che il criceto sfoghi le sue energie anche di notte.', 9.90, 22, 25, 'https://placehold.co/600x400/2e9e5b/ffffff?text=Ruota', 'piccoli-animali'),
('Mangiatoia per uccelli da gabbia', 'Mangiatoia in plastica resistente con aggancio rapido alle sbarre. Tiene i semi in ordine e riduce gli sprechi nella gabbia.', 3.50, 22, 45, 'https://placehold.co/600x400/2e9e5b/ffffff?text=Mangiatoia', 'piccoli-animali'),
('Beverino a goccia 500ml', 'Beverino antigoccia con valvola in acciaio per roditori e conigli. Mantiene l''acqua pulita e sempre a disposizione.', 5.60, 22, 30, 'https://placehold.co/600x400/2e9e5b/ffffff?text=Beverino', 'piccoli-animali');

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

USE petshop_db; SELECT id, name, category FROM products;