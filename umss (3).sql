-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 16-03-2025 a las 21:22:27
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
-- Base de datos: `umss`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `costo` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `nombre`, `costo`, `created_at`, `updated_at`) VALUES
(1, 'Matemáticas', 100.00, '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 'Ciencias', 120.00, '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(3, 'Literatura', 80.00, '2025-03-15 00:30:11', '2025-03-15 00:30:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta_pago`
--

CREATE TABLE `boleta_pago` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_boleta` varchar(255) NOT NULL,
  `monto` decimal(8,2) NOT NULL,
  `inscripcion_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `boleta_pago`
--

INSERT INTO `boleta_pago` (`id`, `numero_boleta`, `monto`, `inscripcion_id`, `created_at`, `updated_at`) VALUES
(1, 'B001', 100.00, 1, '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 'B002', 120.00, 2, '2025-03-15 00:30:11', '2025-03-15 00:30:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_pago`
--

CREATE TABLE `comprobante_pago` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `archivo_comprobante` varchar(255) NOT NULL,
  `numero_comprobante` varchar(255) NOT NULL,
  `nombre_pagador` varchar(255) NOT NULL,
  `estado_verificacion` enum('Pendiente','Verificado','Rechazado') NOT NULL DEFAULT 'Pendiente',
  `boleta_pago_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comprobante_pago`
--

INSERT INTO `comprobante_pago` (`id`, `archivo_comprobante`, `numero_comprobante`, `nombre_pagador`, `estado_verificacion`, `boleta_pago_id`, `created_at`, `updated_at`) VALUES
(1, 'comprobante1.pdf', 'C001', 'Juan Pérez', 'Pendiente', 1, '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 'comprobante2.pdf', 'C002', 'María Gómez', 'Verificado', 2, '2025-03-15 00:30:11', '2025-03-15 00:30:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `olimpista_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `tutor_id` bigint(20) UNSIGNED NOT NULL,
  `estado` enum('Pendiente','Pagado','Verificado') NOT NULL DEFAULT 'Pendiente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id`, `olimpista_id`, `area_id`, `tutor_id`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Pendiente', '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 2, 2, 2, 'Pagado', '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(3, 1, 1, 1, 'Pendiente', '2025-03-15 19:05:32', '2025-03-15 19:05:32'),
(4, 4, 2, 2, 'Pagado', '2025-03-15 19:05:32', '2025-03-15 19:05:32'),
(5, 5, 3, 2, 'Verificado', '2025-03-15 19:05:32', '2025-03-15 19:05:32'),
(6, 6, 1, 1, 'Pendiente', '2025-03-15 19:05:32', '2025-03-15 19:05:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_categoria`
--

CREATE TABLE `nivel_categoria` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nivel_categoria`
--

INSERT INTO `nivel_categoria` (`id`, `nombre`, `descripcion`, `area_id`, `created_at`, `updated_at`) VALUES
(1, 'Básico', 'Nivel básico de Matemáticas', 1, '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 'Intermedio', 'Nivel intermedio de Ciencias', 2, '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(3, 'Avanzado', 'Nivel avanzado de Literatura', 3, '2025-03-15 00:30:11', '2025-03-15 00:30:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `olimpista`
--

CREATE TABLE `olimpista` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `colegio` varchar(255) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `olimpista`
--

INSERT INTO `olimpista` (`id`, `nombres`, `apellidos`, `ci`, `fecha_nacimiento`, `correo`, `telefono`, `colegio`, `curso`, `departamento`, `provincia`, `created_at`, `updated_at`) VALUES
(1, 'Carlos', 'López', '9876543', '2005-05-15', 'carlos.lopez@example.com', '71234567', 'Colegio San José', '5to de secundaria', 'La Paz', 'Murillo', '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 'Ana', 'Martínez', '4567890', '2006-08-20', 'ana.martinez@example.com', '72345678', 'Colegio María Auxiliadora', '4to de secundaria', 'Cochabamba', 'Cercado', '2025-03-15 00:30:11', '2025-03-15 00:30:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`id`, `nombres`, `apellidos`, `ci`, `correo`, `telefono`, `created_at`, `updated_at`) VALUES
(1, 'Juan', 'Pérez', '1234567', 'juan.perez@example.com', '70012345', '2025-03-15 00:30:11', '2025-03-15 00:30:11'),
(2, 'María', 'Gómez', '7654321', 'maria.gomez@example.com', '70123456', '2025-03-15 00:30:11', '2025-03-15 00:30:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `area_nombre_unique` (`nombre`);

--
-- Indices de la tabla `boleta_pago`
--
ALTER TABLE `boleta_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobante_pago`
--
ALTER TABLE `comprobante_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nivel_categoria`
--
ALTER TABLE `nivel_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `olimpista`
--
ALTER TABLE `olimpista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tutor_ci_unique` (`ci`),
  ADD UNIQUE KEY `tutor_correo_unique` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `boleta_pago`
--
ALTER TABLE `boleta_pago`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comprobante_pago`
--
ALTER TABLE `comprobante_pago`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel_categoria`
--
ALTER TABLE `nivel_categoria`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `olimpista`
--
ALTER TABLE `olimpista`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
