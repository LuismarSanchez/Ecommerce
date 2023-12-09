-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 23:36:25
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
CREATE DATABASE IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ecommerce`;

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
-- Estructura de tabla para la tabla `estatuscliente`
--

CREATE TABLE `estatuscliente` (
  `ID_EstatusCliente` int(11) NOT NULL,
  `Estatus` enum('Activo','Inactivo') NOT NULL
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
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_Inventario` int(11) NOT NULL,
  `Producto` text NOT NULL,
  `ID_Marca` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `ID_EstatusInventario` enum('Disponible','No Disponible') NOT NULL,
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
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Inventario` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Descripcion Corta` text NOT NULL,
  `Descrpcion Larga` text NOT NULL,
  `ID_Marca` int(11) NOT NULL,
  `ID_Imagen` int(11) NOT NULL,
  `Fecha` date NOT NULL DEFAULT current_timestamp(),
  `Precio` float NOT NULL,
  `ID_EstatusProducto` int(11) NOT NULL
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
  ADD KEY `FKID_Productos` (`ID_Productos`) USING BTREE;

--
-- Indices de la tabla `estatuscliente`
--
ALTER TABLE `estatuscliente`
  ADD PRIMARY KEY (`ID_EstatusCliente`);

--
-- Indices de la tabla `estatusproductos`
--
ALTER TABLE `estatusproductos`
  ADD PRIMARY KEY (`ID_EstatusProductos`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_Inventario`),
  ADD KEY `FKID_Productos` (`Producto`(768)),
  ADD KEY `FKID_Marca` (`ID_Marca`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`ID_Marca`),
  ADD KEY `FKID_Inventario` (`ID_Inventario`);

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
-- AUTO_INCREMENT de la tabla `estatuscliente`
--
ALTER TABLE `estatuscliente`
  MODIFY `ID_EstatusCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatusproductos`
--
ALTER TABLE `estatusproductos`
  MODIFY `ID_EstatusProductos` int(11) NOT NULL AUTO_INCREMENT;

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
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `ID_EstatusCliente` FOREIGN KEY (`ID_EstatusCliente`) REFERENCES `estatuscliente` (`ID_EstatusCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalledventas`
--
ALTER TABLE `detalledventas`
  ADD CONSTRAINT `ID_DetalleDV` FOREIGN KEY (`ID_Productos`) REFERENCES `productos` (`ID_Producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalledventas_ibfk_1` FOREIGN KEY (`ID_Ventas`) REFERENCES `ventas` (`ID_Ventas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `ID_Inventario` FOREIGN KEY (`ID_Marca`) REFERENCES `marca` (`ID_Marca`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `ID_Marca` FOREIGN KEY (`ID_Inventario`) REFERENCES `inventario` (`ID_Inventario`) ON DELETE CASCADE ON UPDATE CASCADE;

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
