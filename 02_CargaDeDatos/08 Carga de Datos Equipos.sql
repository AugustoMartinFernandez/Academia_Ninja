USE AcademiaNinja;
GO

INSERT INTO Equipos (NombreEquipo, IdSensei) 
VALUES 
('Equipo 7', 102),                    -- Sensei: Kakashi Hatake
('Equipo Guy', 108),                  -- Sensei: Might Guy
('Espadachines de la Niebla', 112),   -- Sensei: Zabuza Momochi
('Escuadrón Nube', 114),              -- Sensei: Darui
('Hermanos de la Arena', 104),        -- Lider: Gaara del Desierto
('Escuadrón de Rescate', 103),        -- Lider: Shikamaru Nara
('Escuadrón Médico', 109),            -- Sensei: Tsunade Senju
('Guardia del Mizukage', 113);        -- Sensei: Mei Terumi
GO

-- Verificamos 
SELECT * FROM Equipos;
GO