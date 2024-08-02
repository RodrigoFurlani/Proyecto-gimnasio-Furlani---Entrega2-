-- TABLAs DE CREACION DE BASE DE DATOS --
-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS proyecto_gimnasio;
USE proyecto_gimnasio;

-- Crear tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    apellido VARCHAR(200) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE,
    telefono VARCHAR(30) NOT NULL,
    cuil VARCHAR(200) NOT NULL
);

-- Crear tabla Empleados
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Crear tabla Membresias
CREATE TABLE Membresias (
    id_membresia INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    duracion_meses INT NOT NULL
);

-- Crear tabla Entrenadores
CREATE TABLE Entrenadores (
    id_entrenador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(15) NOT NULL
);

-- Crear tabla Clases
CREATE TABLE Clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    id_entrenador INT,
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

-- Crear tabla LogsClientes
CREATE TABLE LogsClientes (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    operacion VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla Inscripciones
CREATE TABLE Inscripciones (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_clase INT,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- Crear tabla Pagos
CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_membresia INT,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_membresia) REFERENCES Membresias(id_membresia)
);

-- Crear tabla Equipos
CREATE TABLE Equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_entrenador INT,
    nombre VARCHAR(100) NOT NULL,
    marca VARCHAR(100),
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

-- Crear tabla Rutinas
CREATE TABLE Rutinas (
    id_rutina INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_entrenador INT,
    descripcion TEXT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_entrenador) REFERENCES Entrenadores(id_entrenador)
);

-- Crear tabla Horarios
CREATE TABLE Horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_clase INT,
    dia_semana VARCHAR(20) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- Crear tabla Asistencias
CREATE TABLE Asistencias (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_clase INT,
    fecha DATE NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- Crear tabla Reservas
CREATE TABLE Reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_clase INT,
    fecha_reserva DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- Crear tabla Servicios
CREATE TABLE Servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    id_cliente INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Crear tabla Contrataciones
CREATE TABLE Contrataciones (
    id_contratacion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_servicio INT,
    fecha_contratacion DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES Servicios(id_servicio)
);

-- Crear tabla Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_pago INT,
    fecha_emision DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pago) REFERENCES Pagos(id_pago)
);

-- Crear tabla Feedback
CREATE TABLE Feedback (
    id_feedback INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_clase INT,
    calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
    comentario TEXT,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);

-- INSERCION DE DATOS DE LA BASE DE DATOS 

USE proyecto_gimnasio;

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (id_cliente, nombre, apellido, fecha_nacimiento, email, telefono, cuil)
VALUES 
(1,'Juan', 'Perez', '1985-06-15', 'juan.perez@example.com', '123456789', '20-12345678-9'),
(2,'Maria', 'Lopez', '1990-11-20', 'maria.lopez@example.com', '987654321', '27-98765432-1'),
(3,'Carlos', 'Sanchez', '1978-03-12', 'carlos.sanchez@example.com', '555123456', '20-55512345-6'),
(4,'Ana', 'Gomez', '1983-08-22', 'ana.gomez@example.com', '444987654', '27-44498765-4'),
(5,'Luis', 'Martinez', '1991-07-18', 'luis.martinez@example.com', '123123123', '20-12312312-3'),
(6,'Laura', 'Fernandez', '1987-09-23', 'laura.fernandez@example.com', '456456456', '27-45645645-6'),
(7,'Miguel', 'Rodriguez', '1980-12-05', 'miguel.rodriguez@example.com', '789789789', '20-78978978-9'),
(8,'Sofia', 'Gonzalez', '1995-02-14', 'sofia.gonzalez@example.com', '321321321', '27-32132132-1'),
(9,'Pablo', 'Ramirez', '1982-03-29', 'pablo.ramirez@example.com', '654654654', '20-65465465-4'),
(10,'Andrea', 'Torres', '1989-06-17', 'andrea.torres@example.com', '987987987', '27-98798798-7'),
(11,'Jorge', 'Diaz', '1981-08-11', 'jorge.diaz@example.com', '147147147', '20-14714714-7'),
(12,'Natalia', 'Vega', '1993-10-21', 'natalia.vega@example.com', '258258258', '27-25825825-8'),
(13,'Fernando', 'Gutierrez', '1977-04-07', 'fernando.gutierrez@example.com', '369369369', '20-36936936-9'),
(14,'Camila', 'Silva', '1992-11-15', 'camila.silva@example.com', '123123124', '27-12312312-4'),
(15,'Diego', 'Morales', '1986-01-30', 'diego.morales@example.com', '456456457', '20-45645645-7'),
(16,'Valeria', 'Herrera', '1984-05-25', 'valeria.herrera@example.com', '789789788', '27-78978978-8'),
(17,'Martin', 'Rojas', '1991-09-19', 'martin.rojas@example.com', '321321322', '20-32132132-2'),
(18,'Lucia', 'Mendoza', '1988-07-26', 'lucia.mendoza@example.com', '654654655', '27-65465465-5'),
(19,'Florencia', 'Ortiz', '1983-03-05', 'florencia.ortiz@example.com', '147147148', '27-14714714-8'),
(20,'Sebastian', 'Romero', '1987-10-16', 'sebastian.romero@example.com', '258258259', '20-25825825-9'),
(22,'Julia', 'Sosa', '1996-08-02', 'julia.sosa@example.com', '369369360', '27-36936936-0'),
(23,'Marcos', 'Ruiz', '1979-06-20', 'marcos.ruiz@example.com', '123123125', '20-12312312-5'),
(24,'Paula', 'Navarro', '1990-11-30', 'paula.navarro@example.com', '456456458', '27-45645645-8'),
(25,'Ricardo', 'Ibarra', '1985-02-22', 'ricardo.ibarra@example.com', '789789789', '20-78978978-9'),
(26,'Elena', 'Farias', '1992-05-18', 'elena.farias@example.com', '321321323', '27-32132132-3'),
(27,'Oscar', 'Pereyra', '1980-07-29', 'oscar.pereyra@example.com', '654654656', '20-65465465-6'),
(28,'Gabriela', 'Mendez', '1989-12-14', 'gabriela.mendez@example.com', '987987989', '27-98798798-9'),
(29,'Victor', 'Alvarez', '1986-09-08', 'victor.alvarez@example.com', '147147149', '20-14714714-9'),
(30,'Carolina', 'Ramos', '1993-06-03', 'carolina.ramos@example.com', '258258260', '27-25825826-0'),
(31,'Rodrigo', 'Cabrera', '1982-03-27', 'rodrigo.cabrera@example.com', '369369361', '20-36936936-1'),
(32,'Patricia', 'Juarez', '1981-10-17', 'patricia.juarez@example.com', '123123126', '27-12312312-6'),
(33,'Ignacio', 'Benitez', '1995-04-09', 'ignacio.benitez@example.com', '456456459', '20-45645645-9'),
(34,'Cecilia', 'Aguirre', '1984-02-28', 'cecilia.aguirre@example.com', '789789780', '27-78978978-0'),
(35,'Rafael', 'Nieto', '1987-05-23', 'rafael.nieto@example.com', '321321324', '20-32132132-4'),
(36,'Lorena', 'Salinas', '1990-08-11', 'lorena.salinas@example.com', '654654657', '27-65465465-7'),
(37,'Francisco', 'Campos', '1983-12-26', 'francisco.campos@example.com', '987987980', '20-98798798-0'),
(38,'Alicia', 'Luna', '1988-01-15', 'alicia.luna@example.com', '147147150', '27-14714715-0'),
(39,'Gustavo', 'Escobar', '1978-11-30', 'gustavo.escobar@example.com', '258258261', '20-25825826-1'),
(40,'Marta', 'Brito', '1986-07-20', 'marta.brito@example.com', '369369362', '27-36936936-2'),
(41,'Felipe', 'Acosta', '1991-03-06', 'felipe.acosta@example.com', '123123127', '20-12312312-7'),
(42,'Angela', 'Molina', '1994-05-27', 'angela.molina@example.com', '456456460', '27-45645646-0'),
(43,'Manuel', 'Paz', '1981-02-10', 'manuel.paz@example.com', '789789781', '20-78978978-1'),
(44,'Ines', 'Arce', '1985-09-25', 'ines.arce@example.com', '321321325', '27-32132132-5'),
(45,'Alberto', 'Rico', '1993-11-22', 'alberto.rico@example.com', '654654658', '20-65465465-8'),
(46,'Veronica', 'Ledesma', '1982-07-31', 'veronica.ledesma@example.com', '987987981', '27-98798798-1'),
(47,'Alejandro', 'Ortega', '1989-04-13', 'alejandro.ortega@example.com', '147147151', '20-14714715-1'),
(48,'Romina', 'Guerra', '1996-06-18', 'romina.guerra@example.com', '258258262', '27-25825826-2'),
(49,'Mariano', 'Serra', '1979-01-02', 'mariano.serra@example.com', '369369363', '20-36936936-3'),
(50,'Monica', 'Delgado', '1992-10-29', 'monica.delgado@example.com', '123123128', '27-12312312-8'),
(51,'Roberto', 'Ferrer', '1987-03-16', 'roberto.ferrer@example.com', '456456461', '20-45645646-1'),
(52,'Adriana', 'Mendez', '1986-04-14', 'adriana.mendez@example.com', '789789782', '27-78978978-2'),
(53,'Esteban', 'Pereira', '1982-05-10', 'esteban.pereira@example.com', '321321326', '20-32132132-6'),
(54,'Federico', 'Garcia', '1984-11-21', 'federico.garcia@example.com', '654654659', '20-65465465-9'),
(55,'Ariana', 'Serrano', '1991-08-15', 'ariana.serrano@example.com', '987987982', '27-98798798-2'),
(56,'Hernan', 'Palacios', '1987-09-07', 'hernan.palacios@example.com', '147147152', '20-14714715-2'),
(57,'Julia', 'Cruz', '1986-12-19', 'julia.cruz@example.com', '258258263', '27-25825826-3'),
(58,'Marcelo', 'Benitez', '1985-05-12', 'marcelo.benitez@example.com', '369369364', '20-36936936-4'),
(59,'Sabrina', 'Salazar', '1993-01-18', 'sabrina.salazar@example.com', '123123129', '27-12312312-9'),
(60,'Luciano', 'Moreno', '1988-02-20', 'luciano.moreno@example.com', '456456462', '20-45645646-2'),
(61,'Paola', 'Escudero', '1990-11-09', 'paola.escudero@example.com', '789789783', '27-78978978-3'),
(62,'Martin', 'Quiroga', '1989-04-02', 'martin.quiroga@example.com', '321321327', '20-32132132-7'),
(63,'Diana', 'Coria', '1992-06-30', 'diana.coria@example.com', '654654660', '27-65465466-0'),
(64,'Ramon', 'Rosales', '1983-08-12', 'ramon.rosales@example.com', '987987983', '20-98798798-3'),
(65,'Miriam', 'Franco', '1984-10-24', 'miriam.franco@example.com', '147147153', '27-14714715-3'),
(66,'Eduardo', 'Castro', '1979-12-29', 'eduardo.castro@example.com', '258258264', '20-25825826-4'),
(67,'Patricia', 'Villalba', '1985-03-15', 'patricia.villalba@example.com', '369369365', '27-36936936-5'),
(68,'Enrique', 'Barrios', '1982-07-22', 'enrique.barrios@example.com', '123123130', '20-12312313-0'),
(69,'Silvia', 'Montes', '1986-11-11', 'silvia.montes@example.com', '456456463', '27-45645646-3'),
(70,'Javier', 'Mejia', '1983-01-13', 'javier.mejia@example.com', '789789784', '20-78978978-4'),
(71,'Cynthia', 'Ponce', '1988-04-18', 'cynthia.ponce@example.com', '321321328', '27-32132132-8'),
(72,'Cristian', 'Rivas', '1994-12-28', 'cristian.rivas@example.com', '654654661', '20-65465466-1'),
(73,'Paula', 'Brizuela', '1991-09-03', 'paula.brizuela@example.com', '987987984', '27-98798798-4'),
(74,'Ricardo', 'Oliva', '1987-06-14', 'ricardo.oliva@example.com', '147147154', '20-14714715-4'),
(75,'Clara', 'Roldan', '1984-02-07', 'clara.roldan@example.com', '258258265', '27-25825826-5'),
(76,'Sergio', 'Munoz', '1981-05-23', 'sergio.munoz@example.com', '369369366', '20-36936936-6'),
(77,'Lucia', 'Arias', '1990-10-30', 'lucia.arias@example.com', '123123131', '27-12312313-1'),
(78,'Carlos', 'Bautista', '1989-07-25', 'carlos.bautista@example.com', '456456464', '20-45645646-4'),
(79,'Claudia', 'Saavedra', '1991-04-05', 'claudia.saavedra@example.com', '789789785', '27-78978978-5'),
(80,'Rodrigo', 'Salas', '1985-08-16', 'rodrigo.salas@example.com', '321321329', '20-32132132-9'),
(81,'Daniela', 'Correa', '1982-09-21', 'daniela.correa@example.com', '654654662', '27-65465466-2'),
(82,'Marcelo', 'Valdez', '1987-03-09', 'marcelo.valdez@example.com', '987987985', '20-98798798-5'),
(83,'Nancy', 'Rojas', '1993-06-12', 'nancy.rojas@example.com', '147147155', '27-14714715-5'),
(84,'Esteban', 'Ruiz', '1979-10-27', 'esteban.ruiz@example.com', '258258266', '20-25825826-6'),
(85,'Lorena', 'Caceres', '1984-11-03', 'lorena.caceres@example.com', '369369367', '27-36936936-7'),
(86,'Julian', 'Soto', '1992-01-24', 'julian.soto@example.com', '123123132', '20-12312313-2'),
(87,'Monica', 'Cardenas', '1983-07-06', 'monica.cardenas@example.com', '456456465', '27-45645646-5'),
(88,'Francisco', 'Romero', '1986-03-29', 'francisco.romero@example.com', '789789786', '20-78978978-6'),
(89,'Gabriela', 'Moya', '1991-11-14', 'gabriela.moya@example.com', '321321330', '27-32132133-0'),
(90,'Miguel', 'Campos', '1988-10-10', 'miguel.campos@example.com', '654654663', '20-65465466-3'),
(91,'Patricia', 'Vargas', '1986-06-05', 'patricia.vargas@example.com', '987987986', '27-98798798-6'),
(92,'Mario', 'Figueroa', '1979-04-16', 'mario.figueroa@example.com', '147147156', '20-14714715-6'),
(93,'Florencia', 'Orellana', '1985-09-19', 'florencia.orellana@example.com', '258258267', '27-25825826-7'),
(94,'Pablo', 'Vega', '1990-03-11', 'pablo.vega@example.com', '369369368', '20-36936936-8'),
(95,'Ana', 'Fuentes', '1984-02-25', 'ana.fuentes@example.com', '123123133', '27-12312313-3'),
(96,'Juan', 'Chavez', '1983-01-28', 'juan.chavez@example.com', '456456466', '20-45645646-6'),
(97,'Adriana', 'Sanchez', '1991-07-04', 'adriana.sanchez@example.com', '789789787', '27-78978978-7'),
(98,'Javier', 'Santana', '1989-12-08', 'javier.santana@example.com', '321321331', '20-32132133-1'),
(99,'Carla', 'Barrera', '1990-09-09', 'carla.barrera@example.com', '654654664', '27-65465466-4'),
(100,'Luis', 'Medina', '1987-05-15', 'luis.medina@example.com', '987987987', '20-98798798-7');

-- Insertar datos en la tabla Membresias
INSERT INTO Membresias (tipo, precio, duracion_meses)
VALUES 
('Mensual', 55.00, 1),
('Trimestral', 135.00, 3),
('Anual', 500.00, 12);

-- Insertar datos en la tabla Entrenadores
INSERT INTO Entrenadores (nombre, apellido, especialidad, telefono)
VALUES 
('Pedro', 'Martinez', 'Fitness', '123123123'),
('Laura', 'Fernandez', 'Yoga', '456456456'),
('Miguel', 'Rodriguez', 'Pilates', '789789789'),
('Sofia', 'Gonzalez', 'Zumba', '321321321'),
('Mariano', 'Nuñez', 'Funcional', '3541627879');

-- Insertar datos en la tabla Clases
INSERT INTO Clases (nombre, descripcion, id_entrenador)
VALUES 
('Clase de Yoga', 'Clase de yoga para todos los niveles', 2),
('Clase de Pilates', 'Clase de pilates para fortalecer el core', 3),
('Clase de Zumba', 'Clase de zumba para quemar calorías bailando', 4),
('Clase de Fitness', 'Clase de fitness para mejorar la condición física', 1),
('Clase de Funcional', 'Clase de funcional para mejorar el rendimiento corporal', 5);

-- Insertar datos en la tabla Inscripciones
INSERT INTO Inscripciones (id_cliente, id_clase, fecha_inscripcion)
VALUES 
(1, 1, '2024-06-01'),
(2, 2, '2024-06-05'),
(3, 3, '2024-06-10'),
(4, 4, '2024-06-15'),
(1, 2, '2024-06-20');

-- Insertar datos en la tabla Pagos
INSERT INTO Pagos (id_cliente, id_membresia, fecha_pago, monto)
VALUES 
(1, 1, '2024-05-01', 55.00),
(2, 2, '2024-05-01', 135.00),
(3, 3, '2024-05-01', 500.00),
(4, 1, '2024-05-01', 55.00),
(1, 2, '2024-06-01', 135.00);

-- Insertar datos en la tabla Equipos
INSERT INTO Equipos (nombre, marca, estado, id_entrenador)
VALUES 
('Cinta de correr', 'ProForm', 'Operativo', 1),
('Bicicleta estática', 'Schwinn', 'Operativo', 2),
('Pesas', 'Rogue', 'Operativo', 3),
('Máquina de remo', 'Concept2', 'En mantenimiento', 1);

-- Insertar datos en la tabla Rutinas
INSERT INTO Rutinas (id_cliente, id_entrenador, descripcion, fecha_asignacion) VALUES
(1, 1, 'Rutina de Yoga diaria', '2024-07-01'),
(2, 2, 'Rutina de entrenamiento funcional', '2024-07-02'),
(3, 3, 'Rutina avanzada de Pilates', '2024-07-03');

-- Insertar datos en la tabla Horarios
INSERT INTO Horarios (id_clase, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'Lunes', '08:00:00', '09:00:00'),
(2, 'Martes', '10:00:00', '11:00:00'),
(3, 'Miércoles', '12:00:00', '13:00:00');

-- Insertar datos en la tabla Asistencias
INSERT INTO Asistencias (id_cliente, id_clase, fecha, presente) VALUES
(1, 1, '2024-07-01', TRUE),
(2, 2, '2024-07-02', TRUE),
(3, 3, '2024-07-03', FALSE);

-- Insertar datos en la tabla Reservas
INSERT INTO Reservas (id_cliente, id_clase, fecha_reserva, estado) VALUES
(1, 1, '2024-07-01', 'Confirmada'),
(2, 2, '2024-07-02', 'Pendiente'),
(3, 3, '2024-07-03', 'Cancelada');

-- Insertar datos en la tabla Facturas
INSERT INTO Facturas (id_pago, fecha_emision, total) VALUES
(1, '2024-07-01', 30.00),
(2, '2024-07-02', 80.00),
(3, '2024-07-03', 300.00);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre, apellido, puesto, telefono, email) VALUES
('Pedro', 'Fernández', 'Recepcionista', '600789012', 'pedro.fernandez@example.com'),
('Lucía', 'Herrera', 'Administrativa', '600890123', 'lucia.herrera@example.com'),
('Raúl', 'Domínguez', 'Mantenimiento', '600901234', 'raul.dominguez@example.com');

-- Insertar datos en la tabla Servicios
INSERT INTO Servicios (id_empleado, id_cliente, nombre, descripcion, precio) VALUES
(1, 1, 'Masajes', 'Masajes de relajación y terapéuticos', 50.00),
(2, 2, 'Fisioterapia', 'Sesiones de fisioterapia personalizadas', 70.00),
(3, 3, 'Nutrición', 'Consultas de nutrición y dietas personalizadas', 40.00);

-- Insertar datos en la tabla Feedback
INSERT INTO Feedback (id_cliente, id_clase, calificacion, comentario, fecha) VALUES
(1, 1, 5, 'Excelente clase de Yoga', '2024-07-01'),
(2, 2, 4, 'Muy buen entrenamiento, pero muy intenso', '2024-07-02'),
(3, 3, 3, 'Buena clase, pero esperaba más', '2024-07-03');

-- Inserción de datos en la tabla LogsClientes
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (1, 'INSERT');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (2, 'UPDATE');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (3, 'DELETE');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (4, 'INSERT');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (5, 'UPDATE');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (6, 'DELETE');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (7, 'INSERT');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (8, 'UPDATE');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (9, 'DELETE');
INSERT INTO LogsClientes (id_cliente, operacion) VALUES (10, 'INSERT');

-- Inserción de datos en la tabla Contrataciones
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (1, 1, '2023-01-01');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (2, 2, '2023-02-15');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (3, 3, '2023-03-20');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (4, 1, '2023-04-10');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (5, 2, '2023-05-25');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (6, 3, '2023-06-30');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (7, 1, '2023-07-15');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (8, 2, '2023-08-05');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (9, 3, '2023-09-12');
INSERT INTO Contrataciones (id_cliente, id_servicio, fecha_contratacion) VALUES (10, 1, '2023-10-20');

-- CREACION DE VISTAS --

USE proyecto_gimnasio;
-- Vista de Feedback
CREATE VIEW Vista_Feedback AS
SELECT 
    f.id_feedback,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    cl.nombre AS nombre_clase,
    f.calificacion,
    f.comentario,
    f.fecha
FROM 
    Feedback f
JOIN 
    Clientes c ON f.id_cliente = c.id_cliente
JOIN 
    Clases cl ON f.id_clase = cl.id_clase;

-- Vista de Reservas
CREATE VIEW Vista_Reservas AS
SELECT 
    r.id_reserva,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    cl.nombre AS nombre_clase,
    r.fecha_reserva,
    r.estado
FROM 
    Reservas r
JOIN 
    Clientes c ON r.id_cliente = c.id_cliente
JOIN 
    Clases cl ON r.id_clase = cl.id_clase;

-- Vista de Asistencias
CREATE VIEW Vista_Asistencias AS
SELECT 
    a.id_asistencia,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    cl.nombre AS nombre_clase,
    a.fecha,
    a.presente
FROM 
    Asistencias a
JOIN 
    Clientes c ON a.id_cliente = c.id_cliente
JOIN 
    Clases cl ON a.id_clase = cl.id_clase;

-- Vista de Clases y Horarios
CREATE VIEW Vista_Clases_Horarios AS
SELECT 
    c.id_clase,
    c.nombre AS nombre_clase,
    c.descripcion,
    h.dia_semana,
    h.hora_inicio,
    h.hora_fin
FROM 
    Clases c
JOIN 
    Horarios h ON c.id_clase = h.id_clase;

-- Vista de Clientes y Rutinas
CREATE VIEW Vista_Clientes_Rutinas AS
SELECT 
    c.id_cliente,
    c.nombre,
    c.apellido,
    r.id_rutina,
    r.descripcion,
    r.fecha_asignacion,
    e.nombre AS nombre_entrenador,
    e.apellido AS apellido_entrenador
FROM 
    Clientes c
JOIN 
    Rutinas r ON c.id_cliente = r.id_cliente
JOIN 
    Entrenadores e ON r.id_entrenador = e.id_entrenador;

-- Vista de Entrenadores y Clases
CREATE VIEW Vista_Entrenadores_Clases AS
SELECT 
    e.id_entrenador,
    e.nombre,
    e.apellido,
    e.especialidad,
    c.id_clase,
    c.nombre AS nombre_clase,
    c.descripcion
FROM 
    Entrenadores e
JOIN 
    Clases c ON e.id_entrenador = c.id_entrenador;

-- CREACION DE PROCEDIMIENTOS --

DELIMITER //

CREATE PROCEDURE ReporteAsistenciaCliente(
    IN p_id_cliente INT
)
BEGIN
    SELECT 
        c.nombre AS Nombre_Clase,
        a.fecha AS Fecha_Asistencia,
        a.presente AS Presente
    FROM 
        Asistencias a
    JOIN 
        Clases c ON a.id_clase = c.id_clase
    WHERE 
        a.id_cliente = p_id_cliente;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE RegistrarCliente(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(15),
    IN p_cuil VARCHAR(200)
    )
BEGIN
    INSERT INTO Clientes (nombre, apellido, fecha_nacimiento, email, telefono, cuil)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_email, p_telefono, p_cuil);
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE verCliente (IN p_cuil VARCHAR(200))
BEGIN 
SELECT * FROM Clientes WHERE cuil = p_cuil;
END//
DELIMITER ;

-- CREACION DE FUNCIONES --

DELIMITER //

CREATE FUNCTION calcularTotalPagado(in_cuil VARCHAR(100))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_pagado DECIMAL(10, 2);
    SELECT SUM(p.monto) INTO total_pagado
    FROM Pagos p
    JOIN Clientes c ON p.id_cliente = c.id_cliente
    WHERE c.cuil = in_cuil;
    RETURN total_pagado;
END //

DELIMITER ;

---------------------------------------------------------------------------------------

DELIMITER //

CREATE FUNCTION obtenerNombreCompletoCliente(in_cuil VARCHAR(100))
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE nombre_completo VARCHAR(200);
    SELECT CONCAT(nombre, ' ', apellido) INTO nombre_completo
    FROM Clientes
    WHERE cuil = in_cuil;
    RETURN nombre_completo;
END //

DELIMITER ;

-- CREACION DE TRIGGERS --

USE proyecto_gimnasio;
    
DELIMITER //

CREATE TRIGGER after_cliente_insert
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO LogsClientes (id_cliente, operacion)
    VALUES (NEW.id_cliente, 'INSERT');

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_pago_insert
BEFORE INSERT ON Pagos
FOR EACH ROW
BEGIN
    IF NEW.monto < 0 THEN
        SIGNAL SQLSTATE '40000'
        SET MESSAGE_TEXT = 'El pago no puede ser con un valor negativo';
    END IF;
END //

DELIMITER ;


