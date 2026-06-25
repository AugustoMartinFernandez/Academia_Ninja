USE AcademiaNinja;
GO

INSERT INTO Asignaciones (IdMision, IdEquipo, FechaInicio, FechaFin, Estado)
VALUES
-- Equipo 7 historial cerrado + UNA en curso
(1, 1, '2023-04-01', '2023-04-01', 'Completada'),   -- gato Tora
(4, 1, '2023-05-10', '2023-05-25', 'Completada'),   -- escolta Tazuna
(9, 1, '2024-03-01', '2024-03-15', 'Fallida'),      -- recuperar a Sasuke
(11, 1, '2025-01-10', NULL, 'En Curso'),            -- invasion de Pain 
-- Equipo 8 
(2, 2, '2023-06-01', '2023-06-02', 'Completada'),   -- hierbas medicinales
(16, 2, '2024-05-01', '2024-05-03', 'Completada'),  -- documentos clasificados
-- Equipo 10 
(5, 3, '2023-07-15', '2023-07-20', 'Completada'),   -- pergaminos robados
(17, 3, '2024-08-01', NULL, 'En Curso'),            -- exterminar bandidos
-- Equipo Guy 
(3, 4, '2023-08-01', '2023-08-01', 'Completada'),   -- pintar la cerca
(7, 4, '2024-02-01', '2024-02-20', 'Fallida'),      -- escolta mercader
-- Equipo de la Arena 
(8, 5, '2024-09-01', NULL, 'En Curso'),             -- rescatar al Kazekage
-- Guardia de la Niebla
(12, 6, '2023-10-01', '2023-10-15', 'Completada'),  -- eliminar a Gato
-- Unidad de la Nube
(6, 7, '2024-06-01', '2024-06-10', 'Completada'),   -- investigar desapariciones
(18, 7, '2025-02-01', NULL, 'En Curso'),            -- vigilancia nocturna
-- Escuadron Anbu Raiz
(10, 8, '2024-01-05', '2024-01-25', 'Completada'),  -- capturar a Itachi
-- Cuerpo Medico de Konoha
(13, 9, '2024-04-01', '2024-04-08', 'Completada'),  -- reconocimiento escondite
-- Akatsuki 
(14, 10, '2025-03-01', NULL, 'En Curso'),           -- mision conjunta
(15, 10, '2023-12-01', '2023-12-20', 'Completada'); -- defensa en la guerra
GO

-- Verificamos
SELECT * FROM Asignaciones;
GO