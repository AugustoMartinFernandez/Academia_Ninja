USE AcademiaNinja;
GO

INSERT INTO Asignaciones (IdMision, IdEquipo, FechaInicio, FechaFin, Estado)
VALUES
-- El Equipo 7 completó la misión del Gato Tora rápido
(1, 1, '2023-01-10', '2023-01-11', 'Completada'),
-- El Equipo 7 también completó la misión de escoltar a Tazuna
(3, 1, '2023-02-15', '2023-02-28', 'Completada'),
-- El Equipo Guy está actualmente cazando bestias salvajes
(4, 2, '2023-05-01', NULL, 'En Curso'),
-- Los Espadachines de la Niebla completaron una misión de asesinato de rango S
(10, 3, '2023-01-05', '2023-01-20', 'Completada'),
-- El Escuadrón de Rescate falló en su infiltración al Sonido
(8, 6, '2023-04-10', '2023-04-15', 'Fallida'),
-- El Escuadrón Nube recién salió a investigar a Akatsuki 
(9, 4, GETDATE(), NULL, 'En Curso');
GO

-- Verificamos
SELECT * FROM Asignaciones;
GO