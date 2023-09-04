-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2023 a las 18:18:08
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectointegrado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idpersona` int(11) NOT NULL,
  `codigo_cliente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idpersona`, `codigo_cliente`) VALUES
(7, 'c11'),
(3, 'c124599'),
(9, 'c64'),
(1, 'cd859878');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `idconsumo` int(11) NOT NULL,
  `idreserva` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` decimal(7,2) NOT NULL,
  `precio_venta` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consumo`
--

INSERT INTO `consumo` (`idconsumo`, `idreserva`, `idproducto`, `cantidad`, `precio_venta`, `estado`) VALUES
(1, 5, 4, '3.00', '1.50', 'Aceptado'),
(2, 5, 2, '1.00', '1.00', 'Aceptado'),
(3, 2, 3, '3.00', '1.50', 'Aceptado'),
(4, 2, 4, '2.00', '1.50', 'Aceptado'),
(5, 6, 2, '1.00', '1.00', 'Aceptado'),
(6, 7, 3, '2.00', '1.50', 'Aceptado'),
(7, 7, 4, '1.00', '1.50', 'Aceptado'),
(8, 8, 3, '2.00', '1.50', 'Aceptado'),
(9, 8, 4, '1.00', '1.50', 'Aceptado'),
(10, 9, 3, '3.00', '1.50', 'Aceptado'),
(11, 9, 4, '3.00', '1.50', 'Aceptado'),
(12, 9, 6, '1.00', '1.00', 'Aceptado'),
(13, 11, 3, '3.00', '1.50', 'Aceptado'),
(14, 3, 4, '4.00', '1.50', 'Aceptado'),
(15, 3, 5, '3.00', '1.20', 'Aceptado'),
(16, 4, 7, '5.00', '1.20', 'Aceptado'),
(17, 12, 3, '5.00', '1.50', 'Aceptado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `idhabitacion` int(11) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `piso` varchar(2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `caracteristicas` varchar(512) DEFAULT NULL,
  `precio_dia` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `tipo_habitacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`idhabitacion`, `numero`, `piso`, `descripcion`, `caracteristicas`, `precio_dia`, `estado`, `tipo_habitacion`) VALUES
(3, '52', '2', 'ert', 'tre', '10.00', 'Disponible', 'Individual'),
(4, '116', '1', 'adrfhzdf', 'zdfhzdfhh', '125.00', 'Disponible', 'Matrimonio'),
(5, '116', '1', 'doble', 'xxxxx', '100.00', 'Disponible', 'Matrimonio'),
(6, '103', '1', 'habitacion doble', 'aire acondicionado', '100.00', 'Disponible', 'Matrimonio'),
(7, '102', '1', 'doble		', 'aire acondicionado', '115.00', 'Disponible', 'Matrimonio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `idpago` int(11) NOT NULL,
  `idreserva` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `num_comprobante` varchar(20) NOT NULL,
  `IVA` decimal(4,2) NOT NULL,
  `total_pago` decimal(7,2) NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_pago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idpago`, `idreserva`, `tipo_comprobante`, `num_comprobante`, `IVA`, `total_pago`, `fecha_emision`, `fecha_pago`) VALUES
(1, 7, 'Factura', '01-012', '0.21', '11.50', '2023-05-11', '2023-05-11'),
(2, 7, 'Factura', '01-003', '0.21', '11.50', '2023-05-11', '2023-05-11'),
(3, 8, 'Factura', '652', '0.21', '12.50', '2023-05-11', '2023-05-11'),
(4, 9, 'Factura', 'c88', '0.21', '19.00', '2023-05-11', '2023-05-11'),
(5, 3, 'Factura', 'c106', '0.21', '209.60', '2023-05-12', '2023-05-12'),
(6, 7, 'Factura', '1111', '25.00', '254.50', '2023-05-04', '2023-05-04'),
(7, 12, 'Factura', 'c55', '0.21', '307.50', '2023-05-21', '2023-05-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `tipo_documento` varchar(45) NOT NULL,
  `num_dni` varchar(10) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `seg_apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombre`, `primer_apellido`, `tipo_documento`, `num_dni`, `direccion`, `telefono`, `email`, `seg_apellido`) VALUES
(1, 'Pepito', 'Perez', 'DNI', '1598655R', 'direccion 1', '123456787', 'email@email.com', 'Gomez'),
(3, 'Jose', 'Garcia', 'DNI', '78451236W', 'Direccion2', '15896521', 'email1@email.com', 'Ruiz'),
(4, 'David', 'Bursón', 'DNI', '123659R', 'Direccion1', '123654789', 'emailtrabajador@gmail.com', 'Vivero'),
(5, 'David', 'Burson', 'DNI', '1236598D', 'Direccion', '123456789', 'emailtrabajador@email.com', 'Vivero'),
(6, 'Javier', 'Gomez', 'DNI', '123456789', 'dicrecion', '5632142', 'luis@email.com', 'Alonso'),
(7, 'Manolo', 'Perez', 'DNI', '55555555R', 'direccion5', '999666333', 'manolo@email.com', 'Perez'),
(9, 'David', 'Burson', 'DNI', '23135468k', 'ASDEGsdv', '1564523', 'email@gmail.com', 'Vivero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `precio_venta` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `descripcion`, `unidad_medida`, `precio_venta`) VALUES
(2, 'Agua', 'Lanjaron', 'Litros', '1.00'),
(3, 'Coca-cola', 'Refresco', 'Litros', '1.50'),
(4, 'Patatas Fritas', 'Jamón', 'Kg', '1.50'),
(5, 'Agua', 'Lanjaron', 'Litros', '1.20'),
(6, 'pilas', 'duracel', 'Kg', '2.00'),
(7, 'Agua', 'FontBella', 'Litros', '1.20'),
(8, 'cerveza', 'Cruzcampo', 'Unidades', '2.50'),
(10, 'Llamadas', 'llamadas telefonicas', 'Minutos', '0.15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `idhabitacion` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idtrabajador` int(11) NOT NULL,
  `tipo_reserva` varchar(20) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `precio_total` decimal(7,2) NOT NULL,
  `estado` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idreserva`, `idhabitacion`, `idcliente`, `idtrabajador`, `tipo_reserva`, `fecha_reserva`, `fecha_ingreso`, `fecha_salida`, `precio_total`, `estado`) VALUES
(1, 3, 3, 5, 'Reservado', '2023-04-03', '2023-04-03', '2023-04-10', '160.00', 'Alquiler'),
(2, 3, 3, 5, 'Reservado', '2023-04-13', '2023-04-13', '2023-04-20', '180.00', 'Alquiler'),
(3, 3, 1, 5, 'Reservado', '2023-04-13', '2023-04-13', '2023-04-20', '200.00', 'Alquiler'),
(4, 3, 3, 5, 'Reservado', '2023-05-04', '2023-05-04', '2023-05-11', '220.00', 'Alquiler'),
(5, 3, 7, 5, 'Reservado', '2023-05-05', '2023-05-05', '2023-05-06', '150.00', 'Alquiler'),
(6, 3, 7, 5, 'Reservado', '2023-05-18', '2023-05-18', '2023-05-25', '300.00', 'Pagado'),
(7, 3, 7, 5, 'Alquilado', '2023-05-18', '2023-05-18', '2023-05-25', '250.00', 'Alquiler'),
(8, 4, 9, 5, 'Reservado', '2023-05-12', '2023-05-12', '2023-05-19', '125.00', 'Alquiler'),
(9, 4, 9, 5, 'Reservado', '2023-05-19', '2023-05-19', '2023-05-26', '1000.00', 'Alquiler'),
(10, 4, 9, 5, 'Reservado', '2023-05-15', '2023-05-15', '2023-05-18', '30.00', 'Alquiler'),
(11, 4, 7, 5, 'Reservado', '2023-05-15', '2023-05-15', '2023-05-18', '125.00', 'Pagado'),
(12, 5, 7, 5, 'Reservado', '2023-05-18', '2023-05-19', '2023-05-21', '300.00', 'Pagado'),
(13, 6, 1, 5, 'Reservado', '2023-05-19', '2023-05-19', '2023-05-21', '250.00', 'Alquiler'),
(14, 3, 3, 5, 'Reservado', '2023-05-19', '2023-05-19', '2023-05-21', '120.00', 'Alquiler');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE `trabajador` (
  `idpersona` int(11) NOT NULL,
  `sueldo` decimal(7,2) NOT NULL,
  `acceso` varchar(15) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`idpersona`, `sueldo`, `acceso`, `login`, `password`, `estado`) VALUES
(5, '1900.00', 'Administrador', 'admin', 'admin123', 'Activado'),
(6, '1200.00', 'Usuario', 'usuario', 'usuario123', 'Activado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `codigo_cliente_UNIQUE` (`codigo_cliente`);

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`idconsumo`),
  ADD KEY `fk_consumo_producto_idx` (`idproducto`),
  ADD KEY `fk_consumo_reserva_idx` (`idreserva`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`idhabitacion`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`idpago`),
  ADD KEY `fk_pago_reserva_idx` (`idreserva`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `telefono_UNIQUE` (`telefono`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `fk_reserva_habitacion_idx` (`idhabitacion`),
  ADD KEY `fk_reserva_cliente_idx` (`idcliente`),
  ADD KEY `fk_reserva_trabajador_idx` (`idtrabajador`);

--
-- Indices de la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD PRIMARY KEY (`idpersona`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consumo`
--
ALTER TABLE `consumo`
  MODIFY `idconsumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  MODIFY `idhabitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_persona_cliente` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `fk_consumo_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_consumo_reserva` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_reserva` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_habitacion` FOREIGN KEY (`idhabitacion`) REFERENCES `habitacion` (`idhabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_trabajador` FOREIGN KEY (`idtrabajador`) REFERENCES `trabajador` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `fk_persona_trabajador` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
