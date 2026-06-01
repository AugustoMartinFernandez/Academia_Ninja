USE AcademiaNinja;
GO
-- ========================================================================
-- 3. VISTA: Historial y Control de Misiones por Equipo (vw_HistorialMisionesEquipos)
-- EXPLICACIÓN:
-- Vista analítica ideal para ver el rendimiento de los equipos. Junta las
-- asignaciones con los datos del equipo, busca quién es el Sensei/Líder 
-- a cargo de ese grupo, detalla la misión con su rango de dificultad (A, S, etc.)
-- y la recompensa económica obtenida. Sirve para auditar misiones 'En Curso'.
-- ========================================================================
DROP VIEW IF EXISTS vw_HistorialMisionesEquipos;
GO

create VIEW vw_HistorialMisionesEquipos AS
SELECT 
    E.NombreEquipo,
    N.Nombre + ' ' + N.Apellido AS SenseiLider,
    M.Descripcion AS Mision,
    D.Codigo AS RangoMision,
    M.Recompensa,
    A.Estado AS EstadoMision,
    A.FechaInicio,
    A.FechaFin
FROM Asignaciones A
INNER JOIN Equipos E ON A.IdEquipo = E.IdEquipo
INNER JOIN Ninjas N ON E.IdSensei = N.IdNinja
INNER JOIN Misiones M ON A.IdMision = M.IdMision
INNER JOIN Dificultades D ON M.IdDificultad = D.IdDificultad;
GO

SELECT * FROM vw_HistorialMisionesEquipos WHERE EstadoMision = 'Completada';