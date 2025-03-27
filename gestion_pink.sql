-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-02-2025 a las 00:49:55
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
(1, 'ch-001', 'parabrisas delantero', '2025-01-29 17:32:36', '94477540', 'inactivo'),
(2, 'ch-002', 'patines', '2025-01-29 17:37:38', '94477540', 'activo'),
(3, 'ch-0033', 'rueda', '2025-01-29 17:38:26', '94477540', 'activo'),
(4, 'ch-004', 'plumillas', '2025-01-29 17:43:12', '94477540', 'activo'),
(5, 'emp-001', 'empaque parabrisas', '2025-01-29 17:44:44', '94477540', 'activo'),
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
(35, 'smb-001', 'sombrero', '2025-02-13 14:58:53', '94477540', 'activo');

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
(1, 'natural', 'CC', '16385007', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Chucho partes', 0, '2025-02-02 14:37:53', '94477540', 'activo'),
(2, 'natural', 'CC', '1112388921', '', '', '0000-00-00', '', 'dahyanna.me@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-03 09:26:47', '94477540', 'activo'),
(3, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-04 08:55:47', '94477540', 'activo'),
(4, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Corcars', 0, '2025-02-04 09:20:38', '94477540', 'activo'),
(5, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-04 15:28:47', '94477540', 'activo'),
(6, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-04 15:46:01', '94477540', 'activo'),
(7, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-04 16:43:58', '94477540', 'activo'),
(8, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-04 17:02:52', '94477540', 'activo'),
(9, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-04 17:14:27', '94477540', 'activo'),
(10, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-04 17:16:06', '94477540', 'activo'),
(11, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', '', 0, '2025-02-04 18:10:58', '94477540', 'activo'),
(12, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-05 08:58:15', '94477540', 'activo'),
(13, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-05 08:59:37', '94477540', 'activo'),
(14, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Corcars', 0, '2025-02-05 09:01:10', '94477540', 'activo'),
(15, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-05 09:18:01', '94477540', 'activo'),
(16, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 0, '2025-02-05 10:42:50', '94477540', 'activo'),
(17, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Chonna Motors', 0, '2025-02-05 17:25:13', '94477540', 'activo'),
(18, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Janna motors', 0, '2025-02-05 17:30:17', '94477540', 'activo'),
(20, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', '', 0, '2025-02-06 13:21:53', '94477540', 'activo'),
(21, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-06 13:23:41', '94477540', 'activo'),
(22, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Chucho partes', 0, '2025-02-06 13:27:10', '94477540', 'activo'),
(23, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgriz@hotmail.com', '', '', 'Chucho partes', 0, '2025-02-06 13:27:38', '94477540', 'activo'),
(24, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgriz@hotmail.com', '', '', 'pink_mundo', 0, '2025-02-06 13:50:06', '94477540', 'activo'),
(25, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-06 13:50:40', '94477540', 'activo'),
(26, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'pink_mundo', 0, '2025-02-06 13:54:17', '94477540', 'activo'),
(27, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgriz@hotmail.com', '', '', 'pink_mundo', 0, '2025-02-06 13:54:41', '94477540', 'activo'),
(28, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgriz@hotmail.com', '', '', 'Janna motors', 0, '2025-02-06 13:57:09', '94477540', 'activo'),
(29, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgriz@hotmail.com', '', '', 'pink_mundo', 0, '2025-02-06 14:33:50', '94477540', 'activo'),
(30, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Chonna Motors', 0, '2025-02-06 14:38:37', '94477540', 'activo'),
(31, 'natural', 'CC', '1112388921', '', '', '0000-00-00', '', 'dahyanna.me@gmail.com', '', '', 'NICOO', 0, '2025-02-06 14:39:37', '94477540', 'activo'),
(32, 'natural', 'CC', '1112388921', '', '', '0000-00-00', '', 'dahyanna.me@gmail.com', '', '', 'Chucho partes', 0, '2025-02-06 14:42:25', '94477540', 'activo'),
(33, 'natural', 'CC', '1112388921', '', '', '0000-00-00', '', 'dahyanna.me@gmail.com', '', '', 'Chonna Motors', 0, '2025-02-07 13:25:44', '94477540', 'activo'),
(34, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Janna motors', 0, '2025-02-07 13:43:40', '94477540', 'activo'),
(35, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgriz@hotmail.com', '', '', 'pink_mundo', 0, '2025-02-07 14:08:38', '94477540', 'activo'),
(36, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Janna motors', 0, '2025-02-09 17:30:09', '94477540', 'activo'),
(37, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', '', 0, '2025-02-10 14:28:59', '94477540', 'activo'),
(38, 'natural', 'NIT', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', '', 11, '2025-02-10 14:32:39', '94477540', 'activo'),
(39, 'natural', 'CC', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', '', 36, '2025-02-12 09:00:34', '94477540', 'activo'),
(40, 'natural', 'NIT', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'cmd-unico', 48, '2025-02-13 09:29:43', '16385007', 'activo'),
(41, 'juridica', 'NIT', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'chonna iot soluctions', 47, '2025-02-13 10:37:48', '94477540', 'activo'),
(42, 'natural', 'Cedula de Ciudadania', '94477540', '', '', '0000-00-00', '', 'edcorgris@gmail.com', '', '', 'Janna motors', 49, '2025-02-14 18:48:55', '94477540', 'activo');

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
  `tiempo_registro` datetime NOT NULL,
  `documento_operador` varchar(12) NOT NULL,
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`cont_detalle_venta`, `cont_venta`, `cont_producto`, `descripcion`, `cantidad_productos`, `sub_total`, `precio_unitario`, `tiempo_registro`, `documento_operador`, `estado`) VALUES
(1, 1, 2, 'camibuzo', 1, 38888.9, 38888.9, '2025-02-07 14:33:37', '94477540', 'activo'),
(2, 2, 9, 'extintor', 2, 70588.2, 35294.1, '2025-02-07 14:34:20', '94477540', 'activo'),
(3, 2, 2, 'camibuzo', 2, 77777.8, 38888.9, '2025-02-07 14:34:20', '94477540', 'activo'),
(4, 3, 10, 'collar', 2, 33333.4, 16666.7, '2025-02-07 14:34:55', '94477540', 'activo'),
(5, 4, 1, 'patin', 2, 28000, 14000, '2025-02-07 14:35:45', '94477540', 'activo'),
(6, 4, 3, 'ruedas', 4, 200000, 50000, '2025-02-07 14:35:45', '94477540', 'activo'),
(7, 5, 11, 'panatalo', 2, 119000, 59500, '2025-02-07 14:51:25', '94477540', 'activo'),
(8, 5, 12, 'camisa', 2, 28000, 14000, '2025-02-07 14:51:25', '94477540', 'activo'),
(9, 6, 6, 'tapete', 4, 108000, 27000, '2025-02-07 14:52:12', '94477540', 'activo'),
(10, 6, 5, 'gorra', 2, 56000, 28000, '2025-02-07 14:52:12', '94477540', 'activo'),
(11, 7, 7, 'silla', 4, 140000, 35000, '2025-02-07 14:52:52', '94477540', 'activo'),
(12, 7, 6, 'tapete', 6, 162000, 27000, '2025-02-07 14:52:52', '94477540', 'activo'),
(13, 8, 2, 'camibuzo', 2, 77777.8, 38888.9, '2025-02-07 15:38:55', '94477540', 'activo'),
(14, 9, 12, 'camisa', 2, 28000, 14000, '2025-02-09 17:29:47', '94477540', 'activo'),
(15, 10, 1, 'patines', 4, 56000, 14000, '2025-02-09 17:42:36', '94477540', 'activo'),
(16, 10, 3, 'ruedas', 4, 200000, 50000, '2025-02-09 17:42:36', '94477540', 'activo'),
(17, 11, 1, 'patines', 2, 28000, 14000, '2025-02-10 09:57:35', '94477540', 'activo'),
(18, 11, 2, 'camibuzo', 1, 39550.9, 39550.9, '2025-02-10 09:57:35', '94477540', 'activo'),
(19, 12, 10, 'collar', 1, 16666.7, 16666.7, '2025-02-10 14:26:41', '94477540', 'activo'),
(20, 13, 1, 'patines', 7, 98000, 14000, '2025-02-11 07:14:09', '94477540', 'activo'),
(21, 14, 9, 'extintor', 3, 105882, 35294.1, '2025-02-11 07:26:10', '94477540', 'activo'),
(22, 15, 2, 'camibuzo', 2, 79101.8, 39550.9, '2025-02-11 07:42:46', '94477540', 'activo'),
(23, 16, 1, 'patines', 3, 42000, 14000, '2025-02-11 10:16:31', '94477540', 'activo'),
(24, 17, 1, 'patines', 10, 140000, 14000, '2025-02-11 10:41:24', '94477540', 'activo'),
(25, 18, 10, 'collar', 1, 16666.7, 16666.7, '2025-02-11 15:35:09', '94477540', 'activo'),
(26, 18, 2, 'camibuzo', 2, 79101.8, 39550.9, '2025-02-11 15:35:09', '94477540', 'activo'),
(27, 19, 1, 'patin', 15, 210000, 14000, '2025-02-11 16:23:14', '94477540', 'activo'),
(28, 20, 1, 'patin', 2, 28000, 14000, '2025-02-11 16:36:28', '94477540', 'activo'),
(29, 20, 1, 'patin', 5, 70000, 14000, '2025-02-11 16:36:28', '94477540', 'activo'),
(30, 21, 1, 'patin', 2, 28000, 14000, '2025-02-11 16:43:48', '94477540', 'activo'),
(31, 21, 1, 'patin', 5, 70000, 14000, '2025-02-11 16:43:48', '94477540', 'activo'),
(32, 22, 2, 'camibuzo', 3, 159000, 53000, '2025-02-11 16:44:52', '94477540', 'activo'),
(33, 23, 2, 'camibuzo', 3, 159000, 53000, '2025-02-11 16:49:11', '94477540', 'activo'),
(34, 24, 1, 'patin', 1, 14000, 14000, '2025-02-11 17:01:03', '94477540', 'activo'),
(35, 24, 12, 'camisa', 12, 168000, 14000, '2025-02-11 17:01:03', '94477540', 'activo'),
(36, 25, 10, 'collar', 1, 16666.7, 16666.7, '2025-02-11 17:02:50', '94477540', 'activo'),
(37, 26, 12, 'camisa', 2, 28000, 14000, '2025-02-11 17:36:42', '94477540', 'activo'),
(38, 27, 12, 'camisa', 2, 28000, 14000, '2025-02-11 17:36:49', '94477540', 'activo'),
(39, 28, 1, 'patin', 2, 28000, 14000, '2025-02-11 17:49:27', '94477540', 'activo'),
(40, 29, 1, 'patin', 5, 70000, 14000, '2025-02-11 17:49:48', '94477540', 'activo'),
(41, 30, 1, 'patin', 3, 42000, 14000, '2025-02-11 17:50:10', '94477540', 'activo'),
(42, 31, 1, 'patin', 3, 42000, 14000, '2025-02-11 17:50:28', '94477540', 'activo'),
(43, 32, 12, 'camisa', 1, 14000, 14000, '2025-02-11 17:52:15', '94477540', 'activo'),
(44, 33, 1, 'patines', 10, 140000, 14000, '2025-02-12 08:25:04', '94477540', 'activo'),
(45, 34, 1, 'patin', 1, 14000, 14000, '2025-02-12 08:50:27', '94477540', 'activo'),
(46, 35, 1, 'patin', 1, 14000, 14000, '2025-02-12 08:51:44', '94477540', 'activo'),
(47, 36, 2, 'camibuzo', 2, 106000, 53000, '2025-02-12 08:56:35', '94477540', 'activo'),
(48, 37, 2, 'camibuzo', 2, 106000, 53000, '2025-02-12 09:21:45', '94477540', 'activo'),
(49, 38, 5, 'gorra', 3, 84000, 28000, '2025-02-12 09:36:41', '94477540', 'activo'),
(50, 39, 5, 'gorra', 5, 140000, 28000, '2025-02-12 09:47:23', '94477540', 'activo'),
(51, 40, 12, 'camisa', 2, 28000, 14000, '2025-02-12 09:53:18', '94477540', 'activo'),
(52, 41, 5, 'gorra', 5, 140000, 28000, '2025-02-12 09:57:16', '94477540', 'activo'),
(53, 42, 11, 'pantaloncito', 3, 150000, 50000, '2025-02-12 10:02:29', '94477540', 'activo'),
(54, 42, 1, 'patin', 5, 70000, 14000, '2025-02-12 10:02:29', '94477540', 'activo'),
(55, 43, 11, 'pantaloncito', 2, 100000, 50000, '2025-02-12 10:03:06', '94477540', 'activo'),
(56, 43, 1, 'patin', 5, 70000, 14000, '2025-02-12 10:03:06', '94477540', 'activo'),
(57, 44, 11, 'pantaloncito', 2, 100000, 50000, '2025-02-12 10:03:16', '94477540', 'activo'),
(58, 44, 1, 'patin', 5, 70000, 14000, '2025-02-12 10:03:16', '94477540', 'activo'),
(59, 45, 11, 'pantaloncito', 2, 100000, 50000, '2025-02-12 10:04:36', '94477540', 'activo'),
(60, 45, 1, 'patin', 5, 70000, 14000, '2025-02-12 10:04:36', '94477540', 'activo'),
(61, 46, 19, 'patineta', 2, 132222, 66111, '2025-02-13 08:27:03', '16385007', 'activo'),
(62, 47, 19, 'patineta', 2, 132222, 66111, '2025-02-13 08:44:39', '94477540', 'activo'),
(63, 48, 19, 'patineta', 1, 66111, 66111, '2025-02-13 09:28:14', '16385007', 'activo'),
(64, 49, 19, 'patineta', 2, 132222, 66111, '2025-02-14 18:44:18', '94477540', 'activo'),
(65, 49, 1, 'patin', 2, 28000, 14000, '2025-02-14 18:44:18', '94477540', 'activo');

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
(1, 'lbp-0144', 'lbp-00177', 'patin', 'profesionales niños y niñas', 5, 10000, 1, 15, 14000, 3923, 400, '2025-02-05 15:53:23', '94477540', 'activo'),
(2, 'sv-001', 'sv-001', 'camibuzo', 'hombre', 23, 40000, 1, 10, 52889, 100, 6, '2025-02-05 15:56:29', '94477540', 'activo'),
(3, 'lbp-004', 'lbp-004', 'ruedas', 'ruta talla 16&#34;', 3, 45000, 0, 10, 50000, 60, 6, '2025-02-05 15:56:29', '94477540', 'activo'),
(4, 'lbp-003', 'lbp-003', 'falda', 'mujerr', 21, 12000, 1, 10, 16000, 50, 5, '2025-02-05 15:56:29', '94477540', 'activo'),
(5, 'lbp-002', 'lbp-002', 'gorra', 'hombre ', 13, 20000, 0, 15, 28000, -10, 5, '2025-02-05 15:56:29', '94477540', 'activo'),
(6, 'tp-001', 'tp-001', 'tapete', 'sala ', 24, 20000, 1, 10, 27000, 20, 5, '2025-02-05 15:57:37', '94477540', 'activo'),
(7, 'tr-43', '32902', 'silla', 'de oficina verde', 25, 20000, 1, 20, 29750, 10, 1, '2025-02-05 16:04:08', '94477540', 'activo'),
(8, 'ex-45', '423', 'extintor', 'amarillo', 26, 25000, 1, 15, 35000, 20, 3, '2025-02-05 16:07:12', '94477540', 'activo'),
(9, 'fr-84', '4302', 'extintor', 'rojo de 3lb', 26, 30000, 0, 15, 35294.1, 0, 3, '2025-02-05 16:07:12', '94477540', 'activo'),
(10, 'lbp-00166', 'lbp-00166', 'collar', 'mujer', 9, 15000, 1, 10, 20000, 20, 5, '2025-02-05 17:01:24', '94477540', 'activo'),
(11, 'lbp-00155', 'lbp-00155', 'pantaloncito', 'hombre color azil', 6, 45000, 0, 10, 50000, 24, 5, '2025-02-05 17:01:24', '94477540', 'activo'),
(12, 'pp-001', 'pp-001', 'camisa', 'hombre', 27, 10000, 1, 15, 14000, -15, 4, '2025-02-05 17:09:16', '94477540', 'activo'),
(13, 'fft-001', 'fft-001', 'flauta', 'flauta para niño', 28, 20000, 1, 15, 28000, 40, 5, '2025-02-11 15:36:38', '94477540', 'activo'),
(14, 'mñ-001', 'mñ-001', 'moña', 'niña color negro', 31, 1000, 1, 10, 5000, 50, 20, '2025-02-12 13:21:20', '94477540', 'activo'),
(15, 'ndg-010', 'ndg-010', 'gafas', 'de sol para mujer', 30, 20000, 1, 15, 28000, 50, 5, '2025-02-12 13:21:20', '94477540', 'activo'),
(16, 'jp-001', 'jp-001', 'anillo', 'anillo niña', 29, 10000, 1, 15, 14000, 30, 5, '2025-02-12 13:21:20', '94477540', 'activo'),
(17, 'crr-001', 'crr-001', 'correa', 'cuero para hombre talla 36', 33, 17000, 1, 10, 22600, 50, 5, '2025-02-13 07:52:57', '94477540', 'activo'),
(18, 'lmt-001', 'lmt-001', 'leguis', 'mujer talla unica', 32, 20000, 1, 10, 27000, 50, 10, '2025-02-13 07:52:57', '94477540', 'activo'),
(19, 'lbp-010', 'lbp-010', 'patineta', 'patineta para niño', 34, 50000, 1, 10, 66111, 53, 10, '2025-02-13 08:23:24', '94477540', 'activo');

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
  `estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`contador_usuarios`, `tipo_doc`, `documento`, `nombre`, `apellido`, `fecha_nacimiento`, `celular`, `ciudad`, `direccion`, `rol`, `correo`, `contra`, `documento_operador`, `tiempo_registro`, `reset_token`, `token_expiration`, `estado`) VALUES
(1, 'cedula de ciudadania', '94477540', 'eduar', 'corrales grisalez', '1981-09-04', '3186941522', 'buga', 'carrera 8 # 13-11', 'administrador', 'edcorgris@gmail.com', '$2y$10$ccjR7dsD8JgehLwqnbEkfeW4qleia8g5QwnEZQEUwbaJDmPGl1YsC', '', '2025-02-10 13:39:01', '', '0000-00-00 00:00:00', 'activo'),
(2, 'Cedula de Ciudadania', '16385007', 'Ney', 'Corrales', '1997-01-11', '3028594814', 'Cali', 'Calle 9 # 5-11', 'vendedor', 'neyco@gmail.com', '$2y$10$K7xtVlypBe5mpi1Ip9wt7./jB1KlD/3dORj8SjesK/qVzqaKpiuG6', '', '2025-02-12 10:55:44', '', '0000-00-00 00:00:00', 'activo');

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
(49, 'Venta de productos', 160222, 'efectivo', NULL, NULL, '2025-02-14 18:44:18', '94477540', 'activo', 180000.00, 19778.00);

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `contador_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `contador_clientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `cont_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `cont_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `contador_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `cont_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
