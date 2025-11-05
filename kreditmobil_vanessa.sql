-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Nov 2025 pada 08.59
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kreditmobil_vanessa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayar_cicilan`
--

CREATE TABLE `bayar_cicilan` (
  `kode_cicilan` int(11) NOT NULL,
  `kode_kredit` int(11) NOT NULL,
  `tgl_cicilan` date NOT NULL,
  `jumlah_cicilan` int(8) NOT NULL,
  `cicilan_ke` int(3) NOT NULL,
  `cicilan_sisa_ke` int(3) NOT NULL,
  `cicilan_sisa_harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `beli_cash`
--

CREATE TABLE `beli_cash` (
  `kode_cash` int(100) NOT NULL,
  `ktp` int(50) NOT NULL,
  `kode_mobil` int(11) NOT NULL,
  `cash_tgl` date NOT NULL,
  `cash_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kredit`
--

CREATE TABLE `kredit` (
  `kode_kredit` int(11) NOT NULL,
  `ktp` int(50) NOT NULL,
  `kode_paket` int(11) NOT NULL,
  `kode_mobil` int(11) NOT NULL,
  `tgl_kredit` date NOT NULL,
  `fotokopi_ktp` int(11) NOT NULL,
  `fotokopi_kk` int(11) NOT NULL,
  `fotokopi_slip_gaji` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `kode_mobil` int(11) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `warna` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_kredit`
--

CREATE TABLE `paket_kredit` (
  `kode_paket` int(11) NOT NULL,
  `harga_paket` int(50) NOT NULL,
  `uang_muka` int(50) NOT NULL,
  `paket_jumlah_cicilan` int(4) NOT NULL,
  `bunga` int(10) NOT NULL,
  `nilai_cicilan` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `ktp` int(50) NOT NULL,
  `nama_pembeli` char(100) NOT NULL,
  `alamat_pembeli` text NOT NULL,
  `telp_pembeli` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bayar_cicilan`
--
ALTER TABLE `bayar_cicilan`
  ADD PRIMARY KEY (`kode_cicilan`),
  ADD KEY `kode_kredit` (`kode_kredit`);

--
-- Indeks untuk tabel `beli_cash`
--
ALTER TABLE `beli_cash`
  ADD PRIMARY KEY (`kode_cash`),
  ADD KEY `ktp` (`ktp`),
  ADD KEY `kode_mobil` (`kode_mobil`);

--
-- Indeks untuk tabel `kredit`
--
ALTER TABLE `kredit`
  ADD PRIMARY KEY (`kode_kredit`),
  ADD KEY `ktp` (`ktp`),
  ADD KEY `kode_paket` (`kode_paket`),
  ADD KEY `kode_mobil` (`kode_mobil`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`kode_mobil`);

--
-- Indeks untuk tabel `paket_kredit`
--
ALTER TABLE `paket_kredit`
  ADD PRIMARY KEY (`kode_paket`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`ktp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bayar_cicilan`
--
ALTER TABLE `bayar_cicilan`
  MODIFY `kode_cicilan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `beli_cash`
--
ALTER TABLE `beli_cash`
  MODIFY `kode_cash` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kredit`
--
ALTER TABLE `kredit`
  MODIFY `kode_kredit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mobil`
--
ALTER TABLE `mobil`
  MODIFY `kode_mobil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paket_kredit`
--
ALTER TABLE `paket_kredit`
  MODIFY `kode_paket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `ktp` int(50) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bayar_cicilan`
--
ALTER TABLE `bayar_cicilan`
  ADD CONSTRAINT `bayar_cicilan_ibfk_1` FOREIGN KEY (`kode_kredit`) REFERENCES `kredit` (`kode_kredit`);

--
-- Ketidakleluasaan untuk tabel `beli_cash`
--
ALTER TABLE `beli_cash`
  ADD CONSTRAINT `beli_cash_ibfk_1` FOREIGN KEY (`kode_mobil`) REFERENCES `mobil` (`kode_mobil`),
  ADD CONSTRAINT `beli_cash_ibfk_2` FOREIGN KEY (`ktp`) REFERENCES `pembeli` (`ktp`);

--
-- Ketidakleluasaan untuk tabel `kredit`
--
ALTER TABLE `kredit`
  ADD CONSTRAINT `kredit_ibfk_1` FOREIGN KEY (`kode_paket`) REFERENCES `paket_kredit` (`kode_paket`),
  ADD CONSTRAINT `kredit_ibfk_2` FOREIGN KEY (`kode_mobil`) REFERENCES `mobil` (`kode_mobil`),
  ADD CONSTRAINT `kredit_ibfk_3` FOREIGN KEY (`ktp`) REFERENCES `pembeli` (`ktp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
