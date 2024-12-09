DROP DATABASE IF EXISTS `autoflixx`;
CREATE DATABASE IF NOT EXISTS `autoflixx`;
USE `autoflixx`;
CREATE TABLE movie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    sinopsis TEXT,
    posterImg VARCHAR(255),
    bannerImg VARCHAR(255),
    fechaPub DATE,
    genero VARCHAR(255),
    disponible BOOLEAN,
    duracion INT,
    director VARCHAR(255),
    cast TEXT,
    trailerUrl VARCHAR(255)
);

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    amount INT,
    imagen VARCHAR(255)
);

CREATE TABLE spots_entradas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    columna INT,
    fila INT,
    price INT,
    isAvailable BOOLEAN
);

CREATE TABLE compra (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    parking_spot_id INT,
    movie_id INT,
    FOREIGN KEY (parking_spot_id) REFERENCES spots_entradas(id) ON DELETE SET NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE SET NULL
);

CREATE TABLE confiteria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    disponible INT,
    categoria VARCHAR(255),
    imagen VARCHAR(255)
);

CREATE TABLE compra_product (
    compra_id BIGINT,
    product_id INT,
    PRIMARY KEY (compra_id, product_id),
    FOREIGN KEY (compra_id) REFERENCES compra(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
);

CREATE TABLE movie_spots (
    movie_id INT,
    spots_entradas_id INT,
    PRIMARY KEY (movie_id, spots_entradas_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id) ON DELETE CASCADE,
    FOREIGN KEY (spots_entradas_id) REFERENCES spots_entradas(id) ON DELETE CASCADE
);


-- Insert into movie table
-- Insert into movie table (Movie 1: Grease)
INSERT INTO movie (nombre, sinopsis, posterImg, bannerImg, fechaPub, genero, disponible, duracion, director, cast, trailerUrl) 
VALUES 
('Grease', 'En los años 50, Danny y Sandy viven un romance de verano que parece terminar al regresar a la escuela. Sin embargo, cuando Sandy inesperadamente se une al mismo instituto, ambos deben lidiar con las diferencias entre sus estilos de vida y las presiones sociales de la época.', 'PELI-03.png', 'BAN-PEL-03.png', '2024-10-08', 'Musical', TRUE, 110, 'Randal Kleiser', 'John Travolta, Olivia Newton-John', 'https://www.youtube.com/embed/THd96gHV7Tg?si=ZLQz9oxtLDBN_uTm'),

-- Movie 2: Deadpool
('Deadpool', 'Wade Wilson, un ex mercenario convertido en antihéroe, adquiere habilidades extraordinarias tras un experimento fallido que le deja desfigurado. Con su humor sarcástico y sed de venganza, Deadpool busca al hombre responsable de su transformación mientras enfrenta desafíos cómicos y violentos.', 'PELI-02.png', 'BAN-PEL-02.png', '2024-10-08', 'Acción, Comedia', TRUE, 108, 'Tim Miller', 'Ryan Reynolds, Morena Baccarin', 'https://www.youtube.com/embed/0JnRdfiUMa8?si=fIZnOYZYubhabTcz'),

-- Movie 3: Home Alone
('Home Alone', 'Kevin McCallister, un niño de ocho años, accidentalmente se queda solo en casa cuando su familia se va de vacaciones navideñas. Aprovecha su independencia hasta que dos ladrones intentan robar su casa, y Kevin usa toda su creatividad para defenderse y proteger su hogar.', 'PELI-06.png', NULL, '2024-10-08', 'Comedia, Familia', FALSE, 103, 'Chris Columbus', 'Macaulay Culkin, Joe Pesci', 'https://www.youtube.com/embed/jEDaVHmw7r4?si=XbyX6wJImMkGiJm0'),

-- Movie 4: Oppenheimer
('Oppenheimer', 'La película narra la vida de J. Robert Oppenheimer, el físico teórico que dirigió el desarrollo de la bomba atómica durante el Proyecto Manhattan. A través de su historia, se exploran las implicaciones éticas y personales de crear una de las armas más destructivas de la historia.', 'PELI-05.png', 'BAN-PEL-05.png', '2024-10-08', 'Drama, Historia', TRUE, 180, 'Christopher Nolan', 'Cillian Murphy, Emily Blunt', 'https://www.youtube.com/embed/gMPEbJQun68?si=shFoeC6x8VVygnu0'),

-- Movie 5: La La Land
('La La Land', 'En Los Ángeles, la aspirante a actriz Mia y el pianista de jazz Sebastian se conocen y comienzan una relación. Mientras luchan por cumplir sus sueños artísticos, su amor es puesto a prueba por las decisiones y sacrificios necesarios para alcanzar el éxito.', 'PELI-04.png', 'BAN-PEL-04.png', '2024-10-08', 'Drama, Romance', TRUE, 128, 'Damien Chazelle', 'Emma Stone, Ryan Gosling', 'https://www.youtube.com/embed/0pdqf4P9MB8?si=vc-tinuu7bo01Mr1'),

-- Movie 6: Alien
('Alien', 'La tripulación de la nave espacial Nostromo responde a una señal de socorro en un planeta remoto, solo para descubrir una forma de vida alienígena mortal. Atrapados y enfrentándose a un enemigo desconocido, deberán luchar por su supervivencia en un entorno aterrador e implacable.', 'PELI-01.png', NULL, '2024-10-08', 'Horror, Sci-Fi', FALSE, 117, 'Ridley Scott', 'Sigourney Weaver, Tom Skerritt', 'https://www.youtube.com/embed/5nWH2Pd-x-c?si=t8H0VkmYEzhhn46_');
-- Insert into product table
INSERT INTO product (nombre, precio, amount, imagen) 
VALUES 
('Popcorn', 5.50, 1, 'popcorn.jpg'),
('Soda', 3.00, 2, 'soda.jpg'),
('Candy', 2.50, 3, 'candy.jpg');

-- Insert into spots_entradas table
INSERT INTO spots_entradas (columna, fila, price, isAvailable) 
VALUES 
(1, 1, 50, TRUE),
(2, 1, 50, FALSE),
(1, 2, 50, TRUE);

-- Insert into compra table
INSERT INTO compra (parking_spot_id, movie_id) 
VALUES 
(1, 1),
(2, 2);

-- Insert into confiteria table
INSERT INTO confiteria (nombre, descripcion, precio, disponible, categoria, imagen) 
VALUES 
('Promo de 2 palomitas + 2 bebidas + M&M''s', 'Palomitas grandes, dos bebidas gaseosas y un chocolate M&M''s.', 45.00, 1, 'Promocion', 'PROM-01.png'),
('Promo de palomitas + 2 bebidas + nuggets', 'Palomitas grandes, dos bebidas gaseosas y una porción de nuggets.', 55.00, 1, 'Promocion', 'PROM-02.png'),
('Promo de 2 palomitas + 2 bebidas', 'Dos palomitas grandes y dos bebidas gaseosas.', 64.00, 1, 'Promocion', 'PROM-03.png'),
('Promo de papas fritas (Lay''s, Inka y Doritos)', 'Paquetes de papas fritas Lay''s, Doritos y Papas Ricas.', 24.00, 1, 'Promocion', 'PROM-04.png'),
('Promo de palomitas + 1 bebida + Doritos + KitKat', 'Palomitas grandes, una bebida gaseosa, un dorito grande y un KitKat.', 38.50, 1, 'Promocion', 'PROM-05.png'),
('Promo de hamburguesa doble + papas fritas + bebida', 'Doble hamburguesa con queso, una porción de papas fritas y una bebida.', 38.90, 1, 'Combo', 'COM-01.png'),
('Palomitas + 1 bebida', 'Palomitas grandes y una bebida gaseosa.', 38.50, 1, 'Combo', 'COM-02.png'),
('Promo de pizza + 2 bebidas', 'Pizza familiar con dos bebidas gaseosas.', 43.90, 1, 'Combo', 'COM-03.png'),
('M&M''s', 'Paquete de M&M''s.', 8.00, 1, 'Golosina', 'DUL-01.png');


-- Insert into compra_product join table
INSERT INTO compra_product (compra_id, product_id) 
VALUES 
(1, 1),
(1, 2),
(2, 3);

-- Insert into movie_spots join table
INSERT INTO movie_spots (movie_id, spots_entradas_id) 
VALUES 
(1, 1),
(2, 2),
(2, 3);


