USE AcademiaNinja;
GO

INSERT INTO Rangos (Nombre, NivelPrioridad) VALUES
('Estudiante', 1),
('Genin',2),
('Chunin',3),
('Jonin',4),
('Sannin',5),
('Kage',6);
GO

-- Verificamos que se cargaron los 6 rangos correctamente
SELECT * FROM Rangos;
GO