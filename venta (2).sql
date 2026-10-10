-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2026 a las 05:59:03
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
-- Base de datos: `venta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `Id_almacen` int(10) NOT NULL,
  `Nombre_producto` varchar(50) NOT NULL,
  `Costo_venta` decimal(10,2) NOT NULL,
  `Costo_Compra` decimal(10,2) NOT NULL,
  `Id_proveedor` int(10) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenxproveedor`
--

CREATE TABLE `almacenxproveedor` (
  `Id_almacenxproveedor` int(10) NOT NULL,
  `Id_almacen` int(10) NOT NULL,
  `Id_proveedor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_proveedor` int(10) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`Id_almacen`),
  ADD UNIQUE KEY `Id_proveedor` (`Id_proveedor`);

--
-- Indices de la tabla `almacenxproveedor`
--
ALTER TABLE `almacenxproveedor`
  ADD PRIMARY KEY (`Id_almacenxproveedor`),
  ADD UNIQUE KEY `Id_almacen` (`Id_almacen`),
  ADD UNIQUE KEY `Id_proveedor` (`Id_proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `Id_almacen` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `almacenxproveedor`
--
ALTER TABLE `almacenxproveedor`
  MODIFY `Id_almacenxproveedor` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id_proveedor` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`Id_proveedor`) REFERENCES `proveedor` (`Id_proveedor`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `almacenxproveedor`
--
ALTER TABLE `almacenxproveedor`
  ADD CONSTRAINT `almacenxproveedor_ibfk_1` FOREIGN KEY (`Id_almacen`) REFERENCES `almacen` (`Id_almacen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `almacenxproveedor_ibfk_2` FOREIGN KEY (`Id_proveedor`) REFERENCES `proveedor` (`Id_proveedor`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
