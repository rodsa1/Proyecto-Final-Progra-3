-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2024 a las 20:09:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegiodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Login` varchar(50) NOT NULL,
  `Contrasenya` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Login`, `Contrasenya`, `Email`) VALUES
('[feduarte]', '[987]', '[feduarte@gmail.com]'),
('[lsalas]', '[456]', '[lsalas@gmail.com]'),
('[mrodirguez]', '[789]', '[mrodriguez@gmail.com]'),
('[psalmeron]', '[123]', '[psalmeron01@gmail.com]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `Login` varchar(50) NOT NULL,
  `Contrasenya` varchar(50) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `NivelID` int(11) DEFAULT NULL,
  `ColegioNombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Login`, `Contrasenya`, `Nombre`, `Apellidos`, `NivelID`, `ColegioNombre`) VALUES
('ahidalgo', '789', 'Abigail', 'Hidalgo Fonseca', 12, '[Sexto]'),
('fsalmeron', '223', 'Fernando', 'Salmeron sequeira', 9, '[Tercero]'),
('gnavarro', '589', 'German ', 'Navarro garcia', 10, '[Cuarto]'),
('gserrano', '723', 'Gabriel', 'Serrano Aguero', 4, 'Pre-Kinder'),
('jperez', '523', 'Juan', 'Perez Sanchez', 1, '[Primero]'),
('lfonseca', '623', 'Luis', 'Fonseca Calvo', 3, 'Materno'),
('mcalderon', '689', 'Milena', 'Calderon Gonzalez', 11, '[Quinto]'),
('mmora', '923', 'Monica', 'Mora Artavia', 8, '[Segundo]'),
('mzuñiga', '823', 'Maria', 'Zuñiga Quesada', 5, 'Kinder');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `AsignaturaID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`AsignaturaID`, `Nombre`) VALUES
(1, 'Musica'),
(2, 'Informatica'),
(3, 'Hogar'),
(4, 'Industriales'),
(5, 'Arte'),
(6, 'Manualidades'),
(7, 'Expresiones Artisticas'),
(8, 'Lenguaje de comunicacion'),
(9, 'Logistica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegio`
--

CREATE TABLE `colegio` (
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `colegio`
--

INSERT INTO `colegio` (`Nombre`) VALUES
('Kinder'),
('Materno'),
('Pre-Kinder'),
('[Cuarto]'),
('[Primero]'),
('[Quinto]'),
('[Segundo]'),
('[Sexto]'),
('[Tercero]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faltaasistencia`
--

CREATE TABLE `faltaasistencia` (
  `FaltaID` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Justificada` tinyint(1) DEFAULT NULL,
  `AlumnoLogin` varchar(50) DEFAULT NULL,
  `AsignaturaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `HorarioID` int(11) NOT NULL,
  `Dia` varchar(20) DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFin` time DEFAULT NULL,
  `AsignaturaID` int(11) DEFAULT NULL,
  `ProfesorLogin` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `NivelID` int(11) NOT NULL,
  `Nivel` varchar(50) DEFAULT NULL,
  `Curso` varchar(50) DEFAULT NULL,
  `Aula` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`NivelID`, `Nivel`, `Curso`, `Aula`) VALUES
(1, 'Primero', 'Logística', '23'),
(3, '[MAT]', '[Lenguaje de comunicacion]', '[01]'),
(4, '[PK]', '[Expresiones Artisticas]', '[02]'),
(5, '[Kinder]', '[Manualidades]', '[03]'),
(8, 'Segundo', 'arte', '24'),
(9, 'Tercero', 'Industriales', '25'),
(10, 'Cuarto', 'Hogar', '26'),
(11, 'Quinto', 'Informatica', '26'),
(12, 'Sexto', 'Musica', '27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `NotaID` int(11) NOT NULL,
  `Trimestre` int(11) DEFAULT NULL,
  `Nota` decimal(3,2) DEFAULT NULL,
  `AlumnoLogin` varchar(50) DEFAULT NULL,
  `AsignaturaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Login` varchar(50) NOT NULL,
  `Contrasenya` varchar(50) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Especialista` varchar(50) DEFAULT NULL,
  `ColegioNombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`Login`, `Contrasenya`, `Nombre`, `Apellidos`, `Email`, `Especialista`, `ColegioNombre`) VALUES
('cleiva', '897', 'Cesar', 'Leiva Rodriguez', 'cleiva@hotmail.com', 'Artes', '[Segundo]'),
('esalmeron', '546', 'Eli', 'Salmeron Solano', 'esalmeron@gmail.com', 'Lenguanje de comunicacion', 'Materno'),
('fbrenes', '555', 'Franco', 'Brenes Hidalgo', 'fbrenes@gmail.com', 'musica', '[Sexto]'),
('ggamboa', '654', 'Gael', 'Gamboa Cedeño', 'ggamboa@gmail.com', 'Logistica', '[Primero]'),
('hretana', '888', 'Hilda', 'Retana lopez', 'hretana@hotmail.com', 'Informatica', '[Quinto]'),
('jmendez', '444', 'Jimena', 'Mendez Ortiz', 'jmendez@gmail.com', 'Manualidades', 'Kinder'),
('mguillen', '785', 'Marta', 'Guillen perez', 'mguillen@gmail.com', 'Hogar', '[Cuarto]'),
('msolano', '478', 'Marcela', 'Solano Chavez', 'msolano@hotmail.com', 'Expresiones Artisticas', 'Pre-Kinder'),
('plopez', '987', 'Pedro', 'Lopez Lopez', 'plopez@hotmail.com', 'Industriales', '[Tercero]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor_imparte_asignatura`
--

CREATE TABLE `profesor_imparte_asignatura` (
  `ProfesorLogin` varchar(50) NOT NULL,
  `AsignaturaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor_imparte_asignatura`
--

INSERT INTO `profesor_imparte_asignatura` (`ProfesorLogin`, `AsignaturaID`) VALUES
('esalmeron', 8),
('fbrenes', 1),
('ggamboa', 9),
('hretana', 2),
('jmendez', 6),
('mguillen', 3),
('mguillen', 5),
('msolano', 7),
('plopez', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Login`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`Login`),
  ADD KEY `NivelID` (`NivelID`),
  ADD KEY `ColegioNombre` (`ColegioNombre`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`AsignaturaID`);

--
-- Indices de la tabla `colegio`
--
ALTER TABLE `colegio`
  ADD PRIMARY KEY (`Nombre`);

--
-- Indices de la tabla `faltaasistencia`
--
ALTER TABLE `faltaasistencia`
  ADD PRIMARY KEY (`FaltaID`),
  ADD KEY `AlumnoLogin` (`AlumnoLogin`),
  ADD KEY `AsignaturaID` (`AsignaturaID`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`HorarioID`),
  ADD KEY `AsignaturaID` (`AsignaturaID`),
  ADD KEY `ProfesorLogin` (`ProfesorLogin`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`NivelID`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`NotaID`),
  ADD KEY `AlumnoLogin` (`AlumnoLogin`),
  ADD KEY `AsignaturaID` (`AsignaturaID`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`Login`),
  ADD KEY `ColegioNombre` (`ColegioNombre`);

--
-- Indices de la tabla `profesor_imparte_asignatura`
--
ALTER TABLE `profesor_imparte_asignatura`
  ADD PRIMARY KEY (`ProfesorLogin`,`AsignaturaID`),
  ADD KEY `AsignaturaID` (`AsignaturaID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `AsignaturaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `faltaasistencia`
--
ALTER TABLE `faltaasistencia`
  MODIFY `FaltaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `HorarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `NivelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `NotaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`NivelID`) REFERENCES `nivel` (`NivelID`),
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`ColegioNombre`) REFERENCES `colegio` (`Nombre`);

--
-- Filtros para la tabla `faltaasistencia`
--
ALTER TABLE `faltaasistencia`
  ADD CONSTRAINT `faltaasistencia_ibfk_1` FOREIGN KEY (`AlumnoLogin`) REFERENCES `alumno` (`Login`),
  ADD CONSTRAINT `faltaasistencia_ibfk_2` FOREIGN KEY (`AsignaturaID`) REFERENCES `asignatura` (`AsignaturaID`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`AsignaturaID`) REFERENCES `asignatura` (`AsignaturaID`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`ProfesorLogin`) REFERENCES `profesor` (`Login`);

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`AlumnoLogin`) REFERENCES `alumno` (`Login`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`AsignaturaID`) REFERENCES `asignatura` (`AsignaturaID`);

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`ColegioNombre`) REFERENCES `colegio` (`Nombre`);

--
-- Filtros para la tabla `profesor_imparte_asignatura`
--
ALTER TABLE `profesor_imparte_asignatura`
  ADD CONSTRAINT `profesor_imparte_asignatura_ibfk_1` FOREIGN KEY (`ProfesorLogin`) REFERENCES `profesor` (`Login`),
  ADD CONSTRAINT `profesor_imparte_asignatura_ibfk_2` FOREIGN KEY (`AsignaturaID`) REFERENCES `asignatura` (`AsignaturaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
