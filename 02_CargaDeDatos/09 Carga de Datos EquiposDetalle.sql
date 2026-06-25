USE AcademiaNinja;
GO

INSERT INTO EquipoDetalle (IdEquipo, IdNinja)
VALUES
-- Equipo 7 (IdEquipo 1) - Sensei es Kakashi
(1, 100),   -- Naruto 
(1, 101),   -- Sasuke 
(1, 105),   -- Sakura 
-- Equipo 8 (IdEquipo 2) - Sensei es Kurenai
(2, 106),   -- Hinata 
(2, 129),   -- Kiba 
(2, 128),   -- Shino 
-- Equipo 10 (IdEquipo 3) - Sensei es Asuma
(3, 103),   -- Shikamaru 
(3, 130),   -- Choji 
(3, 123),   -- Ino 
-- Equipo Guy (IdEquipo 4) - Sensei es Guy
(4, 107),   -- Rock 
(4, 115),   -- Neji 
(4, 116),   -- Tenten
-- Equipo de la Arena (IdEquipo 5) - Sensei es Baki
(5, 104),   -- Gaara
(5, 110),   -- Temari
(5, 111),   -- Kankuro
-- Guardia de la Niebla (IdEquipo 6) - Sensei es Zabuza
(6, 117),   -- Haku 
(6, 150),   -- Suigetsu 
(6, 125),   -- Chojuro
-- Unidad de la Nube (IdEquipo 7) - Sensei es Killer Bee
(7, 120),   -- Omoi
(7, 121),   -- Karui
(7, 114),   -- Darui
-- Escuadron Anbu Raiz (IdEquipo 8) - Sensei es Danzo
(8, 143),   -- Sai
(8, 144),   -- Yamato
(8, 138),   -- Shisui Uchiha
-- Cuerpo Medico de Konoha (IdEquipo 9) - Sensei es Tsunade
(9, 122),   -- Shizune Kato
(9, 105),   -- Sakura Haruno , tambien esta en el Equipo 7, N a N
-- Akatsuki (IdEquipo 10) - Sensei/Lider Nagato
(10, 137),  -- Itachi 
(10, 118),  -- Kisame 
(10, 149),  -- Sasori
(10, 157),  -- Deidara
(10, 165),  -- Kakuzu
(10, 160),  -- Konan
(10, 139),  -- Obito 
(10, 162);  -- Orochimaru
GO

-- Verificamos
SELECT * FROM EquipoDetalle;
GO