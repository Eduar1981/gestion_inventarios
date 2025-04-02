-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2025 a las 00:05:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_pink`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `contador_abonos` int(11) NOT NULL,
  `contador_creditos` int(11) DEFAULT NULL,
  `fecha_abono` datetime DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `valor_abono` float DEFAULT NULL,
  `tiempo_registro` datetime DEFAULT NULL,
  `documento_operador` varchar(12) DEFAULT NULL,
  `estado` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `contador_categoria` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tiempo_registro` datetime NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`contador_categoria`, `codigo`, `nombre`, `tiempo_registro`, `documento_operador`, `estado`) VALUES
(1, 'par-001', 'parabrisas delantero', '2025-01-29 17:32:36', '94477540', 'activo'),
(2, 'ch-002', 'patines', '2025-01-29 17:37:38', '94477540', 'activo'),
(3, 'ch-0033', 'rueda', '2025-01-29 17:38:26', '94477540', 'activo'),
(4, 'ch-004', 'plumillas', '2025-01-29 17:43:12', '94477540', 'activo'),
(5, 'emp-001', 'empaque parabrisas MZ', '2025-01-29 17:44:44', '94477540', 'activo'),
(6, 'sv-003', 'pantalones', '2025-01-29 19:32:33', '94477540', 'activo'),
(7, 'sv-0033', 'sabanas', '2025-01-29 19:35:26', '94477540', 'activo'),
(8, 'ch-0011', 'bolsos', '2025-01-29 19:35:53', '94477540', 'activo'),
(9, 'cll-001', 'collares', '2025-01-29 22:07:09', '94477540', 'activo'),
(10, 'mn-001', 'manillas', '2025-01-29 22:08:18', '94477540', 'activo'),
(11, 'sh-001', 'shorts', '2025-02-03 01:43:17', '94477540', 'activo'),
(12, 'md-001', 'medias', '2025-02-03 01:44:34', '94477540', 'activo'),
(13, 'gr-001', 'gorra', '2025-02-03 02:03:03', '94477540', 'activo'),
(14, 'ds-001', 'dinosaurios', '2025-02-03 02:16:28', '94477540', 'activo'),
(15, 'vv-0011', 'ventanas negras', '2025-02-03 02:32:47', '94477540', 'activo'),
(16, 'pñ-001', 'pañales', '2025-02-05 02:09:58', '94477540', 'activo'),
(17, 'ptn-0011', 'pantalonetass', '2025-02-05 09:02:36', '94477540', 'activo'),
(18, 'ms-001', 'camiseta', '2025-02-05 16:13:31', '94477540', 'activo'),
(19, 'tb-001', 'tabla', '2025-02-05 16:16:56', '94477540', 'activo'),
(20, 'bs-001', 'blusa', '2025-02-05 20:19:34', '94477540', 'activo'),
(21, 'fl-001', 'falda', '2025-02-05 20:20:38', '94477540', 'activo'),
(22, 'jn-001', 'jean hombre', '2025-02-05 20:21:28', '94477540', 'activo'),
(23, 'cmb-001', 'camibuzo', '2025-02-05 21:56:10', '94477540', 'activo'),
(24, 'tp-001', 'tapete', '2025-02-05 21:57:12', '94477540', 'activo'),
(25, '038402', 'sillas', '2025-02-05 22:03:25', '94477540', 'activo'),
(26, '423', 'extintores', '2025-02-05 22:04:52', '94477540', 'activo'),
(27, 'cms-001', 'camisa', '2025-02-05 23:09:02', '94477540', 'activo'),
(28, 'fft-001', 'instrucmentos musicales', '2025-02-11 21:36:05', '94477540', 'activo'),
(29, 'an-001', 'anillo', '2025-02-12 19:15:33', '94477540', 'activo'),
(30, 'gf-001', 'gafas', '2025-02-12 19:17:07', '94477540', 'activo'),
(31, 'mñ-001', 'moñas', '2025-02-12 19:19:34', '94477540', 'activo'),
(32, 'lg-001', 'leguis', '2025-02-13 13:50:28', '94477540', 'activo'),
(33, 'crr-001', 'correas', '2025-02-13 13:52:28', '94477540', 'activo'),
(34, 'pnt-001', 'patineta', '2025-02-13 14:22:52', '94477540', 'activo'),
(35, 'smb-001', 'sombrero', '2025-02-13 14:58:53', '94477540', 'activo'),
(36, 'rct-001', 'carrito radio control', '2025-02-15 21:29:09', '94477540', 'activo'),
(37, 'plz-001', 'polarizado', '2025-02-15 21:30:56', '94477540', 'activo'),
(38, 'trp-001', 'tarro plastico', '2025-02-15 21:33:16', '94477540', 'activo'),
(39, 'pch-001', 'poncho colombiano', '2025-03-14 01:32:50', '94477540', 'activo'),
(40, 'ttr-001', 'moto alto cilindraje', '2025-03-26 16:47:36', '94477540', 'activo'),
(41, '001', 'abarrotes', '2025-03-27 21:29:51', '94477540', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `contador_clientes` int(11) NOT NULL,
  `tipo_persona` varchar(8) DEFAULT NULL,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `documento` varchar(12) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `celular` varchar(10) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `ciudad` varchar(12) NOT NULL,
  `direccion` varchar(56) NOT NULL,
  `nom_comercial` varchar(100) NOT NULL,
  `cont_venta` int(11) NOT NULL,
  `tiempo_registro` datetime NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`contador_clientes`, `tipo_persona`, `tipo_documento`, `documento`, `nombre`, `apellido`, `fecha_nacimiento`, `celular`, `correo`, `ciudad`, `direccion`, `nom_comercial`, `cont_venta`, `tiempo_registro`, `documento_operador`, `estado`) VALUES
(1, 'Natural', 'Cedula de Ciudadania', '94477540', 'Eduar Hernan', 'Grisalez', '1981-09-04', '3186941522', 'edcorgris@gmail.com', 'Guadalajara ', 'Calle 8#7e-04', 'chonna iot soluctions', 0, '2025-03-21 17:12:10', '94477540', 'activo'),
(2, 'Natural', 'Cedula de Ciudadania', '16385007', 'gildardo', 'hernandez', '2000-06-03', '3163456677', 'gildardo@gmail.com', 'Guadalajara ', 'Calle 8#7e-04', 'el paisa', 0, '2025-03-21 17:41:35', '94477540', 'activo'),
(3, 'natural', 'Cedula de Ciudadania', '1107039439', '', '', '0000-00-00', '', 'distrilasas@gmail.com', '', '', 'Distribuidora la SAS', 112, '2025-03-27 15:12:13', '94477540', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `contador_creditos` int(11) NOT NULL,
  `documento_cliente` varchar(12) DEFAULT NULL,
  `valor_credito` float DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `tiempo_registro` datetime DEFAULT NULL,
  `documento_operador` varchar(12) DEFAULT NULL,
  `estado` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `cont_detalle_venta` int(11) NOT NULL,
  `cont_venta` int(11) DEFAULT NULL,
  `cont_producto` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad_productos` int(4) DEFAULT NULL,
  `sub_total` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `porcentaje_descuento` float NOT NULL,
  `tiempo_registro` datetime NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`cont_detalle_venta`, `cont_venta`, `cont_producto`, `descripcion`, `cantidad_productos`, `sub_total`, `precio_unitario`, `porcentaje_descuento`, `tiempo_registro`, `documento_operador`, `estado`) VALUES
(1, 1, 2, 'camibuzo', 1, 38888.9, 38888.9, 0, '2025-02-07 14:33:37', '94477540', 'activo'),
(2, 2, 9, 'extintor', 2, 70588.2, 35294.1, 0, '2025-02-07 14:34:20', '94477540', 'activo'),
(3, 2, 2, 'camibuzo', 2, 77777.8, 38888.9, 0, '2025-02-07 14:34:20', '94477540', 'activo'),
(4, 3, 10, 'collar', 2, 33333.4, 16666.7, 0, '2025-02-07 14:34:55', '94477540', 'activo'),
(5, 4, 1, 'patin', 2, 28000, 14000, 0, '2025-02-07 14:35:45', '94477540', 'activo'),
(6, 4, 3, 'ruedas', 4, 200000, 50000, 0, '2025-02-07 14:35:45', '94477540', 'activo'),
(7, 5, 11, 'panatalo', 2, 119000, 59500, 0, '2025-02-07 14:51:25', '94477540', 'activo'),
(8, 5, 12, 'camisa', 2, 28000, 14000, 0, '2025-02-07 14:51:25', '94477540', 'activo'),
(9, 6, 6, 'tapete', 4, 108000, 27000, 0, '2025-02-07 14:52:12', '94477540', 'activo'),
(10, 6, 5, 'gorra', 2, 56000, 28000, 0, '2025-02-07 14:52:12', '94477540', 'activo'),
(11, 7, 7, 'silla', 4, 140000, 35000, 0, '2025-02-07 14:52:52', '94477540', 'activo'),
(12, 7, 6, 'tapete', 6, 162000, 27000, 0, '2025-02-07 14:52:52', '94477540', 'activo'),
(13, 8, 2, 'camibuzo', 2, 77777.8, 38888.9, 0, '2025-02-07 15:38:55', '94477540', 'activo'),
(14, 9, 12, 'camisa', 2, 28000, 14000, 0, '2025-02-09 17:29:47', '94477540', 'activo'),
(15, 10, 1, 'patines', 4, 56000, 14000, 0, '2025-02-09 17:42:36', '94477540', 'activo'),
(16, 10, 3, 'ruedas', 4, 200000, 50000, 0, '2025-02-09 17:42:36', '94477540', 'activo'),
(17, 11, 1, 'patines', 2, 28000, 14000, 0, '2025-02-10 09:57:35', '94477540', 'activo'),
(18, 11, 2, 'camibuzo', 1, 39550.9, 39550.9, 0, '2025-02-10 09:57:35', '94477540', 'activo'),
(19, 12, 10, 'collar', 1, 16666.7, 16666.7, 0, '2025-02-10 14:26:41', '94477540', 'activo'),
(20, 13, 1, 'patines', 7, 98000, 14000, 0, '2025-02-11 07:14:09', '94477540', 'activo'),
(21, 14, 9, 'extintor', 3, 105882, 35294.1, 0, '2025-02-11 07:26:10', '94477540', 'activo'),
(22, 15, 2, 'camibuzo', 2, 79101.8, 39550.9, 0, '2025-02-11 07:42:46', '94477540', 'activo'),
(23, 16, 1, 'patines', 3, 42000, 14000, 0, '2025-02-11 10:16:31', '94477540', 'activo'),
(24, 17, 1, 'patines', 10, 140000, 14000, 0, '2025-02-11 10:41:24', '94477540', 'activo'),
(25, 18, 10, 'collar', 1, 16666.7, 16666.7, 0, '2025-02-11 15:35:09', '94477540', 'activo'),
(26, 18, 2, 'camibuzo', 2, 79101.8, 39550.9, 0, '2025-02-11 15:35:09', '94477540', 'activo'),
(27, 19, 1, 'patin', 15, 210000, 14000, 0, '2025-02-11 16:23:14', '94477540', 'activo'),
(28, 20, 1, 'patin', 2, 28000, 14000, 0, '2025-02-11 16:36:28', '94477540', 'activo'),
(29, 20, 1, 'patin', 5, 70000, 14000, 0, '2025-02-11 16:36:28', '94477540', 'activo'),
(30, 21, 1, 'patin', 2, 28000, 14000, 0, '2025-02-11 16:43:48', '94477540', 'activo'),
(31, 21, 1, 'patin', 5, 70000, 14000, 0, '2025-02-11 16:43:48', '94477540', 'activo'),
(32, 22, 2, 'camibuzo', 3, 159000, 53000, 0, '2025-02-11 16:44:52', '94477540', 'activo'),
(33, 23, 2, 'camibuzo', 3, 159000, 53000, 0, '2025-02-11 16:49:11', '94477540', 'activo'),
(34, 24, 1, 'patin', 1, 14000, 14000, 0, '2025-02-11 17:01:03', '94477540', 'activo'),
(35, 24, 12, 'camisa', 12, 168000, 14000, 0, '2025-02-11 17:01:03', '94477540', 'activo'),
(36, 25, 10, 'collar', 1, 16666.7, 16666.7, 0, '2025-02-11 17:02:50', '94477540', 'activo'),
(37, 26, 12, 'camisa', 2, 28000, 14000, 0, '2025-02-11 17:36:42', '94477540', 'activo'),
(38, 27, 12, 'camisa', 2, 28000, 14000, 0, '2025-02-11 17:36:49', '94477540', 'activo'),
(39, 28, 1, 'patin', 2, 28000, 14000, 0, '2025-02-11 17:49:27', '94477540', 'activo'),
(40, 29, 1, 'patin', 5, 70000, 14000, 0, '2025-02-11 17:49:48', '94477540', 'activo'),
(41, 30, 1, 'patin', 3, 42000, 14000, 0, '2025-02-11 17:50:10', '94477540', 'activo'),
(42, 31, 1, 'patin', 3, 42000, 14000, 0, '2025-02-11 17:50:28', '94477540', 'activo'),
(43, 32, 12, 'camisa', 1, 14000, 14000, 0, '2025-02-11 17:52:15', '94477540', 'activo'),
(44, 33, 1, 'patines', 10, 140000, 14000, 0, '2025-02-12 08:25:04', '94477540', 'activo'),
(45, 34, 1, 'patin', 1, 14000, 14000, 0, '2025-02-12 08:50:27', '94477540', 'activo'),
(46, 35, 1, 'patin', 1, 14000, 14000, 0, '2025-02-12 08:51:44', '94477540', 'activo'),
(47, 36, 2, 'camibuzo', 2, 106000, 53000, 0, '2025-02-12 08:56:35', '94477540', 'activo'),
(48, 37, 2, 'camibuzo', 2, 106000, 53000, 0, '2025-02-12 09:21:45', '94477540', 'activo'),
(49, 38, 5, 'gorra', 3, 84000, 28000, 0, '2025-02-12 09:36:41', '94477540', 'activo'),
(50, 39, 5, 'gorra', 5, 140000, 28000, 0, '2025-02-12 09:47:23', '94477540', 'activo'),
(51, 40, 12, 'camisa', 2, 28000, 14000, 0, '2025-02-12 09:53:18', '94477540', 'activo'),
(52, 41, 5, 'gorra', 5, 140000, 28000, 0, '2025-02-12 09:57:16', '94477540', 'activo'),
(53, 42, 11, 'pantaloncito', 3, 150000, 50000, 0, '2025-02-12 10:02:29', '94477540', 'activo'),
(54, 42, 1, 'patin', 5, 70000, 14000, 0, '2025-02-12 10:02:29', '94477540', 'activo'),
(55, 43, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-12 10:03:06', '94477540', 'activo'),
(56, 43, 1, 'patin', 5, 70000, 14000, 0, '2025-02-12 10:03:06', '94477540', 'activo'),
(57, 44, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-12 10:03:16', '94477540', 'activo'),
(58, 44, 1, 'patin', 5, 70000, 14000, 0, '2025-02-12 10:03:16', '94477540', 'activo'),
(59, 45, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-12 10:04:36', '94477540', 'activo'),
(60, 45, 1, 'patin', 5, 70000, 14000, 0, '2025-02-12 10:04:36', '94477540', 'activo'),
(61, 46, 19, 'patineta', 2, 132222, 66111, 0, '2025-02-13 08:27:03', '16385007', 'activo'),
(62, 47, 19, 'patineta', 2, 132222, 66111, 0, '2025-02-13 08:44:39', '94477540', 'activo'),
(63, 48, 19, 'patineta', 1, 66111, 66111, 0, '2025-02-13 09:28:14', '16385007', 'activo'),
(64, 49, 19, 'patineta', 2, 132222, 66111, 0, '2025-02-14 18:44:18', '94477540', 'activo'),
(65, 49, 1, 'patin', 2, 28000, 14000, 0, '2025-02-14 18:44:18', '94477540', 'activo'),
(66, 50, 19, 'patineta', 2, 132222, 66111, 0, '2025-02-14 20:06:04', '24411612', 'activo'),
(67, 50, 1, 'patin', 2, 28000, 14000, 0, '2025-02-14 20:06:04', '24411612', 'activo'),
(68, 50, 5, 'gorra', 12, 336000, 28000, 0, '2025-02-14 20:06:04', '24411612', 'activo'),
(69, 51, 1, 'patin', 4, 56000, 14000, 0, '2025-02-15 16:10:48', '94477540', 'activo'),
(70, 51, 5, 'gorra', 10, 280000, 28000, 0, '2025-02-15 16:10:48', '94477540', 'activo'),
(71, 52, 1, 'patin', 4, 56000, 14000, 0, '2025-02-15 16:11:43', '94477540', 'activo'),
(72, 52, 5, 'gorra', 10, 280000, 28000, 0, '2025-02-15 16:11:43', '94477540', 'activo'),
(73, 53, 1, 'patin', 4, 56000, 14000, 0, '2025-02-15 16:11:51', '94477540', 'activo'),
(74, 53, 5, 'gorra', 10, 280000, 28000, 0, '2025-02-15 16:11:51', '94477540', 'activo'),
(75, 54, 19, 'patineta', 1, 66111, 66111, 0, '2025-02-15 16:21:37', '94477540', 'activo'),
(76, 55, 19, 'patineta', 1, 66111, 66111, 0, '2025-02-15 16:25:07', '94477540', 'activo'),
(77, 56, 19, 'patineta', 1, 66111, 66111, 0, '2025-02-15 16:25:39', '94477540', 'activo'),
(78, 57, 19, 'patineta', 1, 66111, 66111, 0, '2025-02-15 16:26:47', '94477540', 'activo'),
(79, 58, 22, 'tarro plastico', 1, 30000, 30000, 0, '2025-02-15 16:29:40', '94477540', 'activo'),
(80, 59, 5, 'gorra', 4, 112000, 28000, 0, '2025-02-15 16:31:09', '94477540', 'activo'),
(81, 60, 5, 'gorra', 10, 280000, 28000, 0, '2025-02-15 16:32:50', '94477540', 'activo'),
(82, 60, 12, 'camisa', 2, 28000, 14000, 0, '2025-02-15 16:32:50', '94477540', 'activo'),
(83, 61, 10, 'collar', 2, 40000, 20000, 0, '2025-02-15 16:35:19', '94477540', 'activo'),
(84, 61, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-15 16:35:19', '94477540', 'activo'),
(85, 62, 10, 'collar', 2, 40000, 20000, 0, '2025-02-15 21:45:07', '94477540', 'activo'),
(86, 62, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-15 21:45:07', '94477540', 'activo'),
(87, 63, 10, 'collar', 2, 40000, 20000, 0, '2025-02-15 21:51:49', '94477540', 'activo'),
(88, 63, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-15 21:51:49', '94477540', 'activo'),
(89, 64, 10, 'collar', 2, 40000, 20000, 0, '2025-02-15 22:02:01', '94477540', 'activo'),
(90, 64, 11, 'pantaloncito', 2, 100000, 50000, 0, '2025-02-15 22:02:01', '94477540', 'activo'),
(91, 65, 1, 'patin', 2, 2800000, 1400000, 0, '2025-02-17 10:12:57', '94477540', 'activo'),
(92, 66, 2, 'camibuzo', 10, 528890, 52889, 0, '2025-02-17 10:13:18', '94477540', 'activo'),
(93, 67, 1, 'patin', 3, 4200000, 1400000, 0, '2025-02-17 10:15:00', '94477540', 'activo'),
(94, 68, 1, 'patin', 2, 2800000, 1400000, 0, '2025-02-17 10:22:35', '94477540', 'activo'),
(95, 69, 2, 'camibuzo', 1, 52889, 52889, 0, '2025-02-17 10:26:02', '94477540', 'activo'),
(96, 70, 2, 'camibuzo', 9, 476001, 52889, 0, '2025-02-17 10:26:25', '94477540', 'activo'),
(97, 71, 2, 'camibuzo', 1, 52889, 52889, 0, '2025-02-17 15:36:31', '94477540', 'activo'),
(98, 72, 1, 'patin', 1, 1400000, 1400000, 0, '2025-02-17 15:48:33', '94477540', 'activo'),
(99, 73, 1, 'patin', 2, 2800000, 1400000, 0, '2025-02-17 15:49:24', '94477540', 'activo'),
(100, 74, 1, 'patin', 1, 1400000, 1400000, 0, '2025-02-17 15:49:51', '94477540', 'activo'),
(101, 75, 1, 'patin', 1, 1400000, 1400000, 0, '2025-02-17 15:50:12', '94477540', 'activo'),
(102, 76, 1, 'patin', 1, 1400000, 1400000, 0, '2025-02-18 10:50:41', '94477540', 'activo'),
(103, 77, 5, 'gorra', 4, 112000, 28000, 0, '2025-02-18 10:55:22', '94477540', 'activo'),
(104, 78, 1, 'patin', 3, 4200000, 1400000, 0, '2025-02-18 10:55:53', '94477540', 'activo'),
(105, 79, 1, 'patin', 3, 4200000, 1400000, 0, '2025-02-18 10:59:07', '94477540', 'activo'),
(106, 80, 5, 'gorra', 3, 84000, 28000, 0, '2025-02-18 21:11:48', '94477540', 'activo'),
(107, 81, 1, 'patin', 4, 5600000, 1400000, 0, '2025-02-18 21:17:10', '94477540', 'activo'),
(108, 82, 14, 'moña', 1, 1000, 1000, 0, '2025-03-02 09:15:43', '94477540', 'activo'),
(109, 83, 21, 'carro rc', 2, 26444, 13222, 0, '2025-03-02 09:17:20', '94477540', 'activo'),
(110, 84, 10, 'collar', 1, 20000, 20000, 0, '2025-03-03 11:09:43', '94477540', 'activo'),
(111, 84, 10, 'collar', 1, 20000, 20000, 0, '2025-03-03 11:09:43', '94477540', 'activo'),
(112, 85, 14, 'moña', 1, 1000, 1000, 0, '2025-03-03 11:10:15', '94477540', 'activo'),
(113, 86, 10, 'collar', 1, 20000, 20000, 0, '2025-03-03 11:10:28', '94477540', 'activo'),
(114, 87, 14, 'moña', 3, 3000, 1000, 0, '2025-03-03 11:11:03', '94477540', 'activo'),
(115, 88, 10, 'collar', 1, 20000, 20000, 0, '2025-03-03 15:01:07', '94477540', 'activo'),
(116, 89, 10, 'collar', 1, 20000, 20000, 0, '2025-03-03 15:34:35', '94477540', 'activo'),
(117, 90, 10, 'collar', 1, 20000, 20000, 0, '2025-03-03 15:48:23', '94477540', 'activo'),
(118, 91, 14, 'moña', 1, 1000, 1000, 0, '2025-03-04 12:04:46', '94477540', 'activo'),
(119, 92, 10, 'collar', 1, 20000, 20000, 0, '2025-03-04 12:53:43', '94477540', 'activo'),
(120, 93, 10, 'collar', 1, 20000, 20000, 0, '2025-03-04 13:13:53', '94477540', 'activo'),
(121, 94, 14, 'moña', 1, 1000, 1000, 0, '2025-03-04 13:22:30', '94477540', 'activo'),
(122, 95, 14, 'moña', 1, 1000, 1000, 0, '2025-03-04 13:23:35', '94477540', 'activo'),
(123, 96, 10, 'collar', 1, 20000, 20000, 0, '2025-03-04 15:22:42', '94477540', 'activo'),
(124, 97, 21, 'carro rc', 12, 158664, 13222, 0, '2025-03-13 15:24:02', '94477540', 'activo'),
(125, 97, 22, 'tarro plastico', 3, 90000, 30000, 0, '2025-03-13 15:24:02', '94477540', 'activo'),
(126, 97, 19, 'patineta', 4, 264444, 66111, 0, '2025-03-13 15:24:02', '94477540', 'activo'),
(127, 98, 2, 'camibuzo', 1, 52889, 52889, 0, '2025-03-18 17:32:57', '94477540', 'activo'),
(128, 100, 2, 'camibuzo', 1, 52889, 52889, 10, '2025-03-18 17:54:55', '94477540', 'activo'),
(129, 101, 12, 'camisa', 1, 14000, 14000, 5, '2025-03-18 18:00:09', '94477540', 'activo'),
(130, 101, 8, 'extintor', 2, 70000, 35000, 5, '2025-03-18 18:00:09', '94477540', 'activo'),
(131, 102, 9, 'extintor', 2, 705882, 352941, 0, '2025-03-18 18:02:16', '94477540', 'activo'),
(132, 103, 9, 'extintor', 1, 352941, 352941, 10, '2025-03-18 18:26:19', '94477540', 'activo'),
(133, 104, 2, 'camibuzo', 2, 105778, 52889, 0, '2025-03-18 18:27:17', '94477540', 'activo'),
(134, 105, 2, 'camibuzo', 2, 105778, 52889, 10, '2025-03-18 18:27:43', '94477540', 'activo'),
(135, 106, 9, 'extintor', 2, 705882, 352941, 0, '2025-03-18 18:28:01', '94477540', 'activo'),
(136, 107, 2, 'camibuzo', 1, 52889, 52889, 10, '2025-03-20 12:03:09', '94477540', 'activo'),
(137, 108, 5, 'gorra', 1, 28000, 28000, 10, '2025-03-20 12:03:42', '94477540', 'activo'),
(138, 109, 2, 'camibuzo', 1, 52889, 52889, 5, '2025-03-20 12:05:22', '94477540', 'activo'),
(139, 110, 10, 'collar', 1, 20000, 20000, 10, '2025-03-20 12:06:56', '94477540', 'activo'),
(140, 110, 12, 'camisa', 1, 14000, 14000, 10, '2025-03-20 12:06:56', '94477540', 'activo'),
(141, 110, 5, 'gorra', 1, 28000, 28000, 10, '2025-03-20 12:06:56', '94477540', 'activo'),
(142, 110, 11, 'pantaloncito', 1, 50000, 50000, 10, '2025-03-20 12:06:56', '94477540', 'activo'),
(143, 111, 2, 'camibuzo', 1, 52889, 52889, 10, '2025-03-20 13:10:19', '94477540', 'activo'),
(144, 111, 10, 'collar', 1, 20000, 20000, 10, '2025-03-20 13:10:19', '94477540', 'activo'),
(145, 112, 2, 'camibuzo', 2, 105778, 52889, 0, '2025-03-27 15:11:08', '94477540', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `cont_producto` int(11) NOT NULL,
  `codigo_producto` varchar(10) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `nombre` varchar(56) NOT NULL,
  `descripcion` varchar(600) NOT NULL,
  `categoria` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `con_iva` tinyint(1) NOT NULL,
  `porcentaje_ganancia` float NOT NULL,
  `precio_venta` float NOT NULL,
  `cantidad` int(5) NOT NULL,
  `cantidad_minima` int(2) NOT NULL,
  `tiempo_registro` datetime NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`cont_producto`, `codigo_producto`, `referencia`, `nombre`, `descripcion`, `categoria`, `precio_compra`, `con_iva`, `porcentaje_ganancia`, `precio_venta`, `cantidad`, `cantidad_minima`, `tiempo_registro`, `documento_operador`, `estado`) VALUES
(1, 'lbp-0144', 'lbp-00177', 'patin', 'profesionales niños y niñas', 5, 10000, 1, 15, 1400000, 3886, 400, '2025-02-05 15:53:23', '94477540', 'activo'),
(2, 'sv-001', 'sv-001', 'camibuzo', 'hombre', 23, 40000, 1, 10, 52889, 68, 6, '2025-02-05 15:56:29', '94477540', 'activo'),
(3, 'lbp-004', 'lbp-004', 'ruedas', 'ruta talla 16&#34;', 3, 45000, 0, 10, 50000, 60, 6, '2025-02-05 15:56:29', '94477540', 'activo'),
(4, 'lbp-003', 'lbp-003', 'falda', 'mujerr', 21, 12000, 1, 10, 16000, 50, 5, '2025-02-05 15:56:29', '94477540', 'activo'),
(5, 'lbp-002', 'lbp-002', 'gorra', 'hombre ', 13, 20000, 0, 15, 28000, 98, 5, '2025-02-05 15:56:29', '94477540', 'activo'),
(6, 'tp-001', 'tp-001', 'tapete', 'sala ', 24, 20000, 1, 10, 27000, 20, 5, '2025-02-05 15:57:37', '94477540', 'activo'),
(7, 'tr-43', '32902', 'silla', 'de oficina verde', 25, 20000, 1, 20, 29750, 10, 1, '2025-02-05 16:04:08', '94477540', 'activo'),
(8, 'ex-45', '423', 'extintor', 'amarillo', 26, 25000, 1, 15, 35000, 20, 3, '2025-02-05 16:07:12', '94477540', 'activo'),
(9, 'fr-84', '4302', 'extintor', 'rojo de 3lb', 26, 30000, 0, 15, 352941, 50, 3, '2025-02-05 16:07:12', '94477540', 'activo'),
(10, 'lbp-00166', 'lbp-00166', 'collar', 'mujer', 9, 15000, 1, 10, 20000, 28, 5, '2025-02-05 17:01:24', '94477540', 'activo'),
(11, 'lbp-00155', 'lbp-00155', 'pantaloncito', 'hombre color azil', 6, 45000, 0, 10, 50000, 15, 5, '2025-02-05 17:01:24', '94477540', 'activo'),
(12, 'pp-001', 'pp-001', 'camisa', 'hombre', 27, 10000, 1, 15, 14000, 20, 4, '2025-02-05 17:09:16', '94477540', 'activo'),
(13, 'fft-001', 'fft-001', 'flauta', 'flauta para niño', 28, 20000, 1, 15, 28000, 40, 5, '2025-02-11 15:36:38', '94477540', 'activo'),
(14, 'mñ-001', 'mñ-001', 'moña', 'niña color negro', 31, 1000, 0, 0, 1000, 42, 20, '2025-02-12 13:21:20', '94477540', 'activo'),
(15, 'ndg-010', 'ndg-010', 'gafas', 'de sol para mujer', 30, 20000, 1, 15, 28000, 50, 5, '2025-02-12 13:21:20', '94477540', 'activo'),
(16, 'jp-001', 'jp-001', 'anillo', 'anillo niña', 29, 10000, 1, 15, 14000, 30, 5, '2025-02-12 13:21:20', '94477540', 'activo'),
(17, 'crr-001', 'crr-001', 'correa', 'cuero para hombre talla 36', 33, 17000, 1, 10, 22600, 50, 5, '2025-02-13 07:52:57', '94477540', 'activo'),
(18, 'lmt-001', 'lmt-001', 'leguis', 'mujer talla unica', 32, 20000, 1, 10, 27000, 50, 10, '2025-02-13 07:52:57', '94477540', 'activo'),
(19, 'lbp-010', 'lbp-010', 'patineta', 'patineta para niño', 34, 50000, 1, 10, 66111, 43, 10, '2025-02-13 08:23:24', '94477540', 'activo'),
(20, 'pbl-002', 'pbl-002', 'polarizado', 'polarizado de 30 mm', 37, 20000, 1, 15, 28000, 40, 10, '2025-02-15 15:31:21', '94477540', 'activo'),
(21, 'rc-001', 'rc-001', 'carro rc', 'carrito a radio control de 6 ruedas', 36, 10000, 1, 10, 13222, 26, 10, '2025-02-15 15:31:21', '94477540', 'activo'),
(22, 'tp-002', 'tp-002', 'tarro plastico', 'tarro plastico de 1 litro', 38, 20000, 1, 10, 30000, 46, 5, '2025-02-15 15:33:37', '94477540', 'activo'),
(23, 'carr-001', 'carr001', 'carriel', 'carriel gericuano', 8, 20000, 1, 10, 26444, 30, 10, '2025-02-15 15:50:23', '94477540', 'activo'),
(24, 'pch-001', 'pch-001', 'poncho', 'poncho nacional', 39, 25000, 1, 15, 35000, 40, 10, '2025-03-13 19:33:14', '94477540', 'activo'),
(25, 'ttr-001', 'ttr-001', 'moto a radio control', 'moto a radio control para  niño de 4-8 años', 40, 550000, 1, 10, 730000, 30, 5, '2025-03-26 16:50:07', '94477540', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `contador_usuarios` int(11) NOT NULL,
  `tipo_doc` varchar(37) NOT NULL,
  `documento` varchar(12) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `celular` varchar(10) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `rol` varchar(14) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contra` varchar(255) NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `tiempo_registro` datetime NOT NULL,
  `reset_token` varchar(255) NOT NULL,
  `token_expiration` datetime NOT NULL,
  `estado` varchar(8) NOT NULL,
  `fec_ult_sesion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`contador_usuarios`, `tipo_doc`, `documento`, `nombre`, `apellido`, `fecha_nacimiento`, `celular`, `ciudad`, `direccion`, `rol`, `correo`, `contra`, `documento_operador`, `tiempo_registro`, `reset_token`, `token_expiration`, `estado`, `fec_ult_sesion`) VALUES
(1, 'Cedula de Ciudadania', '94477540', 'eduar', 'corrales', '1981-09-04', '3186941522', 'buga', 'carrera 8 # 13-11', 'superadmin', 'edcorgris@gmail.com', '$2y$10$ZXpNRRUWrq3IggyWzvemHez8eDKvO0g5LE68J7MBBd1rCUaGa7j7.', '', '2025-03-10 20:53:24', '', '0000-00-00 00:00:00', 'activo', '2025-03-26 22:43:30'),
(2, 'Cedula de Ciudadania', '1112388921', 'nicol', 'motoa', '2004-09-28', '3174900224', 'buga', 'carrera 8 # 13-11', 'superadmin', 'dahyanna.me@gmail.com', '$2y$10$2M5.U/2xYORn0dyyCkUtKuTB8zauuBo5pQpQTHv0MHvexZ2CFFNXy', '', '2025-03-13 14:34:40', '', '0000-00-00 00:00:00', 'activo', '2025-03-19 01:20:56'),
(3, 'Cedula de Ciudadania', '1112401370', 'sahian', 'motoa', '2004-09-08', '3112345678', 'buga', 'calle 8 #7-58', 'vendedor', 'sahianmotoa@gmail.com', '$2y$10$IWHVmVlsBzefAyVr1q6P/.DWgxWm5Hn2HnmCOKhKYtIp.HY55pDPG', '', '2025-03-13 14:47:37', '', '0000-00-00 00:00:00', 'activo', '2025-03-13 21:03:02'),
(4, 'Cedula de Ciudadania', '33750741', 'mateo', 'tafur', '1985-07-09', '3122175401', 'cali', 'diagnonal 11 # 14-15', 'administrador', 'mateo@gmail.com', '$2y$10$oLC4lKnWWkpL86D.QJvWuOf3Q8/L1JdU/8TkPP/n26q1lSpZ4FMia', '', '2025-03-13 20:09:26', '', '0000-00-00 00:00:00', 'activo', '2025-03-21 17:58:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `cont_venta` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `total_venta` float DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `documento_cliente` int(11) DEFAULT NULL,
  `iva` tinyint(1) DEFAULT NULL,
  `tiempo_registro` datetime NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `recibido` decimal(10,2) DEFAULT NULL,
  `cambio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`cont_venta`, `descripcion`, `total_venta`, `metodo_pago`, `documento_cliente`, `iva`, `tiempo_registro`, `documento_operador`, `estado`, `recibido`, `cambio`) VALUES
(1, 'Venta de productos', 38888.9, 'nequi', NULL, NULL, '2025-02-06 14:33:37', '94477540', 'activo', NULL, NULL),
(2, 'Venta de productos', 148366, 'transferencia', NULL, NULL, '2025-02-01 14:34:20', '94477540', 'activo', NULL, NULL),
(3, 'Venta de productos', 33333.4, 'efectivo', NULL, NULL, '2025-02-07 14:34:55', '94477540', 'activo', 40000.00, 6666.60),
(4, 'Venta de productos', 228000, 'efectivo', NULL, NULL, '2025-02-07 14:35:45', '94477540', 'activo', 250000.00, 22000.00),
(5, 'Venta de productos', 147000, 'efectivo', NULL, NULL, '2025-02-07 14:51:25', '94477540', 'activo', 150000.00, 3000.00),
(6, 'Venta de productos', 164000, 'nequi', NULL, NULL, '2025-02-07 14:52:12', '94477540', 'activo', NULL, NULL),
(7, 'Venta de productos', 302000, 'transferencia', NULL, NULL, '2025-02-07 14:52:52', '94477540', 'activo', NULL, NULL),
(8, 'Venta de productos', 77777.8, 'efectivo', NULL, NULL, '2025-02-07 15:38:55', '94477540', 'activo', 100000.00, 22222.20),
(9, 'Venta de productos', 28000, 'efectivo', NULL, NULL, '2025-02-09 17:29:47', '94477540', 'activo', 30000.00, 2000.00),
(10, 'Venta de productos', 256000, 'nequi', NULL, NULL, '2025-02-09 17:42:36', '94477540', 'activo', NULL, NULL),
(11, 'Venta de productos', 67550.9, 'transferencia', NULL, NULL, '2025-02-10 09:57:35', '94477540', 'activo', NULL, NULL),
(12, 'Venta de productos', 16666.7, 'efectivo', NULL, NULL, '2025-02-10 14:26:41', '94477540', 'activo', 20000.00, 3333.30),
(13, 'Venta de productos', 98000, 'efectivo', NULL, NULL, '2025-02-11 07:14:09', '94477540', 'activo', 100000.00, 2000.00),
(14, 'Venta de productos', 105882, 'nequi', NULL, NULL, '2025-02-11 07:26:10', '94477540', 'activo', NULL, NULL),
(15, 'Venta de productos', 79101.8, 'transferencia', NULL, NULL, '2025-02-11 07:42:46', '94477540', 'activo', NULL, NULL),
(16, 'Venta de productos', 42000, 'efectivo', NULL, NULL, '2025-02-11 10:16:31', '94477540', 'activo', 50000.00, 8000.00),
(17, 'Venta de productos', 140000, 'nequi', NULL, NULL, '2025-02-11 10:41:24', '94477540', 'activo', NULL, NULL),
(18, 'Venta de productos', 95768.5, 'nequi', NULL, NULL, '2025-02-11 15:35:09', '94477540', 'activo', NULL, NULL),
(19, 'Venta de productos', 210000, 'efectivo', NULL, NULL, '2025-02-11 16:23:14', '94477540', 'activo', 220000.00, 10000.00),
(20, 'Venta de productos', 98000, 'efectivo', NULL, NULL, '2025-02-11 16:36:28', '94477540', 'activo', 100000.00, 2000.00),
(21, 'Venta de productos', 98000, 'efectivo', NULL, NULL, '2025-02-11 16:43:48', '94477540', 'activo', 100000.00, 2000.00),
(22, 'Venta de productos', 159000, 'efectivo', NULL, NULL, '2025-02-11 16:44:52', '94477540', 'activo', 10000.00, -149000.00),
(23, 'Venta de productos', 159000, 'efectivo', NULL, NULL, '2025-02-11 16:49:11', '94477540', 'activo', 10000.00, -149000.00),
(24, 'Venta de productos', 182000, 'efectivo', NULL, NULL, '2025-02-11 17:01:03', '94477540', 'activo', 200000.00, 18000.00),
(25, 'Venta de productos', 16666.7, 'nequi', NULL, NULL, '2025-02-11 17:02:50', '94477540', 'activo', NULL, NULL),
(26, 'Venta de productos', 28000, 'efectivo', NULL, NULL, '2025-02-11 17:36:42', '94477540', 'activo', 30000.00, 2000.00),
(27, 'Venta de productos', 28000, '', NULL, NULL, '2025-02-11 17:36:49', '94477540', 'activo', NULL, NULL),
(28, 'Venta de productos', 28000, 'nequi', NULL, NULL, '2025-02-11 17:49:26', '94477540', 'activo', NULL, NULL),
(29, 'Venta de productos', 70000, 'transferencia', NULL, NULL, '2025-02-11 17:49:48', '94477540', 'activo', NULL, NULL),
(30, 'Venta de productos', 42000, '', NULL, NULL, '2025-02-11 17:50:10', '94477540', 'activo', NULL, NULL),
(31, 'Venta de productos', 42000, 'efectivo', NULL, NULL, '2025-02-11 17:50:28', '94477540', 'activo', 50000.00, 8000.00),
(32, 'Venta de productos', 14000, '', NULL, NULL, '2025-02-11 17:52:15', '94477540', 'activo', NULL, NULL),
(33, 'Venta de productos', 140000, '', NULL, NULL, '2025-02-12 08:25:04', '94477540', 'activo', NULL, NULL),
(34, 'Venta de productos', 14000, '', NULL, NULL, '2025-02-12 08:50:27', '94477540', 'activo', NULL, NULL),
(35, 'Venta de productos', 14000, '', NULL, NULL, '2025-02-12 08:51:44', '94477540', 'activo', NULL, NULL),
(36, 'Venta de productos', 106000, 'efectivo', NULL, NULL, '2025-02-12 08:56:35', '94477540', 'activo', 110000.00, 4000.00),
(37, 'Venta de productos', 106000, 'nequi', NULL, NULL, '2025-02-12 09:21:45', '94477540', 'activo', NULL, NULL),
(38, 'Venta de productos', 84000, 'efectivo', NULL, NULL, '2025-02-12 09:36:41', '94477540', 'activo', 85000.00, 1000.00),
(39, 'Venta de productos', 140000, 'efectivo', NULL, NULL, '2025-02-12 09:47:23', '94477540', 'activo', 150000.00, 10000.00),
(40, 'Venta de productos', 28000, 'efectivo', NULL, NULL, '2025-02-12 09:53:18', '94477540', 'activo', 30000.00, 2000.00),
(41, 'Venta de productos', 140000, 'efectivo', NULL, NULL, '2025-02-12 09:57:16', '94477540', 'activo', 200000.00, 60000.00),
(42, 'Venta de productos', 220000, 'efectivo', NULL, NULL, '2025-02-12 10:02:29', '94477540', 'activo', 250000.00, 30000.00),
(43, 'Venta de productos', 170000, 'nequi', NULL, NULL, '2025-02-12 10:03:06', '94477540', 'activo', NULL, NULL),
(44, 'Venta de productos', 170000, 'transferencia', NULL, NULL, '2025-02-12 10:03:16', '94477540', 'activo', NULL, NULL),
(45, 'Venta de productos', 170000, 'efectivo', NULL, NULL, '2025-02-12 10:04:36', '94477540', 'activo', 180000.00, 10000.00),
(46, 'Venta de productos', 132222, 'nequi', NULL, NULL, '2025-02-13 08:27:03', '16385007', 'activo', NULL, NULL),
(47, 'Venta de productos', 132222, 'efectivo', NULL, NULL, '2025-02-13 08:44:39', '94477540', 'activo', 150000.00, 17778.00),
(48, 'Venta de productos', 66111, 'efectivo', NULL, NULL, '2025-02-13 09:28:14', '16385007', 'activo', 70000.00, 3889.00),
(49, 'Venta de productos', 160222, 'efectivo', NULL, NULL, '2025-02-14 18:44:18', '94477540', 'activo', 180000.00, 19778.00),
(50, 'Venta de productos', 496222, 'efectivo', NULL, NULL, '2025-02-14 20:06:04', '24411612', 'activo', 500000.00, 3778.00),
(51, 'Venta de productos', 336000, 'efectivo', NULL, NULL, '2025-02-15 16:10:48', '94477540', 'activo', 340000.00, 4000.00),
(52, 'Venta de productos', 336000, 'nequi', NULL, NULL, '2025-02-15 16:11:43', '94477540', 'activo', NULL, NULL),
(53, 'Venta de productos', 336000, 'transferencia', NULL, NULL, '2025-02-15 16:11:51', '94477540', 'activo', NULL, NULL),
(54, 'Venta de productos', 66111, 'efectivo', NULL, NULL, '2025-02-15 16:21:37', '94477540', 'activo', 700000.00, 633889.00),
(55, 'Venta de productos', 66111, 'efectivo', NULL, NULL, '2025-02-15 16:25:07', '94477540', 'activo', 700000.00, 633889.00),
(56, 'Venta de productos', 66111, 'efectivo', NULL, NULL, '2025-02-15 16:25:39', '94477540', 'activo', 70000.00, 3889.00),
(57, 'Venta de productos', 66111, 'efectivo', NULL, NULL, '2025-02-15 16:26:47', '94477540', 'activo', 66111.00, 0.00),
(58, 'Venta de productos', 30000, 'efectivo', NULL, NULL, '2025-02-15 16:29:40', '94477540', 'activo', 30000.00, 0.00),
(59, 'Venta de productos', 112000, 'efectivo', NULL, NULL, '2025-02-15 16:31:09', '94477540', 'activo', 115000.00, 3000.00),
(60, 'Venta de productos', 308000, 'nequi', NULL, NULL, '2025-02-15 16:32:50', '94477540', 'activo', NULL, NULL),
(61, 'Venta de productos', 140000, 'transferencia', NULL, NULL, '2025-02-15 16:35:19', '94477540', 'activo', NULL, NULL),
(62, 'Venta de productos', 140000, 'efectivo', NULL, NULL, '2025-02-15 21:45:06', '94477540', 'activo', 150000.00, 10000.00),
(63, 'Venta de productos', 140000, 'transferencia', NULL, NULL, '2025-02-15 21:51:49', '94477540', 'activo', NULL, NULL),
(64, 'Venta de productos', 140000, 'efectivo', NULL, NULL, '2025-02-15 22:02:01', '94477540', 'activo', 150000.00, 10000.00),
(65, 'Venta de productos', 2800000, 'nequi', NULL, NULL, '2025-02-17 10:12:57', '94477540', 'activo', NULL, NULL),
(66, 'Venta de productos', 528890, 'transferencia', NULL, NULL, '2025-02-17 10:13:18', '94477540', 'activo', NULL, NULL),
(67, 'Venta de productos', 4200000, 'efectivo', NULL, NULL, '2025-02-17 10:15:00', '94477540', 'activo', 4500000.00, 300000.00),
(68, 'Venta de productos', 2800000, 'efectivo', NULL, NULL, '2025-02-17 10:22:35', '94477540', 'activo', 3000000.00, 200000.00),
(69, 'Venta de productos', 52889, 'efectivo', NULL, NULL, '2025-02-17 10:26:02', '94477540', 'activo', 60000.00, 7111.00),
(70, 'Venta de productos', 476001, 'efectivo', NULL, NULL, '2025-02-17 10:26:25', '94477540', 'activo', 500000.00, 23999.00),
(71, 'Venta de productos', 52889, 'efectivo', NULL, NULL, '2025-02-17 15:36:31', '94477540', 'activo', 60000.00, 7111.00),
(72, 'Venta de productos', 1400000, 'efectivo', NULL, NULL, '2025-02-17 15:48:33', '94477540', 'activo', 1500000.00, 100000.00),
(73, 'Venta de productos', 2800000, 'efectivo', NULL, NULL, '2025-02-17 15:49:24', '94477540', 'activo', 2900000.00, 100000.00),
(74, 'Venta de productos', 1400000, 'nequi', NULL, NULL, '2025-02-17 15:49:51', '94477540', 'activo', NULL, NULL),
(75, 'Venta de productos', 1400000, 'transferencia', NULL, NULL, '2025-02-17 15:50:12', '94477540', 'activo', NULL, NULL),
(76, 'Venta de productos', 1400000, 'efectivo', NULL, NULL, '2025-02-18 10:50:41', '94477540', 'activo', 1500000.00, 100000.00),
(77, 'Venta de productos', 112000, 'efectivo', NULL, NULL, '2025-02-18 10:55:22', '94477540', 'activo', 130000.00, 18000.00),
(78, 'Venta de productos', 4200000, 'efectivo', NULL, NULL, '2025-02-18 10:55:53', '94477540', 'activo', 4300000.00, 100000.00),
(79, 'Venta de productos', 4200000, 'nequi', NULL, NULL, '2025-02-18 10:59:07', '94477540', 'activo', NULL, NULL),
(80, 'Venta de productos', 84000, 'efectivo', NULL, NULL, '2025-02-18 21:11:48', '94477540', 'activo', 90000.00, 6000.00),
(81, 'Venta de productos', 5600000, 'efectivo', NULL, NULL, '2025-02-18 21:17:10', '94477540', 'activo', 6000000.00, 400000.00),
(82, 'Venta de productos', 1000, 'efectivo', NULL, NULL, '2025-03-02 09:15:43', '94477540', 'activo', 10000.00, 9000.00),
(83, 'Venta de productos', 26444, 'efectivo', NULL, NULL, '2025-03-02 09:17:20', '94477540', 'activo', 50000.00, 23556.00),
(84, 'Venta de productos', 40000, 'efectivo', NULL, NULL, '2025-03-03 11:09:43', '94477540', 'activo', 50000.00, 10000.00),
(85, 'Venta de productos', 1000, 'efectivo', NULL, NULL, '2025-03-03 11:10:15', '94477540', 'activo', 10000.00, 9000.00),
(86, 'Venta de productos', 20000, 'nequi', NULL, NULL, '2025-03-03 11:10:28', '94477540', 'activo', NULL, NULL),
(87, 'Venta de productos', 3000, 'transferencia', NULL, NULL, '2025-03-03 11:11:03', '94477540', 'activo', NULL, NULL),
(88, 'Venta de productos', 20000, 'efectivo', NULL, NULL, '2025-03-03 15:01:07', '94477540', 'activo', 50000.00, 30000.00),
(89, 'Venta de productos', 20000, 'efectivo', NULL, NULL, '2025-03-03 15:34:35', '94477540', 'activo', 50000.00, 30000.00),
(90, 'Venta de productos', 20000, 'efectivo', NULL, NULL, '2025-03-03 15:48:23', '94477540', 'activo', 50000.00, 30000.00),
(91, 'Venta de productos', 1000, 'efectivo', NULL, NULL, '2025-03-04 12:04:46', '94477540', 'activo', 50000.00, 49000.00),
(92, 'Venta de productos', 20000, 'efectivo', NULL, NULL, '2025-03-04 12:53:43', '94477540', 'activo', 50000.00, 30000.00),
(93, 'Venta de productos', 20000, 'efectivo', NULL, NULL, '2025-03-04 13:13:53', '94477540', 'activo', 50000.00, 30000.00),
(94, 'Venta de productos', 1000, 'efectivo', NULL, NULL, '2025-03-04 13:22:29', '94477540', 'activo', 20000.00, 19000.00),
(95, 'Venta de productos', 1000, 'efectivo', NULL, NULL, '2025-03-04 13:23:35', '94477540', 'activo', 50000.00, 49000.00),
(96, 'Venta de productos', 20000, 'efectivo', NULL, NULL, '2025-03-04 15:22:42', '94477540', 'activo', 50000.00, 30000.00),
(97, 'Venta de productos', 513108, 'nequi', NULL, NULL, '2025-03-13 15:24:02', '94477540', 'activo', NULL, NULL),
(98, 'Venta de productos', 52889, 'efectivo', NULL, NULL, '2025-03-18 17:32:57', '94477540', 'activo', 50000.00, 2400.00),
(100, 'Venta de productos', 52889, 'efectivo', NULL, NULL, '2025-03-18 17:54:55', '94477540', 'activo', 50000.00, 2400.00),
(101, 'Venta de productos', 84000, 'efectivo', NULL, NULL, '2025-03-18 18:00:09', '94477540', 'activo', 100000.00, 20200.00),
(102, 'Venta de productos', 705882, 'efectivo', NULL, NULL, '2025-03-18 18:02:16', '94477540', 'activo', 720000.00, 14118.00),
(103, 'Venta de productos', 317647, 'efectivo', NULL, NULL, '2025-03-18 18:26:19', '94477540', 'activo', 320000.00, 2353.00),
(104, 'Venta de productos', 105778, 'efectivo', NULL, NULL, '2025-03-18 18:27:17', '94477540', 'activo', 110000.00, 4222.00),
(105, 'Venta de productos', 95200.2, 'efectivo', NULL, NULL, '2025-03-18 18:27:43', '94477540', 'activo', 100000.00, 4800.00),
(106, 'Venta de productos', 705882, 'nequi', NULL, NULL, '2025-03-18 18:28:01', '94477540', 'activo', NULL, NULL),
(107, 'Venta de productos', 47600.1, 'efectivo', NULL, NULL, '2025-03-20 12:03:09', '94477540', 'activo', 50000.00, 2400.00),
(108, 'Venta de productos', 25200, 'nequi', NULL, NULL, '2025-03-20 12:03:42', '94477540', 'activo', NULL, NULL),
(109, 'Venta de productos', 50244.6, 'transferencia', NULL, NULL, '2025-03-20 12:05:22', '94477540', 'activo', NULL, NULL),
(110, 'Venta de productos', 100800, 'efectivo', NULL, NULL, '2025-03-20 12:06:56', '94477540', 'activo', 110000.00, 9200.00),
(111, 'Venta de productos', 65600.1, 'efectivo', NULL, NULL, '2025-03-20 13:10:19', '94477540', 'activo', 100000.00, 34400.00),
(112, 'Venta de productos', 105778, 'efectivo', NULL, NULL, '2025-03-27 15:11:08', '94477540', 'activo', 110000.00, 4222.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`contador_abonos`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`contador_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`contador_clientes`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`contador_creditos`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`cont_detalle_venta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`cont_producto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`contador_usuarios`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`cont_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `contador_abonos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `contador_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `contador_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `contador_creditos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `cont_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `cont_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `contador_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `cont_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
