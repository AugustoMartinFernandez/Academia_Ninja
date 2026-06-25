USE AcademiaNinja;
GO

-- https://naruto.fandom.com/es/wiki/Misiones
-- Corregido solo el codigo, sin recompensa
INSERT INTO Dificultades (Codigo) VALUES
('D'),
('C'),
('B'),
('A'),
('S');

-- Verificamos
SELECT * FROM Dificultades;