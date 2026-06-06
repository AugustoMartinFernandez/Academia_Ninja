USE AcademiaNinja;
GO

-- VISTA: Composicion de Escuadras
-- Muestra la lista exacta de quienes son los alumnos de cada equipo y quién es su Sensei a cargo. 

CREATE VIEW vw_ComposicionEquipos AS
SELECT

    E.NombreEquipo,
    S.Nombre + ' ' + S.Apellido AS NombreSensei,
    A.Nombre + ' ' + A.Apellido AS NombreAlumno,
    R.Nombre AS RangoAlumno

    FROM Equipos E
    -- Primer Join a Ninjas: Para traer los datos del Sensei
    INNER JOIN Ninjas S ON E.IdSensei = S.IdNinja
    -- Joins para llegar a los Alumnos a través de la tabla intermedia
    INNER JOIN EquipoDetalle ED ON E.IdEquipo = ED.IdEquipo
    -- Segundo Join a Ninjas: Para traer los datos del Alumno
    INNER JOIN Ninjas A ON ED.IdNinja = A.IdNinja
    -- Un Join extra para saber qué rango tiene el alumno
    INNER JOIN Rangos R ON A.IdRango = R.IdRango;
GO

SELECT * FROM vw_ComposicionEquipos ORDER BY NombreEquipo;