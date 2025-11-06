USE pizza_store;


INSERT INTO category (name)
VALUES
('Pizza clásica'),
('Pizza gourmet'),
('Hamburguesa'),
('Bebida'),
('Complemento'),
('Postre'),
('Vegana'),
('Sin gluten'),
('Infantil'),
('Especial de temporada');

INSERT INTO province (name)
VALUES
('Madrid'),
('Barcelona'),
('Valencia'),
('Sevilla'),
('Bilbao'),
('Zaragoza'),
('Málaga'),
('Murcia'),
('Valladolid'),
('Alicante');

INSERT INTO city (name, province_id)
VALUES
('Madrid', 1),
('Alcalá de Henares', 1),
('Barcelona', 2),
('Badalona', 2),
('Valencia', 3),
('Torrent', 3),
('Sevilla', 4),
('Dos Hermanas', 4),
('Bilbao', 5),
('Santurce', 5);

INSERT INTO client (name, surname, address, zip_code, phone, city_id)
VALUES
('Carlos', 'López', 'Calle Mayor 12', '28013', '600111222', 1),
('María', 'Gómez', 'Av. Cataluña 3', '28805', '600222333', 2),
('Javier', 'Martín', 'C/ Mallorca 50', '08029', '600333444', 3),
('Lucía', 'Pérez', 'C/ Mar 10', '08912', '600444555', 4),
('Ana', 'Ruiz', 'Av. del Puerto 22', '46021', '600555666', 5),
('Sergio', 'Fernández', 'C/ Cervantes 8', '46900', '600666777', 6),
('Laura', 'Torres', 'C/ Feria 4', '41003', '600777888', 7),
('Raúl', 'Díaz', 'C/ Sol 15', '41700', '600888999', 8),
('Patricia', 'Santos', 'C/ Iparraguirre 9', '48010', '600999000', 9),
('Miguel', 'Vega', 'C/ Portugalete 6', '48980', '601000111', 10);

INSERT INTO store (address, zip_code, city_id)
VALUES
('C/ Atocha 45', '28012', 1),
('C/ Marina 8', '08025', 3),
('Av. del Puerto 100', '46022', 5),
('C/ Sierpes 14', '41004', 7),
('C/ Gran Vía 22', '48001', 9),
('C/ Independencia 9', '50008', 6),
('C/ Larios 15', '29005', 7),
('C/ Salzillo 7', '30001', 8),
('C/ Constitución 11', '47001', 9),
('C/ Maisonnave 5', '03003', 10);

INSERT INTO employee (store_id, name, surname, nif, phone, role)
VALUES
(1, 'Pedro', 'Sanz', '12345678A', '611111111', 'cooker'),
(1, 'David', 'Morales', '12345679B', '611111112', 'rider'),
(2, 'Elena', 'Ramos', '12345680C', '611111113', 'cooker'),
(2, 'Alberto', 'Iglesias', '12345681D', '611111114', 'rider'),
(3, 'Rosa', 'Navarro', '12345682E', '611111115', 'cooker'),
(3, 'Hugo', 'Serrano', '12345683F', '611111116', 'rider'),
(4, 'Marta', 'Prieto', '12345684G', '611111117', 'cooker'),
(4, 'Jorge', 'Luna', '12345685H', '611111118', 'rider'),
(5, 'Nerea', 'Campos', '12345686I', '611111119', 'cooker'),
(5, 'Luis', 'Mendoza', '12345687J', '611111120', 'rider');

INSERT INTO orders (client_id, store_id, rider_id, order_type, delivery_date, total_price, employee_id)
VALUES
(1, 1, 2, 'delivery', '2025-11-03 21:00:00', 20.50, 1),
(2, 1, NULL, 'pickup', '2025-11-02 20:00:00', 12.00, 1),
(3, 2, 4, 'delivery', '2025-11-01 19:30:00', 18.00, 3),
(4, 3, 6, 'delivery', '2025-11-03 21:15:00', 23.50, 5),
(5, 3, NULL, 'pickup', '2025-11-03 18:45:00', 15.00, 5),
(6, 4, 8, 'delivery', '2025-11-02 22:00:00', 19.00, 7),
(7, 4, NULL, 'pickup', '2025-11-01 20:15:00', 9.00, 7),
(8, 5, 10, 'delivery', '2025-11-03 22:00:00', 22.00, 9),
(9, 5, NULL, 'pickup', '2025-11-02 21:30:00', 11.50, 9),
(10, 1, 2, 'delivery', '2025-11-03 21:45:00', 24.00, 1);


INSERT INTO product (name, description, image, price, category_id, type)
VALUES
('Pizza Margarita', 'Tomate, mozzarella y albahaca fresca', 'margarita.jpg', 8.50, 1, 'pizza'),
('Pizza Barbacoa', 'Carne, cebolla y salsa barbacoa', 'barbacoa.jpg', 10.50, 1, 'pizza'),
('Pizza 4 Quesos', 'Mozzarella, gorgonzola, parmesano y emmental', '4quesos.jpg', 9.90, 2, 'pizza'),
('Hamburguesa Clásica', 'Carne de vacuno con lechuga, tomate y queso', 'hamburguesa.jpg', 7.50, 3, 'hamburger'),
('Hamburguesa Vegana', 'Soja, aguacate y pan integral', 'vegana.jpg', 8.00, 7, 'hamburger'),
('Coca-Cola', 'Refresco de cola 33cl', 'cocacola.jpg', 2.00, 4, 'drink'),
('Agua Mineral', 'Agua natural embotellada 50cl', 'agua.jpg', 1.50, 4, 'drink'),
('Pan de Ajo', 'Pan horneado con mantequilla y ajo', 'panajo.jpg', 3.00, 5, 'pizza'),
('Tiramisú', 'Postre italiano con mascarpone y cacao', 'tiramisu.jpg', 4.50, 6, 'pizza'),
('Pizza Pepperoni', 'Mozzarella, tomate y pepperoni', 'pepperoni.jpg', 9.50, 1, 'pizza');

INSERT INTO orders_product (orders_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 6, 2),
(2, 2, 1),
(3, 4, 2),
(4, 3, 1),
(4, 9, 1),
(5, 10, 1),
(6, 5, 2),
(7, 8, 1),
(8, 1, 1),
(8, 7, 1),
(9, 2, 1),
(10, 3, 1),
(10, 6, 2);