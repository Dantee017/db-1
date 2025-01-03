/*
 Navicat Premium Dump SQL

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40-0ubuntu0.22.04.1)
 Source Host           : localhost:3306
 Source Schema         : mahmut

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 03/01/2025 14:39:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bildirimler
-- ----------------------------
DROP TABLE IF EXISTS `bildirimler`;
CREATE TABLE `bildirimler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Mesaj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gönderilme Tarihi` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bildirimler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for biletler
-- ----------------------------
DROP TABLE IF EXISTS `biletler`;
CREATE TABLE `biletler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Ücret` int NOT NULL,
  `Tür(Normal,Vip,VVip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Miktar` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of biletler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_cizelgesi
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_cizelgesi`;
CREATE TABLE `etkinlik_cizelgesi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `etkinlik_id` bigint unsigned NOT NULL,
  `etkinlik adı` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Baslangıc Zamanı` timestamp NOT NULL,
  `Bitiş Zamanı` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlik_cizelgesi_etkinlik_id_foreign` (`etkinlik_id`),
  CONSTRAINT `etkinlik_cizelgesi_etkinlik_id_foreign` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_cizelgesi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_fotografları
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_fotografları`;
CREATE TABLE `etkinlik_fotografları` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `etkinlik_id` bigint unsigned NOT NULL,
  `URL` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlik_fotografları_etkinlik_id_foreign` (`etkinlik_id`),
  CONSTRAINT `etkinlik_fotografları_etkinlik_id_foreign` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_fotografları
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_kategorileri
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_kategorileri`;
CREATE TABLE `etkinlik_kategorileri` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Acıklama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tarih` timestamp NOT NULL,
  `Baslangıc Zamanı` timestamp NOT NULL,
  `Bitis Zamanı` timestamp NOT NULL,
  `etkinlik_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlik_kategorileri_etkinlik_id_foreign` (`etkinlik_id`),
  CONSTRAINT `etkinlik_kategorileri_etkinlik_id_foreign` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_kategorileri
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_kategorilerine_ilıskılendırme
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_kategorilerine_ilıskılendırme`;
CREATE TABLE `etkinlik_kategorilerine_ilıskılendırme` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `etkinlik_id` bigint unsigned NOT NULL,
  `kategori_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlik_kategorilerine_ilıskılendırme_etkinlik_id_foreign` (`etkinlik_id`),
  KEY `etkinlik_kategorilerine_ilıskılendırme_kategori_id_foreign` (`kategori_id`),
  CONSTRAINT `etkinlik_kategorilerine_ilıskılendırme_etkinlik_id_foreign` FOREIGN KEY (`etkinlik_id`) REFERENCES `etkinlikler` (`id`),
  CONSTRAINT `etkinlik_kategorilerine_ilıskılendırme_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `etkinlik_kategorileri` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_kategorilerine_ilıskılendırme
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_konusmacısı
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_konusmacısı`;
CREATE TABLE `etkinlik_konusmacısı` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Uzmanlık Alanı` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `etkinlik_konusmacısı_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_konusmacısı
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_raporları
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_raporları`;
CREATE TABLE `etkinlik_raporları` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Toplam Katılımcı Sayısı` int NOT NULL,
  `Ortalama Etkinlik Puanı` double(8,2) NOT NULL,
  `Hasılat` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_raporları
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlik_sponsorları
-- ----------------------------
DROP TABLE IF EXISTS `etkinlik_sponsorları`;
CREATE TABLE `etkinlik_sponsorları` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlik_sponsorları
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for etkinlikler
-- ----------------------------
DROP TABLE IF EXISTS `etkinlikler`;
CREATE TABLE `etkinlikler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Acıklama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konum_id` bigint unsigned NOT NULL,
  `organizator_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etkinlikler_konum_id_foreign` (`konum_id`),
  KEY `etkinlikler_organizator_id_foreign` (`organizator_id`),
  CONSTRAINT `etkinlikler_konum_id_foreign` FOREIGN KEY (`konum_id`) REFERENCES `konumlar` (`id`),
  CONSTRAINT `etkinlikler_organizator_id_foreign` FOREIGN KEY (`organizator_id`) REFERENCES `organizatorler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of etkinlikler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for geri_bildirimler
-- ----------------------------
DROP TABLE IF EXISTS `geri_bildirimler`;
CREATE TABLE `geri_bildirimler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Rating` double(8,2) NOT NULL,
  `Geri DÖnüşler` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Yolladığı Zaman` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of geri_bildirimler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gonulluler
-- ----------------------------
DROP TABLE IF EXISTS `gonulluler`;
CREATE TABLE `gonulluler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Yetenekler` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gonulluler_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of gonulluler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for indirimler
-- ----------------------------
DROP TABLE IF EXISTS `indirimler`;
CREATE TABLE `indirimler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Kod` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `İndirim Miktarı` int NOT NULL,
  `Geçerlilik Tarihi` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `indirimler_kod_unique` (`Kod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of indirimler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for kayıtbilgileri
-- ----------------------------
DROP TABLE IF EXISTS `kayıtbilgileri`;
CREATE TABLE `kayıtbilgileri` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Kayıt Tarihi` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of kayıtbilgileri
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for konumlar
-- ----------------------------
DROP TABLE IF EXISTS `konumlar`;
CREATE TABLE `konumlar` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Kapatise` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of konumlar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2024_12_30_114419_organizatorler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2024_12_30_114436_sponsorlar', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2024_12_30_114458_gonulluler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2024_12_30_114613_konumlar', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2024_12_30_130435_etkinlikler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2024_12_30_130443_etkinlik_kategorileri', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2024_12_30_130451_etkinlk_kategorilerine_ilıskılendırme', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2024_12_30_130502_etkinlik_sponsorları', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2024_12_30_130643_etkinlik_cizelgesi', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2024_12_30_130701_etkinlik_fotografları', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15, '2024_12_30_130714_biletler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16, '2024_12_30_130728_indirimler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17, '2024_12_30_130739_kayıtbilgileri', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18, '2024_12_30_130834_odeme', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19, '2024_12_30_130855_etkinlik_raporları', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20, '2024_12_30_130903_bildirimler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21, '2024_12_30_130918_geri_bildirimler', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22, '2024_12_30_130930_tanıtım_kampanyaları', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23, '2024_12_30_130936_etkinlik_konusmacısı', 1);
COMMIT;

-- ----------------------------
-- Table structure for odeme
-- ----------------------------
DROP TABLE IF EXISTS `odeme`;
CREATE TABLE `odeme` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Miktar` int NOT NULL,
  `ÖdemeTarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ödeme Yöntemi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of odeme
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for organizatorler
-- ----------------------------
DROP TABLE IF EXISTS `organizatorler`;
CREATE TABLE `organizatorler` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizatorler_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of organizatorler
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sponsorlar
-- ----------------------------
DROP TABLE IF EXISTS `sponsorlar`;
CREATE TABLE `sponsorlar` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Katkı Tutarı` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sponsorlar_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sponsorlar
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tanıtım_kampanyaları
-- ----------------------------
DROP TABLE IF EXISTS `tanıtım_kampanyaları`;
CREATE TABLE `tanıtım_kampanyaları` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `Platform(e-mail,Social Media)` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Baslangıc Tarihi` timestamp NOT NULL,
  `Bitiş Tarihi` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tanıtım_kampanyaları
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
