# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 192.168.2.240 (MySQL 8.0.32)
# 数据库: cas
# 生成时间: 2023-04-06 02:50:30 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 access_strategy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access_strategy`;

CREATE TABLE `access_strategy` (
  `id` bigint NOT NULL,
  `access_Strategy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `access_Strategy_Type` varchar(255) NOT NULL,
  `app_Id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7r6m5onohjenncbvpdsoknv5l` (`app_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Authentication_Handlers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Authentication_Handlers`;

CREATE TABLE `Authentication_Handlers` (
  `id` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `body_Type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `related_Authn_Id` varchar(255) DEFAULT NULL,
  `related_With_Mail` bit(1) DEFAULT NULL,
  `related_With_Phone` bit(1) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Cas_Event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cas_Event`;

CREATE TABLE `Cas_Event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creation_Time` varchar(255) NOT NULL,
  `principal_Id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 CAS_SETTINGS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CAS_SETTINGS`;

CREATE TABLE `CAS_SETTINGS` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 COM_AUDIT_TRAIL
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COM_AUDIT_TRAIL`;

CREATE TABLE `COM_AUDIT_TRAIL` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `AUD_ACTION` varchar(255) DEFAULT NULL,
  `APPLIC_CD` varchar(255) DEFAULT NULL,
  `AUD_CLIENT_IP` varchar(255) DEFAULT NULL,
  `AUD_DATE` datetime(6) NOT NULL,
  `AUD_RESOURCE` varchar(2048) DEFAULT NULL,
  `AUD_SERVER_IP` varchar(255) DEFAULT NULL,
  `AUD_USER` varchar(255) DEFAULT NULL,
  `AUD_USERAGENT` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 events_properties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events_properties`;

CREATE TABLE `events_properties` (
  `event_Id` bigint NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`event_Id`,`name`),
  CONSTRAINT `FKnhtycho45cd8rblq0ka0gaufg` FOREIGN KEY (`event_Id`) REFERENCES `Cas_Event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Google_Authenticator_Registration_Record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Google_Authenticator_Registration_Record`;

CREATE TABLE `Google_Authenticator_Registration_Record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `registration_Date` datetime(6) DEFAULT NULL,
  `secret_Key` varchar(2048) NOT NULL,
  `username` varchar(255) NOT NULL,
  `validation_Code` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbfdvvfhi8n022v1yket0jajih` (`username`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Google_Authenticator_Token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Google_Authenticator_Token`;

CREATE TABLE `Google_Authenticator_Token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `issued_Date_Time` datetime(6) NOT NULL,
  `token` int NOT NULL,
  `user_Id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Jpa_Multifactor_Authentication_Trust_Record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Jpa_Multifactor_Authentication_Trust_Record`;

CREATE TABLE `Jpa_Multifactor_Authentication_Trust_Record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_Fingerprint` varchar(2048) NOT NULL,
  `expiration_Date` datetime(6) NOT NULL,
  `record_Name` varchar(4000) NOT NULL,
  `principal` varchar(255) NOT NULL,
  `record_Date` timestamp NOT NULL,
  `record_Key` varchar(4000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 native
# ------------------------------------------------------------

DROP TABLE IF EXISTS `native`;

CREATE TABLE `native` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 org
# ------------------------------------------------------------

DROP TABLE IF EXISTS `org`;

CREATE TABLE `org` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_Sort` bigint DEFAULT NULL,
  `parent_Id` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 org_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `org_user`;

CREATE TABLE `org_user` (
  `id` bigint NOT NULL,
  `org_Id` varchar(255) NOT NULL,
  `org_Path` varchar(255) NOT NULL,
  `principal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_Id` (`org_Id`,`principal`),
  UNIQUE KEY `UKda5y655gsqbxeckcasync9lqm` (`org_Id`,`principal`),
  KEY `uniq_p` (`principal`),
  KEY `user` (`principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Passwordless_Authentication_Token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Passwordless_Authentication_Token`;

CREATE TABLE `Passwordless_Authentication_Token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `EXP_DATE` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 pm_table_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pm_table_accounts`;

CREATE TABLE `pm_table_accounts` (
  `id` int DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 pm_table_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pm_table_questions`;

CREATE TABLE `pm_table_questions` (
  `id` int DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Registered_Services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Registered_Services`;

CREATE TABLE `Registered_Services` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `evaluation_Order` int NOT NULL,
  `evaluation_Priority` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `service_Id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Saml_IdPMetadata_Document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Saml_IdPMetadata_Document`;

CREATE TABLE `Saml_IdPMetadata_Document` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `applies_To` varchar(512) DEFAULT NULL,
  `encryption_Certificate` text,
  `encryption_Key` text,
  `metadata` text,
  `signing_Certificate` text,
  `signing_Key` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_g1t159ol669a7g69u6xkpw3bx` (`applies_To`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 Saml_Metadata_Document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Saml_Metadata_Document`;

CREATE TABLE `Saml_Metadata_Document` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `signature` longtext,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 scratch_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scratch_codes`;

CREATE TABLE `scratch_codes` (
  `id` bigint NOT NULL,
  `scratch_Codes` int NOT NULL,
  KEY `FKmneuc3ux4ho26jqepo36wfoj9` (`id`),
  CONSTRAINT `FKmneuc3ux4ho26jqepo36wfoj9` FOREIGN KEY (`id`) REFERENCES `Google_Authenticator_Registration_Record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 service_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_config`;

CREATE TABLE `service_config` (
  `id` bigint NOT NULL,
  `app_Id` bigint NOT NULL,
  `app_Type` varchar(255) NOT NULL,
  `config` longtext NOT NULL,
  `config_Type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_eqvnsr10935mspdw7fmhjcaty` (`app_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 service_sequence
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service_sequence`;

CREATE TABLE `service_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 t_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_attribute`;

CREATE TABLE `t_attribute` (
  `id` int DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



# 转储表 t_cas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_cas`;

CREATE TABLE `t_cas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `loginId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `source` bigint DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(256) DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_userId` (`userId`),
  UNIQUE KEY `uniq_login_source` (`loginId`,`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;



# 转储表 user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `source` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `avatar` longtext DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpepg6phi59kkgs77pa8atm5a3` (`user_Id`,`source`),
  UNIQUE KEY `UK_konrexqncmw6p8tc97r2f2nd3` (`principal`),
  KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


set GLOBAL max_connections=256;
set global wait_timeout=100;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `Authentication_Handlers` (`id`, `body`, `body_Type`, `name`, `related_Authn_Id`, `related_With_Mail`, `related_With_Phone`, `state`, `type`)
VALUES
	('-1024', '{}', 'java.util.HashMap', '密码登录', NULL, 0, 0, 'ACTIVE', 'pass_word');

INSERT INTO `org` (`id`, `name`, `order_Sort`, `parent_Id`, `path`, `source`, `type`, `created`, `updated`)
VALUES
	('0', '我的企业', 0, NULL, '/0', '-1024', 'pass_word', now(), now());

INSERT INTO `user` (`id`, `principal`, `user_Id`, `source`, `email`, `mobile`, `avatar`, `name`, `password`, `state`, `created`, `updated`)
VALUES
	(1, 'authsaur-admin', 'authsaur-admin', -1024, 'authsaur@example.com', '', 'data:image/png;base64,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', '管理员', '9414f9301cdb492b4dcd83f8c711d8bb', 0, now(), now());

INSERT INTO `org_user` (`id`, `org_Id`, `org_Path`, `principal`)
VALUES
	(1, '0', '/0', 'authsaur-admin');


INSERT INTO `Saml_IdPMetadata_Document` (`id`, `applies_To`, `encryption_Certificate`, `encryption_Key`, `metadata`, `signing_Certificate`, `signing_Key`)
VALUES
	(1, 'CAS', '-----BEGIN CERTIFICATE-----\nMIIDETCCAfmgAwIBAgIUXm8ZB5gu7RDPePJa6bPBDMNm5/kwDQYJKoZIhvcNAQEL\nBQAwFzEVMBMGA1UEAwwMY2FzLnNheWkuY29tMB4XDTIyMDUxNjEwMDQyNVoXDTQy\nMDUxNjEwMDQyNVowFzEVMBMGA1UEAwwMY2FzLnNheWkuY29tMIIBIjANBgkqhkiG\n9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7TDZE76trUaCfR1EaHIDWqCs/BcFNIUbF03J\nJ67cOB7vV9IUobp09MD2Ya23P1MJn2fY5ypeK6vCSf5FpzLK2LRL/60qmGC0XtD7\nwl0FHe7aOpBXhplCReKsQbpe7UgnqdwseQDehtuxABy93jmnYkgkRWX3k1Fs1T90\n3nXiui6dqHz5Ki9tdSRyH93Htu7Zi1s1xb+7qU8qz3m+OqA9zoVncTo8CIbtbHhx\nBlErjKHF0f3LQsxZAdNcU3Q6wbaitDdeDYe7fE6FdY2NU4DaUFcol9tMV3HlU3OW\nNLvhcGVcQoqdtFh6ZEV/WWHIDiVfvUOFed2R1jKB3kUZTOj4TwIDAQABo1UwUzAd\nBgNVHQ4EFgQULSLVTFygeCA9YfxL0xkUBYqVXJYwMgYDVR0RBCswKYIMY2FzLnNh\neWkuY29thhljYXMuc2F5aS5jb20vaWRwL21ldGFkYXRhMA0GCSqGSIb3DQEBCwUA\nA4IBAQBWGs9lE/Um7xUBxTGWsumoX+ZumuacafPWUBDctdRnaUF99h4Ug6XeRut0\n1HT1vvx7hte5ihUnV9aG9O0o1z0H2AnvQITsHpAsHaofenmwl71dp86UpUKLQE5S\nx+pfWr2LajJq8EGBsrzIY8+cb95FfOEgO37l6Uxmhei9B+5a2+x3Gdfb3DVTE/A2\nTKBhgXRX3uiCFDQpx93wEuj9b1j4Q6oUpyXCWDTk32Ic1e4k4T8OHz/MEfunV0YE\nt0LxBN9uIqv7XiQvL3/+guPM1BLt+xTZeniuiJ4DpX0EwKeJBBI4lGD85GYeAM0w\nx3VZAXQt/p12ql55Il5XBmvlhtLk\n-----END CERTIFICATE-----\n', '-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA7TDZE76trUaCfR1EaHIDWqCs/BcFNIUbF03JJ67cOB7vV9IU\nobp09MD2Ya23P1MJn2fY5ypeK6vCSf5FpzLK2LRL/60qmGC0XtD7wl0FHe7aOpBX\nhplCReKsQbpe7UgnqdwseQDehtuxABy93jmnYkgkRWX3k1Fs1T903nXiui6dqHz5\nKi9tdSRyH93Htu7Zi1s1xb+7qU8qz3m+OqA9zoVncTo8CIbtbHhxBlErjKHF0f3L\nQsxZAdNcU3Q6wbaitDdeDYe7fE6FdY2NU4DaUFcol9tMV3HlU3OWNLvhcGVcQoqd\ntFh6ZEV/WWHIDiVfvUOFed2R1jKB3kUZTOj4TwIDAQABAoIBADKxqQOuUkJheowx\nECjejVb2VmJ+rQ8fj724U1DW75xTCEaV0PEL/+k7wKz5ytuO7NSUBmjJxlzBFgJo\nhQyKL46HYmLf6OWubX6CXfyZkvllzmCL7xkGcoKrQrO9mIJQVKHaO+sUw3rBQ6BJ\nhE8VtW+tCYuHkpV65q7hJCJTwcSWvqhCw6Sas7PahLwXS+RcZnNSdyvs7dYjK6Gd\n0MKc692RdJRPTKQYrm9phgQZNEA3h8TkE2dUlFWWjm+eU2XgsdeZ7tkjucuMJxDJ\ndGf/hGa6zOAqMpp2/eH9jt8CQLkkBY5JZJsERcq4p/IsuiXRmZD3l9A4uUHk4e8e\n2Hm0cckCgYEA9p8N9Vr5qJiRJI6xdk2ZTVtfCfh31O7o2QV33fZIZ5RCmAEEM0Pw\nOyvta9SVJXkWgBAkGjE5ePGDtmGUskT3hiiJbFIeKJKZf7lQCvMwS+67jqG5YRzc\nSod6F6vopImFLPb/jsYowoXqcpXK9mNpFLX1SRt7WlpbdAW3vz+GXI0CgYEA9jX7\n9zEcgVHMHTbi4g782tYs7Ioc0+br2jWX5s1ZozDAVMUuW+adHrQf93BdQNibJ7Pt\nK0uCwu2Dt741q5x0ZuhYh5SVHCDikx+/KOdz/LZjoKIPFHeLTwEPWwfvvGkL0QTV\nAd+ammgnIdcKmGDPtsuOe2PD83vNCqptFS0UB0sCgYB5qRkvsoN6oljnmeT9oWZA\n/RQzTPmAd6MyfDoXq0kon8ECT24NBDTcW90x1psE82kgH9ZPfX0Gps39CMJb9x3M\ndu7kGtZ52WgT1A0iebmXm9u2jx1uRNh/g7m9N7b6hETIW8jSW/r7iyiPAkovpfbO\nmry4JfCCMBTxdWih1eqoeQKBgQCjgw6nB9Kqf6xS6pSbFOEQZJTJMqAaio2wCU+s\nVExneIUCx0EWf31xWqawKcuEuVWxdGjaC/f3hM2pRYVXRzx2629/+0lbuOtAUiEe\nBTieaHKZx4bETPATs9yC1C5+rjTOx6q+58VBLlJuwuWidQj9mQozH/qOxXVS1ARF\nv/5BKQKBgQDLn50BNs3dGDaUnBMl8jEGpceLRDzo7S6eJ3xBeKm7GbZjeLB0LeuN\nL2Nys8SBk47HEavtZJ6WnZAPf2k6mVAVFe+4uqxEqo4VwVDensn7Px9Y5+syH+CB\n4Ztu4mSGKQaU406lIBxa6XAPCZR6duY5LyfeHQAd/kgoimrj+mRvLg==\n-----END RSA PRIVATE KEY-----\n', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<EntityDescriptor xmlns=\"urn:oasis:names:tc:SAML:2.0:metadata\" xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\" xmlns:shibmd=\"urn:mace:shibboleth:metadata:1.0\" xmlns:xml=\"http://www.w3.org/XML/1998/namespace\" xmlns:mdui=\"urn:oasis:names:tc:SAML:metadata:ui\" entityID=\"${AUTHSAUR_SERVER}/idp\">\n    <IDPSSODescriptor errorURL=\"${AUTHSAUR_SERVER}/idp/error\" protocolSupportEnumeration=\"urn:oasis:names:tc:SAML:2.0:protocol urn:oasis:names:tc:SAML:1.1:protocol urn:mace:shibboleth:1.0\">\n        <Extensions>\n            <shibmd:Scope regexp=\"false\">example.org</shibmd:Scope>\n\n            <!--\n            <mdui:UIInfo xmlns:mdui=\"urn:oasis:names:tc:SAML:metadata:ui\">\n                <mdui:DisplayName xml:lang=\"en\">CAS</mdui:DisplayName>\n                <mdui:Description xml:lang=\"en\">Apereo CAS</mdui:Description>\n                <mdui:InformationURL xml:lang=\"en\">https://apereo.org/projects/cas</mdui:InformationURL>\n                <mdui:PrivacyStatementURL xml:lang=\"en\">https://apereo.org/projects/cas</mdui:PrivacyStatementURL>\n                <mdui:Logo height=\"60\" width=\"1119\" xml:lang=\"en\">https://apereo.github.io/cas/images/cas_logo.png</mdui:Logo>\n            </mdui:UIInfo>\n            -->\n            \n        </Extensions>\n        <KeyDescriptor use=\"signing\">\n            <ds:KeyInfo>\n                <ds:X509Data>\n                    <ds:X509Certificate>MIIDEDCCAfigAwIBAgITFFUO8IZDHh8dwcjEbY4lYTFfBjANBgkqhkiG9w0BAQsF\nADAXMRUwEwYDVQQDDAxjYXMuc2F5aS5jb20wHhcNMjIwNTE2MTAwNDI0WhcNNDIw\nNTE2MTAwNDI0WjAXMRUwEwYDVQQDDAxjYXMuc2F5aS5jb20wggEiMA0GCSqGSIb3\nDQEBAQUAA4IBDwAwggEKAoIBAQCm71rCEBre2LZGJjQfKolCARm1OXht0g/aqOaF\nuZ0S+KXJFdj1hZKoHPmV6W0v2QQjF9GNGb1DyTnAHo0jmgQ1jm5gZDpGOqxuI1bX\nmmi6s3ZeoDy50z8PX1qFA4O7UXcjSq8ARDECsjpsk347JEYav812PBg0/3dYKRPT\nONH6amFzgtHwo0J6oLmjpeUpZrE/+prz/J4ifNetanUl8dt35F9b5xSeDn8NEmPa\njqkrerUyfWEc+ufulate/+vVHS8qkrJmsPbmLv86iH6w89eFoNqHwZIJWKywmZOi\nyjwuze5Yljt9kZ68gFfAA8eeDFMDJo0mahzbkWyh5TABrGe/AgMBAAGjVTBTMB0G\nA1UdDgQWBBTTKGLbly1WmG78Ww2vahnlj5zI+zAyBgNVHREEKzApggxjYXMuc2F5\naS5jb22GGWNhcy5zYXlpLmNvbS9pZHAvbWV0YWRhdGEwDQYJKoZIhvcNAQELBQAD\nggEBACu6otVhQbprz1771eC+8kgpu1rc68xfsccBW+fLOS+OG0mKSfahyM9bYLBR\nUx4WOirIXU2unrzK18Ti0C5Hq3rPiRqV759hwubRJAwA5ayFz5WCMMNpRxGU6I+B\nUaJuWSJNVqynpow7O8WD/6zX2u2EPpZvlDuo3W3mzV/7AHRODujDt9YT39fzrY7o\nbqqViROwrPGnviywmBnH2pCBFOt9T3/DQ94rtMhFyjK2o5z59xjbNg/Kw0DG2yYV\n27ui0bD10zW/prFNiOC+NsU6oG2LVVfW4mbMdSjLFFDGVIm16w8/1o7EGC+G6gpu\nYKgB6gQGrBI3mD7RcToWgZHXK08=</ds:X509Certificate>\n                </ds:X509Data>\n            </ds:KeyInfo>\n        </KeyDescriptor>\n        <KeyDescriptor use=\"encryption\">\n            <ds:KeyInfo>\n                <ds:X509Data>\n                    <ds:X509Certificate>MIIDETCCAfmgAwIBAgIUXm8ZB5gu7RDPePJa6bPBDMNm5/kwDQYJKoZIhvcNAQEL\nBQAwFzEVMBMGA1UEAwwMY2FzLnNheWkuY29tMB4XDTIyMDUxNjEwMDQyNVoXDTQy\nMDUxNjEwMDQyNVowFzEVMBMGA1UEAwwMY2FzLnNheWkuY29tMIIBIjANBgkqhkiG\n9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7TDZE76trUaCfR1EaHIDWqCs/BcFNIUbF03J\nJ67cOB7vV9IUobp09MD2Ya23P1MJn2fY5ypeK6vCSf5FpzLK2LRL/60qmGC0XtD7\nwl0FHe7aOpBXhplCReKsQbpe7UgnqdwseQDehtuxABy93jmnYkgkRWX3k1Fs1T90\n3nXiui6dqHz5Ki9tdSRyH93Htu7Zi1s1xb+7qU8qz3m+OqA9zoVncTo8CIbtbHhx\nBlErjKHF0f3LQsxZAdNcU3Q6wbaitDdeDYe7fE6FdY2NU4DaUFcol9tMV3HlU3OW\nNLvhcGVcQoqdtFh6ZEV/WWHIDiVfvUOFed2R1jKB3kUZTOj4TwIDAQABo1UwUzAd\nBgNVHQ4EFgQULSLVTFygeCA9YfxL0xkUBYqVXJYwMgYDVR0RBCswKYIMY2FzLnNh\neWkuY29thhljYXMuc2F5aS5jb20vaWRwL21ldGFkYXRhMA0GCSqGSIb3DQEBCwUA\nA4IBAQBWGs9lE/Um7xUBxTGWsumoX+ZumuacafPWUBDctdRnaUF99h4Ug6XeRut0\n1HT1vvx7hte5ihUnV9aG9O0o1z0H2AnvQITsHpAsHaofenmwl71dp86UpUKLQE5S\nx+pfWr2LajJq8EGBsrzIY8+cb95FfOEgO37l6Uxmhei9B+5a2+x3Gdfb3DVTE/A2\nTKBhgXRX3uiCFDQpx93wEuj9b1j4Q6oUpyXCWDTk32Ic1e4k4T8OHz/MEfunV0YE\nt0LxBN9uIqv7XiQvL3/+guPM1BLt+xTZeniuiJ4DpX0EwKeJBBI4lGD85GYeAM0w\nx3VZAXQt/p12ql55Il5XBmvlhtLk</ds:X509Certificate>\n                </ds:X509Data>\n            </ds:KeyInfo>\n        </KeyDescriptor>\n\n        <!--\n        <ArtifactResolutionService Binding=\"urn:oasis:names:tc:SAML:1.0:bindings:SOAP-binding\" \n                                   Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML1/SOAP/ArtifactResolution\" index=\"1\"/>\n        -->\n\n        <SingleLogoutService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\"\n                             Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/POST/SLO\"/>\n\n        <SingleLogoutService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect\"\n                             Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/Redirect/SLO\" />\n\n        <NameIDFormat>urn:mace:shibboleth:1.0:nameIdentifier</NameIDFormat>\n        <NameIDFormat>urn:oasis:names:tc:SAML:2.0:nameid-format:transient</NameIDFormat>\n\n        <SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\"\n                             Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/POST/SSO\"/>\n\n        <SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST-SimpleSign\"\n                             Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/POST-SimpleSign/SSO\"/>\n\n        <SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect\"\n                             Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/Redirect/SSO\"/>\n\n        <SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:SOAP\"\n                             Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/SOAP/ECP\"/>\n\n    </IDPSSODescriptor>\n\n    <!--\n    <AttributeAuthorityDescriptor protocolSupportEnumeration=\"urn:oasis:names:tc:SAML:1.1:protocol urn:oasis:names:tc:SAML:2.0:protocol\">\n        <Extensions>\n            <shibmd:Scope regexp=\"false\">example.org</shibmd:Scope>\n        </Extensions>\n        <KeyDescriptor use=\"signing\">\n            <ds:KeyInfo>\n                <ds:X509Data>\n                    <ds:X509Certificate>${context.SigningKey}</ds:X509Certificate>\n                </ds:X509Data>\n            </ds:KeyInfo>\n        </KeyDescriptor>\n        <AttributeService Binding=\"urn:oasis:names:tc:SAML:1.0:bindings:SOAP-binding\" Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML1/SOAP/AttributeQuery\"/>\n        <AttributeService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:SOAP\" Location=\"${AUTHSAUR_SERVER}/idp/profile/SAML2/SOAP/AttributeQuery\"/>\n    </AttributeAuthorityDescriptor>\n    -->\n    \n    <!--\n    <Organization>\n        <OrganizationName xml:lang=\"en\">Institution Name</OrganizationName>\n        <OrganizationDisplayName xml:lang=\"en\">Institution DisplayName</OrganizationDisplayName>\n        <OrganizationURL xml:lang=\"en\">URL</OrganizationURL>\n    </Organization>\n    <ContactPerson contactType=\"administrative\">\n        <GivenName>John Smith</GivenName>\n        <EmailAddress>jsmith@example.org</EmailAddress>\n    </ContactPerson>\n    <ContactPerson contactType=\"technical\">\n        <GivenName>John Smith</GivenName>\n        <EmailAddress>jsmith@example.org</EmailAddress>\n    </ContactPerson>\n    <ContactPerson contactType=\"support\">\n        <GivenName>IT Services Support</GivenName>\n        <EmailAddress>support@example.org</EmailAddress>\n    </ContactPerson>\n    -->\n</EntityDescriptor>', '-----BEGIN CERTIFICATE-----\nMIIDEDCCAfigAwIBAgITFFUO8IZDHh8dwcjEbY4lYTFfBjANBgkqhkiG9w0BAQsF\nADAXMRUwEwYDVQQDDAxjYXMuc2F5aS5jb20wHhcNMjIwNTE2MTAwNDI0WhcNNDIw\nNTE2MTAwNDI0WjAXMRUwEwYDVQQDDAxjYXMuc2F5aS5jb20wggEiMA0GCSqGSIb3\nDQEBAQUAA4IBDwAwggEKAoIBAQCm71rCEBre2LZGJjQfKolCARm1OXht0g/aqOaF\nuZ0S+KXJFdj1hZKoHPmV6W0v2QQjF9GNGb1DyTnAHo0jmgQ1jm5gZDpGOqxuI1bX\nmmi6s3ZeoDy50z8PX1qFA4O7UXcjSq8ARDECsjpsk347JEYav812PBg0/3dYKRPT\nONH6amFzgtHwo0J6oLmjpeUpZrE/+prz/J4ifNetanUl8dt35F9b5xSeDn8NEmPa\njqkrerUyfWEc+ufulate/+vVHS8qkrJmsPbmLv86iH6w89eFoNqHwZIJWKywmZOi\nyjwuze5Yljt9kZ68gFfAA8eeDFMDJo0mahzbkWyh5TABrGe/AgMBAAGjVTBTMB0G\nA1UdDgQWBBTTKGLbly1WmG78Ww2vahnlj5zI+zAyBgNVHREEKzApggxjYXMuc2F5\naS5jb22GGWNhcy5zYXlpLmNvbS9pZHAvbWV0YWRhdGEwDQYJKoZIhvcNAQELBQAD\nggEBACu6otVhQbprz1771eC+8kgpu1rc68xfsccBW+fLOS+OG0mKSfahyM9bYLBR\nUx4WOirIXU2unrzK18Ti0C5Hq3rPiRqV759hwubRJAwA5ayFz5WCMMNpRxGU6I+B\nUaJuWSJNVqynpow7O8WD/6zX2u2EPpZvlDuo3W3mzV/7AHRODujDt9YT39fzrY7o\nbqqViROwrPGnviywmBnH2pCBFOt9T3/DQ94rtMhFyjK2o5z59xjbNg/Kw0DG2yYV\n27ui0bD10zW/prFNiOC+NsU6oG2LVVfW4mbMdSjLFFDGVIm16w8/1o7EGC+G6gpu\nYKgB6gQGrBI3mD7RcToWgZHXK08=\n-----END CERTIFICATE-----\n', '-----BEGIN RSA PRIVATE KEY-----\nMIIEpQIBAAKCAQEApu9awhAa3ti2RiY0HyqJQgEZtTl4bdIP2qjmhbmdEvilyRXY\n9YWSqBz5leltL9kEIxfRjRm9Q8k5wB6NI5oENY5uYGQ6RjqsbiNW15pourN2XqA8\nudM/D19ahQODu1F3I0qvAEQxArI6bJN+OyRGGr/NdjwYNP93WCkT0zjR+mphc4LR\n8KNCeqC5o6XlKWaxP/qa8/yeInzXrWp1JfHbd+RfW+cUng5/DRJj2o6pK3q1Mn1h\nHPrn7pWrXv/r1R0vKpKyZrD25i7/Ooh+sPPXhaDah8GSCVissJmToso8Ls3uWJY7\nfZGevIBXwAPHngxTAyaNJmoc25FsoeUwAaxnvwIDAQABAoIBAQCDAxKtf0o3Xske\noNkDJLT4UjjE28fCGLxMlYXlqVi3DOG/wR+3AQ+qVKMknkAM7zqp+AWDwZGiY4ip\nWNDYAgYPqirCB6cceuvcvGtpZkuPS0040nUWOc4h2GoIPkvidPsVfYV+pgX44bus\nfszwyXUjhShRBLTS0zPswsBGYy+YYSR0DEKLhhqxDnnAqqsDjPIXkVRwCYtJTPJR\nFqenQ0keKaoS+CqO58tgo5KlNJnvmnCtnff2iy79qCLsVWficP5ldxBgjtNLChuP\nKLTkVX1O5DzwzW91KB9D127nCiSZtZqDMwRqA+LYSSn5U/JAN1dWRWT42giXnMfN\n53gE67rhAoGBANKRQAQ2ELs6d6o1iTGDRJBwqaGm6e4kza0oTyIjbjMSnb++1KxF\nMZ6ij3I+EW4B9WPwUWxM03yCYI6XJUrpqehziZDOIscSo1P9L7CJ/CueMzF9trzc\nN0uBQr9nk/l9B5c4SpkbsxFCJHgJNsqT9YohtYWcs/vzMK6AGp5Ia/rHAoGBAMr0\nDlmzPhzw0TKiLpn+v57C+cCfjl2X42jD6jHw/VwTwSmKPypYWnYUczggCCFtxFkS\njlvR3EZ/S2rmuzN9mRRLCrwU7lQC+1XnP8JuOtilymW2NB9p/ov1qMfgGmZP+IKL\nMHNSfPbgGpS7+jvXcUiHeBS8g6ReYbidIZeGcfNJAoGBAJCRHtWFVRlme/AFT4sJ\n59IPN7d/hI53ACsJSMNUdf1ko5+Y4iTgYL/cNgYmbQsNFzAlN5HWcUDDto1PYlA7\neubYJDOiAyiQOEiaxNo88j/0Hou1Fvg1bVVOisgk0ehxmfuNr1HNPbT0p1suYErX\nKLZMjHcOblfl0J+N3jib2l7TAoGAE6YnUYXqCJFEH7vV+TDRyoQj/AM2nFcdPEJj\nhSxIy0ZaWDQ7Q1VEhNQcB54KS3o+HUWPpNIfmm+ulI38J9MMJAvT4TvBiz6yqLF3\n2dIkPl9mxgwq5bO0YkaJbbiDtc4eSD1Dlpaw5JHz4NyGMI7+N8Bt3swVjq9YlLAZ\n1Xq9w4kCgYEAg1pAS3i/Bj7XCkAumWzupjIHZGvk9Q4TVKoRmIxUzk2/t1k48fX4\nhuKEIHH+TF6sSz/elSQDKSNXNmR6PP73OFP3/rYb0rYg2KS7LWg4o4HxA1bhUauo\nAN2BWhwbwELnrQkowpatA0HpmbD+5075HC7kPhy6Geg2JxwfbmQglLc=\n-----END RSA PRIVATE KEY-----\n');

INSERT INTO `service_sequence` (`next_val`)
VALUES
	(2);
INSERT INTO `native` (`next_val`)
VALUES
	(2);



INSERT INTO `Registered_Services` (`id`, `body`, `evaluation_Order`, `evaluation_Priority`, `name`, `service_Id`)
VALUES
	(1, '{\"@class\":\"org.apereo.cas.services.RegexRegisteredService\",\"serviceId\":\"^${AUTHSAUR_ADMIN}:8000/user.*\",\"name\":\"Authsaur控制台\",\"id\":1,\"attributeReleasePolicy\":{\"@class\":\"org.apereo.cas.services.ReturnAllAttributeReleasePolicy\"},\"logo\":\"data:image/png;base64,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\",\"properties\":{\"@class\":\"java.util.HashMap\",\"saml\":{\"@class\":\"org.apereo.cas.services.DefaultRegisteredServiceProperty\",\"values\":[\"java.util.LinkedHashSet\",[null]]},\"alias\":{\"@class\":\"org.apereo.cas.services.DefaultRegisteredServiceProperty\",\"values\":[\"java.util.LinkedHashSet\",[\"Authsaur控制台\"]]},\"tag\":{\"@class\":\"org.apereo.cas.services.DefaultRegisteredServiceProperty\",\"values\":[\"java.util.LinkedHashSet\",[null]]},\"type\":{\"@class\":\"org.apereo.cas.services.DefaultRegisteredServiceProperty\",\"values\":[\"java.util.LinkedHashSet\",[\"authsaur-admin\"]]},\"homePage\":{\"@class\":\"org.apereo.cas.services.DefaultRegisteredServiceProperty\",\"values\":[\"java.util.LinkedHashSet\",[\"${AUTHSAUR_SERVER}/login?service=${AUTHSAUR_ADMIN}:8000/user/cas\"]]}}}', 0, 0, 'Authsaur控制台', '^${AUTHSAUR_ADMIN}:8000/user.*');


INSERT INTO `access_strategy` (`id`, `access_Strategy`, `access_Strategy_Type`, `app_Id`)
VALUES
	(1, '{\"@class\":\"org.apereo.cas.services.DefaultRegisteredServiceAccessStrategy\",\"requireAllAttributes\":false,\"requiredAttributes\":{\"@class\":\"java.util.HashMap\",\"uprincipal\":[\"java.util.HashSet\",[\"authsaur-admin\"]]}}', 'org.apereo.cas.services.DefaultRegisteredServiceAccessStrategy', 1);

INSERT INTO `service_config` (`id`, `app_Id`, `app_Type`, `config`, `config_Type`)
VALUES
	(4, 1, 'authsaur-admin', '{\"url\":\"${AUTHSAUR_ADMIN}:8000\"}', 'com.deepoove.authsaur.model.service.AuthsaurAdminConfig');

INSERT INTO `CAS_SETTINGS` (`id`, `name`, `value`)
VALUES
	(4, 'authsaur.theme', '{\"logo\":\"data:image/png;base64,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\\u003d\",\"favicon\":\"data:image/png;base64,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\\u003d\",\"color\":\"#3f51b5\"}');

INSERT INTO `CAS_SETTINGS` (`id`, `name`, `value`)
VALUES
	(5, 'authsaur.i18n', '{\"zh_CNsystemName\":\"Authsaur\",\"zh_CNcompanyName\":\"公司名称\",\"zh_CNcopyright\":\"\",\"ensystemName\":\"Authsaur\",\"encompanyName\":\"CompanyName\",\"encopyright\":\"\"}'),
	(6, 'authsaur.login', '{\"banner\":\"${AUTHSAUR_SERVER}/images/Work.svg\",\"layout\":\"3\",\"protocol\":\"\",\"help\":\"\"}'),
	(7, 'authsaur.lang', '{\"enabled\":\"true\"}'),
	(8, 'authsaur.safe', '{\"principalPolicy\":\"global\",\"passwordPolicyPattern\":\"^(?\\u003d.*[a-z])(?\\u003d.*[A-Z])(?\\u003d.*\\\\d)(?\\u003d.*[$@$!%*?\\u0026])[A-Za-z\\\\d$@$!%*?\\u0026]{8,10}\",\"maxTimeToLiveInSeconds\":\"60000\",\"timeToKillInSeconds\":\"20000\",\"auditMaxAgeDay\":\"100\"}'),
	(9, 'authsaur.console', '{\"slo\":\"false\"}');





