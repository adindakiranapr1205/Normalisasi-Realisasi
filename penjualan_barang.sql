-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Nov 2023 pada 13.34
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan barang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_penjualan_brg`
--

CREATE TABLE `detail_penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `id_customer`
--

CREATE TABLE `id_customer` (
  `id_customer` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_brg`
--

CREATE TABLE `kode_brg` (
  `kode_brg` varchar(50) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_brg`
--

CREATE TABLE `penjualan_brg` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` date NOT NULL,
  `kode_brg` varchar(50) NOT NULL,
  `id_customer` varchar(50) NOT NULL,
  `qty_penjualan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan_brg2`
--

CREATE TABLE `penjualan_brg2` (
  `no_jual` varchar(50) NOT NULL,
  `tgl_jual` date NOT NULL,
  `id_customer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD PRIMARY KEY (`no_jual`,`kode_brg`),
  ADD KEY `kode_brg` (`kode_brg`);

--
-- Indeks untuk tabel `id_customer`
--
ALTER TABLE `id_customer`
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `kode_brg`
--
ALTER TABLE `kode_brg`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indeks untuk tabel `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indeks untuk tabel `penjualan_brg2`
--
ALTER TABLE `penjualan_brg2`
  ADD PRIMARY KEY (`no_jual`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_penjualan_brg`
--
ALTER TABLE `detail_penjualan_brg`
  ADD CONSTRAINT `detail_penjualan_brg_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`),
  ADD CONSTRAINT `detail_penjualan_brg_ibfk_2` FOREIGN KEY (`no_jual`) REFERENCES `penjualan_brg2` (`no_jual`);

--
-- Ketidakleluasaan untuk tabel `penjualan_brg`
--
ALTER TABLE `penjualan_brg`
  ADD CONSTRAINT `penjualan_brg_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `kode_brg` (`kode_brg`),
  ADD CONSTRAINT `penjualan_brg_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`);

--
-- Ketidakleluasaan untuk tabel `penjualan_brg2`
--
ALTER TABLE `penjualan_brg2`
  ADD CONSTRAINT `penjualan_brg2_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `id_customer` (`id_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
