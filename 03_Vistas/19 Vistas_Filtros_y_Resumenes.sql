USE AcademiaNinja;
GO

-- 1. Borramos las vistas si ya existen
IF OBJECT_ID('vw_NinjasSinEquipo', 'V') IS NOT NULL
    DROP VIEW vw_NinjasSinEquipo;
GO

IF OBJECT_ID('vw_ResumenAldeas', 'V') IS NOT NULL
    DROP VIEW vw_ResumenAldeas;
GO


-- 2. Creamos la primera vista: Ninjas sin equipo 
-- Proposito: Identificar rapidamente que ninjas estan disponibles y todavia no fueron asignados a ninguna escuadra.
CREATE VIEW vw_NinjasSinEquipo AS
SELECT 
    n.IdNinja,
    n.Nombre + ' ' + n.Apellido AS NinjaDisponible,
    n.Estado
FROM Ninjas n
LEFT JOIN EquipoDetalle ed ON n.IdNinja = ed.IdNinja
WHERE ed.IdEquipo IS NULL;
GO


-- 3. Creamos la segunda vista: Resumen por Aldea 
-- Proposito: Obtener una estadistica rapida de cuantos ninjas tiene registrados cada aldea, listando incluso aquellas que no tengan ninjas asignados gracias al LEFT JOIN.
CREATE VIEW vw_ResumenAldeas AS
SELECT 
    a.Nombre AS NombreAldea,
    a.Pais AS PaisAldea,
    COUNT(n.IdNinja) AS CantidadNinjas
FROM Aldeas a
LEFT JOIN Ninjas n ON a.IdAldea = n.IdAldea
GROUP BY a.Nombre, a.Pais;
GO

-- PRUEBAS DE FUNCIONAMIENTO Y VALIDACION

-- Prueba 1: Verificar el funcionamiento de la vista de ninjas sin equipo
-- Insertamos un ninja de prueba que inicialmente no pertenecera a ningun equipo
INSERT INTO Ninjas (Nombre, Apellido, FechaNacimiento, IdRango, IdAldea, Estado)
VALUES ('Konohamaru', 'Sarutobi', '2012-12-30', 1, 1, 1);

-- Consultamos la vista: Konohamaru deberia aparecer aca porque no tiene registros en EquipoDetalle
SELECT * FROM vw_NinjasSinEquipo;
-- Resultado esperado: Deberia listar a Konohamaru Sarutobi junto con cualquier otro ninja huerfano de equipo.

-- Prueba 2: Verificar el funcionamiento de la vista de resumen por aldeas
-- Consultamos la vista para ver las metricas agrupadas
SELECT * FROM vw_ResumenAldeas ORDER BY CantidadNinjas DESC;
-- Resultado esperado: Un listado ordenado de mayor a menor con el nombre de la aldea, su pais y el conteo exacto de ninjas cargados.