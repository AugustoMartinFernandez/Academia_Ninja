USE AcademiaNinja;
GO

INSERT INTO EquipoDetalle (IdEquipo, IdNinja)
VALUES
(1, 100), (1, 101), (1, 105), -- Equipo 7: Naruto, Sasuke y Sakura
(2, 107), (2, 115), (2, 116), -- Equipo Guy: Rock Lee, Neji y Tenten
(3, 117), (3, 118),           -- Espadachines de la Niebla: Haku y Kisame
(4, 119), (4, 120), (4, 121), -- Escuadrón Nube: Killer Bee, Omoi y Karui
(5, 110), (5, 111),           -- Hermanos de la Arena: Temari y Kankuro
(6, 103), (6, 106),           -- Escuadrón de Rescate: Shikamaru y Hinata
(7, 122), (7, 123),           -- Escuadrón Médico: Shizune e Ino
(8, 124), (8, 125);           -- Guardia del Mizukage: Ao y Chojuro
GO

-- Verificamos 
SELECT * FROM EquipoDetalle;
GO