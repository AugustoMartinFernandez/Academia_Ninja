USE AcademiaNinja;
GO

INSERT INTO Rangos (Nombre, NivelPrioridad)
VALUES
('Estudiante', 1),
('Genin', 2),
('Chunin', 3),
('Jonin', 4),
('Kage', 5);
GO

-- Verificamos que se cargaron los 5 rangos correctamente
SELECT * FROM Rangos;
GO