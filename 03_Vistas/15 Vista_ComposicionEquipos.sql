USE AcademiaNinja;
GO

-- VISTA: Composicion de Escuadras
-- Muestra la lista exacta de quienes son los alumnos de cada equipo y quien es su Sensei a cargo.

-- Borramos la vista si ya existe, para poder recrearla sin error al re-ejecutar
DROP VIEW IF EXISTS vw_ComposicionEquipos;
GO

CREATE VIEW vw_ComposicionEquipos AS
SELECT
    E.NombreEquipo,
    S.Nombre + ' ' + S.Apellido AS NombreSensei,
    A.Nombre + ' ' + A.Apellido AS NombreAlumno,
    R.Nombre AS RangoAlumno
FROM Equipos E
-- Primer Join a Ninjas: para traer los datos del Sensei
INNER JOIN Ninjas S ON E.IdSensei = S.IdNinja
-- Joins para llegar a los Alumnos a traves de la tabla intermedia
INNER JOIN EquipoDetalle ED ON E.IdEquipo = ED.IdEquipo
-- Segundo Join a Ninjas: para traer los datos del Alumno
INNER JOIN Ninjas A ON ED.IdNinja = A.IdNinja
-- Join extra para saber que rango tiene el alumno
INNER JOIN Rangos R ON A.IdRango = R.IdRango;
GO

SELECT * FROM vw_ComposicionEquipos ORDER BY NombreEquipo;