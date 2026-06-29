USE AcademiaNinja;
GO
-- ========================================================================
-- 2. VISTA: Libro Bingo de Habilidades (vw_LibroBingoHabilidades)
-- EXPLICACIÓN:
-- Esta vista actúa como el "Libro Bingo" de la base de datos. Muestra 
-- qué jutsus tiene asignados cada ninja, a qué elemento de la naturaleza 
-- pertenece esa técnica y el nivel de maestría que posee el shinobi 
-- en ese jutsu específico (escala del 1 al 10 según el CHECK de la tabla).
-- ========================================================================

DROP VIEW IF EXISTS vw_LibroBingoHabilidades;
GO

CREATE VIEW vw_LibroBingoHabilidades AS
SELECT 
    N.Nombre + ' ' + N.Apellido AS Ninja,
    J.Nombre AS Jutsu,
    E.Nombre AS TipoElemento,
    NH.NivelMaestria
FROM NinjaHabilidades NH
INNER JOIN Ninjas N ON NH.IdNinja = N.IdNinja
INNER JOIN Jutsus J ON NH.IdJutsu = J.IdJutsu
INNER JOIN Elementos E ON J.IdElemento = E.IdElemento;
GO

SELECT * FROM vw_LibroBingoHabilidades ORDER BY NivelMaestria DESC; 