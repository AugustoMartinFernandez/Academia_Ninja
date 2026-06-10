USE AcademiaNinja;
GO

-- https://naruto.fandom.com/es/wiki/Misiones
INSERT INTO Dificultades
VALUES
('D',5000),
('C',30000),
('B',80000),
('A',150000),
('S',1000000);

-- Verificamos
SELECT * FROM Dificultades;