USE AcademiaNinja;
GO
-- ========================================================================
-- 1. VISTA: Detalle Completo de Ninjas (vw_DetalleNinjas)

-- Esta vista unifica los datos clave de los Shinobis sin tener que hacer 
-- los JOINs manualmente cada vez. Cruza las claves foráneas para traer 
-- el nombre real del rango militar y de la aldea natal con su país.
-- Mapeo de Estado: 1 = 'Activo', 0 = 'Baja Lógica'.
-- ========================================================================
DROP VIEW IF EXISTS vw_DetalleNinjas;
GO

CREATE VIEW vw_DetalleNinjas AS
SELECT 
    N.IdNinja,
    N.Nombre,
    N.Apellido,
    N.FechaNacimiento,
    R.Nombre AS Rango,
    A.Nombre AS Aldea,
    P.Nombre AS Pais,
    CASE WHEN N.Estado = 1 THEN 'Activo' ELSE 'Baja' END AS EstadoNinja
FROM Ninjas N
INNER JOIN Rangos R ON N.IdRango = R.IdRango
INNER JOIN Aldeas A ON N.IdAldea = A.IdAldea
Inner Join Paises P On A.IdPais = P.IdPais;
GO

SELECT * FROM vw_DetalleNinjas;


