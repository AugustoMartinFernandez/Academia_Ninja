USE AcademiaNinja;
GO

INSERT INTO NinjaHabilidades (IdNinja, IdJutsu, NivelMaestria)
VALUES
-- Naruto (100) Domina Rasenshuriken (2) y Clon de Sombra (6)
(100, 2, 8),
(100, 6, 9),
-- Sasuke (101) Domina Gran Bola de Fuego (1) y Chidori (3)
(101, 1, 8),
(101, 3, 9),
-- Kakashi (102) Domina Dragón de Agua (5) y Raikiri (7)
(102, 5, 9),
(102, 7, 10),
-- Shikamaru (103) Domina Posesión de Sombra (8)
(103, 8, 9),
-- Gaara (104) Domina Ataúd de Arena (9)
(104, 9, 10),
-- Sakura (105) Domina Impacto de Flor de Cerezo (10)
(105, 10, 8),
-- Hinata (106) Domina 64 Palmas (11)
(106, 11, 7),
-- Rock Lee (107) Domina Loto Primario (12)
(107, 12, 8),
-- Tsunade (109) Domina Restauración Divina (14)
(109, 14, 10),
-- Temari (110) Domina Guadaña de Viento (15)
(110, 15, 8),
-- Zabuza (112) Domina Dragón de Agua (5) y Ocultación en Niebla (17)
(112, 5, 8),
(112, 17, 9),
-- Mei Terumi (113) Domina Dragón de Agua (5) y Niebla Corrosiva (18)
(113, 5, 9),
(113, 18, 10),
-- Darui (114) Domina Pantera Negra (19)
(114, 19, 9);
GO

-- Verificamos 
SELECT * FROM NinjaHabilidades;
GO