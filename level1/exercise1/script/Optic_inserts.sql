USE optic;

INSERT INTO optic.address (address_id, street, number, floor, door, city, zip_code, country) VALUES
(1, 'Gran Via', '123', '2', 3, 'Barcelona', '08010', 'España'),
(2, 'Calle Mayor', '45', '1', 1, 'Madrid', '28013', 'España'),
(3, 'Av. Diagonal', '234', '5', 2, 'Barcelona', '08018', 'España'),
(4, 'Calle Serrano', '78', '3', 2, 'Madrid', '28006', 'España'),
(5, 'Carrer del Sol', '15', 'Bajo', 1, 'Girona', '17001', 'España'),
(6, 'Rua Augusta', '22', '4', 3, 'Lisboa', '1100-053', 'Portugal'),
(7, 'Rue de Rivoli', '12', '2', 4, 'París', '75001', 'Francia'),
(8, 'High Street', '50', '1', 1, 'Londres', 'SW1A', 'Reino Unido'),
(9, 'Via Roma', '88', '6', 2, 'Roma', '00184', 'Italia'),
(10, 'Königsallee', '10', '3', 3, 'Düsseldorf', '40212', 'Alemania');

INSERT INTO optic.supplier (supplier_id, name, phone, fax, nif, address_id) VALUES
(1, 'OptiSpain', '+34 911223344', '+34 911223345', 'B12345678', 1),
(2, 'VisionPlus', '+34 933445566', '+34 933445567', 'B87654321', 2),
(3, 'EuroOptic', '+33 145223344', '+33 145223345', 'FR00112233', 7),
(4, 'London Glasses', '+44 2079988877', '+44 2079988878', 'UK99887766', 8),
(5, 'RomaVision', '+39 0611122233', '+39 0611122234', 'IT22334455', 9),
(6, 'German Lenses', '+49 211334455', '+49 211334456', 'DE55667788', 10),
(7, 'PortuView', '+351 211334455', '+351 211334456', 'PT33445566', 6),
(8, 'Catalunya Optics', '+34 972223344', '+34 972223345', 'B11223344', 5),
(9, 'Madrid Lens Co.', '+34 917112233', '+34 917112234', 'B55667788', 4),
(10, 'Barcelona Frames', '+34 934556677', '+34 934556678', 'B66778899', 3);


INSERT INTO optic.client (client_id, name, address, phone, mail, registration_date, recommended_client_id) VALUES
(1, 'Ana López', 'Gran Via 123, Barcelona', '600111222', 'ana@example.com', '2023-01-10', NULL),
(2, 'Carlos Pérez', 'Calle Mayor 45, Madrid', '600333444', 'carlos@example.com', '2023-02-15', 1),
(3, 'Lucía Fernández', 'Av. Diagonal 234, Barcelona', '600555666', 'lucia@example.com', '2023-03-20', 2),
(4, 'Jordi Soler', 'Carrer del Sol 15, Girona', '600777888', 'jordi@example.com', '2023-04-05', 1),
(5, 'Marta Ruiz', 'Calle Serrano 78, Madrid', '600999000', 'marta@example.com', '2023-05-12', 3),
(6, 'Pedro Gómez', 'Rua Augusta 22, Lisboa', '601111222', 'pedro@example.com', '2023-06-18', NULL),
(7, 'Clara Domènech', 'Rue de Rivoli 12, París', '601333444', 'clara@example.com', '2023-07-25', 4),
(8, 'David Martín', 'High Street 50, Londres', '601555666', 'david@example.com', '2023-08-30', 6),
(9, 'Sara Campos', 'Via Roma 88, Roma', '601777888', 'sara@example.com', '2023-09-14', 2),
(10, 'Laura Blanco', 'Königsallee 10, Düsseldorf', '601999000', 'laura@example.com', '2023-10-01', 5);

INSERT INTO optic.glasses (glasses_id, brand, lens_graduation, color_lens, glasses_frame, color_frame, price, supplier_id) VALUES
(1, 'Ray-Ban', 1.25, 'marrón', 'plastic', 'negro', 149.99, 1),
(2, 'Oakley', -0.75, 'verde', 'aluminium', 'gris', 199.50, 2),
(3, 'Prada', 2.00, 'azul', 'plastic', 'azul', 299.00, 3),
(4, 'Gucci', -1.50, 'gris', 'policarbon', 'dorado', 259.90, 4),
(5, 'Versace', 0.00, 'transparente', 'plastic', 'plateado', 179.95, 5),
(6, 'Tom Ford', 1.75, 'marrón', 'plastic', 'marrón', 220.00, 6),
(7, 'Polaroid', -2.25, 'verde', 'plastic', 'negro', 99.90, 7),
(8, 'Carrera', -1.00, 'azul', 'aluminium', 'azul', 139.90, 8),
(9, 'Armani', 0.50, 'gris', 'policarbon', 'negro', 189.00, 9),
(10, 'Maui Jim', -0.50, 'marrón', 'plastic', 'marrón', 159.99, 10);



INSERT INTO optic.sale (sale_id, name_client, name_employee, registration_sale, clients_id, glasses_id) VALUES
(1, 'Ana López', 'Laura Sánchez', '2024-01-10', 1, 1),
(2, 'Carlos Pérez', 'Miguel Torres', '2024-02-12', 2, 2),
(3, 'Lucía Fernández', 'Elena Vidal', '2024-03-03', 3, 3),
(4, 'Jordi Soler', 'Andrés Ramos', '2024-04-15', 4, 4),
(5, 'Marta Ruiz', 'Paula Jiménez', '2024-05-22', 5, 5),
(6, 'Pedro Gómez', 'Diego Navarro', '2024-06-18', 6, 6),
(7, 'Clara Domènech', 'Carla Iglesias', '2024-07-05', 7, 7),
(8, 'David Martín', 'Rubén Lozano', '2024-08-11', 8, 8),
(9, 'Sara Campos', 'Adrián Pérez', '2024-09-14', 9, 9),
(10, 'Laura Blanco', 'Marina Soto', '2024-10-01', 10, 10);

INSERT INTO optic.employee (employee_id, name_employee, sale_id) VALUES
(1, 'Laura Sánchez', 1),
(2, 'Miguel Torres', 2),
(3, 'Elena Vidal', 3),
(4, 'Andrés Ramos', 4),
(5, 'Paula Jiménez', 5),
(6, 'Diego Navarro', 6),
(7, 'Carla Iglesias', 7),
(8, 'Rubén Lozano', 8),
(9, 'Adrián Pérez', 9),
(10, 'Marina Soto', 10);

