-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2023 a las 15:43:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `ID_Ciudad` int(11) NOT NULL,
  `Ciudad` text NOT NULL,
  `ID_Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Apellido` text NOT NULL,
  `Cédula` varchar(10) NOT NULL,
  `Correo` text NOT NULL,
  `Password` varchar(33) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `ID_EstatusCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledventas`
--

CREATE TABLE `detalledventas` (
  `ID_DetalleDventas` int(11) NOT NULL,
  `Cliente` text NOT NULL,
  `ID_Productos` int(11) NOT NULL,
  `ID_Ventas` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio Unitario` float NOT NULL,
  `Precio total` float NOT NULL,
  `Iva` float NOT NULL,
  `3%` float NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `ID_DireccionDenvio` int(11) NOT NULL,
  `Direccion` text NOT NULL,
  `ID_FormaDpago` int(11) NOT NULL,
  `ID_EstatusDetalleDV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciondenvio`
--

CREATE TABLE `direcciondenvio` (
  `ID_DireccionDenvio` int(11) NOT NULL,
  `ID_Estado` int(11) NOT NULL,
  `ID_Ciudad` int(11) NOT NULL,
  `ID_Municipio` int(11) NOT NULL,
  `ID_Parroquia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `ID_Entrega` int(11) NOT NULL,
  `Cliente` text NOT NULL,
  `Nombre Producto` text NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `ID_DireccionDenvio` int(11) NOT NULL,
  `Direccion` text NOT NULL,
  `ID_EstatusEntrega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ID_Estado` int(11) NOT NULL,
  `Estado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatuscliente`
--

CREATE TABLE `estatuscliente` (
  `ID_EstatusCliente` int(11) NOT NULL,
  `Estatus` enum('Activo','Inactivo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatusentrega`
--

CREATE TABLE `estatusentrega` (
  `ID_EstatusEntrega` int(11) NOT NULL,
  `Estatus` enum('Entregado','No Entregado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatusinventario`
--

CREATE TABLE `estatusinventario` (
  `ID_EstatusInventario` int(11) NOT NULL,
  `Estatus` enum('Disponible','No Disponible') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatusmarca`
--

CREATE TABLE `estatusmarca` (
  `ID_EstatusMarca` int(11) NOT NULL,
  `Estatus` enum('Disponible','No Disponible') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatusproductos`
--

CREATE TABLE `estatusproductos` (
  `ID_EstatusProductos` int(11) NOT NULL,
  `Estatus` enum('Disponible','No Disponible') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formadpago`
--

CREATE TABLE `formadpago` (
  `ID_formaDpago` int(11) NOT NULL,
  `Pago movil` float NOT NULL,
  `Divisas` float NOT NULL,
  `Zelle` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_Inventario` int(11) NOT NULL,
  `Producto` text NOT NULL,
  `ID_Marca` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `ID_EstatusInventario` int(11) NOT NULL,
  `ID_Devolucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `ID_Marca` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ID_EstatusMarca` int(11) NOT NULL,
  `ID_Inventario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `ID_Municipio` int(11) NOT NULL,
  `Municipio` text NOT NULL,
  `ID_Estado` int(11) NOT NULL,
  `ID_Parroquia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE `parroquia` (
  `ID_Parroquia` int(11) NOT NULL,
  `Parroquia` text NOT NULL,
  `ID_Municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Inventario` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Descripcion Corta` text NOT NULL,
  `Descrpcion Larga` text NOT NULL,
  `ID_Marca` int(11) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `Precio` float NOT NULL,
  `ID_EstatusProducto` int(11) NOT NULL,
  `ID_ImagenProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Correo` text NOT NULL,
  `Password` varchar(33) NOT NULL,
  `Nivel_de_Usuario` enum('Propietario','Administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_Ventas` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`ID_Ciudad`),
  ADD KEY `FKID_Estado` (`ID_Estado`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `FKID_EstatusCliente` (`ID_EstatusCliente`);

--
-- Indices de la tabla `detalledventas`
--
ALTER TABLE `detalledventas`
  ADD PRIMARY KEY (`ID_DetalleDventas`),
  ADD KEY `FKID_Ventas` (`ID_Ventas`),
  ADD KEY `FKID_Productos` (`ID_Productos`) USING BTREE,
  ADD KEY `FKID_DireccionDenvio` (`ID_DireccionDenvio`) USING BTREE,
  ADD KEY `FKID_FormaDpago` (`ID_FormaDpago`);

--
-- Indices de la tabla `direcciondenvio`
--
ALTER TABLE `direcciondenvio`
  ADD PRIMARY KEY (`ID_DireccionDenvio`),
  ADD UNIQUE KEY `FKID_Parroquia` (`ID_Parroquia`),
  ADD KEY `FKID_Estado` (`ID_Estado`),
  ADD KEY `FKID_Ciudad` (`ID_Ciudad`),
  ADD KEY `FKID_Municipio` (`ID_Municipio`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`ID_Entrega`),
  ADD KEY `FKID_EstatusEntrega` (`ID_EstatusEntrega`),
  ADD KEY `FKID_DireccionDenvio` (`ID_DireccionDenvio`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_Estado`);

--
-- Indices de la tabla `estatuscliente`
--
ALTER TABLE `estatuscliente`
  ADD PRIMARY KEY (`ID_EstatusCliente`);

--
-- Indices de la tabla `estatusentrega`
--
ALTER TABLE `estatusentrega`
  ADD PRIMARY KEY (`ID_EstatusEntrega`);

--
-- Indices de la tabla `estatusinventario`
--
ALTER TABLE `estatusinventario`
  ADD PRIMARY KEY (`ID_EstatusInventario`);

--
-- Indices de la tabla `estatusmarca`
--
ALTER TABLE `estatusmarca`
  ADD PRIMARY KEY (`ID_EstatusMarca`);

--
-- Indices de la tabla `estatusproductos`
--
ALTER TABLE `estatusproductos`
  ADD PRIMARY KEY (`ID_EstatusProductos`);

--
-- Indices de la tabla `formadpago`
--
ALTER TABLE `formadpago`
  ADD PRIMARY KEY (`ID_formaDpago`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_Inventario`),
  ADD KEY `FKID_Productos` (`Producto`(768)),
  ADD KEY `FKID_Marca` (`ID_Marca`),
  ADD KEY `FKID_EstatusInventario` (`ID_EstatusInventario`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`ID_Marca`),
  ADD KEY `FKID_Inventario` (`ID_Inventario`),
  ADD KEY `FKID_EstatusMarca` (`ID_EstatusMarca`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`ID_Municipio`),
  ADD KEY `FKID_Estado` (`ID_Estado`),
  ADD KEY `FKID_Parroquia` (`ID_Parroquia`);

--
-- Indices de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD PRIMARY KEY (`ID_Parroquia`),
  ADD KEY `FKID_Municipio` (`ID_Municipio`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `FKID_EstatusProducto` (`ID_EstatusProducto`),
  ADD KEY `FKID_Inventario` (`ID_Inventario`) USING BTREE,
  ADD KEY `FKID_Marca` (`ID_Marca`) USING BTREE;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `FKID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_Ventas`),
  ADD KEY `FKID_Cliente` (`ID_Cliente`),
  ADD KEY `FKID_Ventas` (`ID_Ventas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `ID_Ciudad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalledventas`
--
ALTER TABLE `detalledventas`
  MODIFY `ID_DetalleDventas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direcciondenvio`
--
ALTER TABLE `direcciondenvio`
  MODIFY `ID_DireccionDenvio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrega`
--
ALTER TABLE `entrega`
  MODIFY `ID_Entrega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_Estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatuscliente`
--
ALTER TABLE `estatuscliente`
  MODIFY `ID_EstatusCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatusentrega`
--
ALTER TABLE `estatusentrega`
  MODIFY `ID_EstatusEntrega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatusinventario`
--
ALTER TABLE `estatusinventario`
  MODIFY `ID_EstatusInventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatusmarca`
--
ALTER TABLE `estatusmarca`
  MODIFY `ID_EstatusMarca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatusproductos`
--
ALTER TABLE `estatusproductos`
  MODIFY `ID_EstatusProductos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formadpago`
--
ALTER TABLE `formadpago`
  MODIFY `ID_formaDpago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `ID_Inventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `ID_Marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `ID_Municipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parroquia`
--
ALTER TABLE `parroquia`
  MODIFY `ID_Parroquia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_Ventas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ID_Ciudad` FOREIGN KEY (`ID_Estado`) REFERENCES `estado` (`ID_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `ID_EstatusCliente` FOREIGN KEY (`ID_EstatusCliente`) REFERENCES `estatuscliente` (`ID_EstatusCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalledventas`
--
ALTER TABLE `detalledventas`
  ADD CONSTRAINT `ID_DetalleDV` FOREIGN KEY (`ID_Productos`) REFERENCES `productos` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledventas` FOREIGN KEY (`ID_DireccionDenvio`) REFERENCES `direcciondenvio` (`ID_DireccionDenvio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledventas_ibfk_1` FOREIGN KEY (`ID_Ventas`) REFERENCES `ventas` (`ID_Ventas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledventas_ibfk_2` FOREIGN KEY (`ID_FormaDpago`) REFERENCES `formadpago` (`ID_formaDpago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direcciondenvio`
--
ALTER TABLE `direcciondenvio`
  ADD CONSTRAINT `DireccionDenvio` FOREIGN KEY (`ID_Ciudad`) REFERENCES `municipio` (`ID_Municipio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `direccion` FOREIGN KEY (`ID_DireccionDenvio`) REFERENCES `detalledventas` (`ID_DireccionDenvio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estatus` FOREIGN KEY (`ID_EstatusEntrega`) REFERENCES `estatusentrega` (`ID_EstatusEntrega`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `ID_Inventario` FOREIGN KEY (`ID_Marca`) REFERENCES `marca` (`ID_Marca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventario` FOREIGN KEY (`ID_EstatusInventario`) REFERENCES `estatusinventario` (`ID_EstatusInventario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `ID_Marca` FOREIGN KEY (`ID_Inventario`) REFERENCES `inventario` (`ID_Inventario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`ID_EstatusMarca`) REFERENCES `estatusmarca` (`ID_EstatusMarca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio` FOREIGN KEY (`ID_Estado`) REFERENCES `estado` (`ID_Estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `municipio_FK1` FOREIGN KEY (`ID_Parroquia`) REFERENCES `parroquia` (`ID_Parroquia`);

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `parroquia` FOREIGN KEY (`ID_Municipio`) REFERENCES `municipio` (`ID_Municipio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `ID_Producto` FOREIGN KEY (`ID_Marca`) REFERENCES `marca` (`ID_Marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `ID_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ID_Ventas` FOREIGN KEY (`ID_Ventas`) REFERENCES `ventas` (`ID_Ventas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
