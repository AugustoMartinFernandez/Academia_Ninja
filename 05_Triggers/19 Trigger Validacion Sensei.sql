USE AcademiaNinja;
GO

-- 1. Borramos el trigger si ya existe
IF OBJECT_ID('TRG_ValidarSensei', 'TR') IS NOT NULL
    DROP TRIGGER TRG_ValidarSensei;
GO

-- 2. Creamos el trigger
-- Regla de negocio: el sensei (lider) de un equipo debe ser un ninja
-- de rango Jonin o superior. Validamos comparando el NivelPrioridad
-- del rango del sensei contra el NivelPrioridad de Jonin.
CREATE TRIGGER TRG_ValidarSensei
ON Equipos
AFTER INSERT, UPDATE
AS
BEGIN
    -- Buscamos la prioridad de Jonin desde la tabla
    DECLARE @PrioridadJonin INT;
    SELECT @PrioridadJonin = NivelPrioridad FROM Rangos WHERE Nombre = 'Jonin';

    -- Verificamos si algun sensei recien cargado tiene un rango por debajo de Jonin
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN Ninjas n ON i.IdSensei = n.IdNinja
        INNER JOIN Rangos r ON n.IdRango = r.IdRango
        WHERE r.NivelPrioridad < @PrioridadJonin
    )
    BEGIN
        -- Si hay un sensei de rango muy bajo, lanzamos error y frenamos toda la operacion
        RAISERROR('Regla: el sensei de un equipo debe ser de rango Jonin o superior.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- PRUEBAS DE FUNCIONAMIENTO Y VALIDACION
--(EXITO) asignamos un sensei valido.
-- Kakashi (IdNinja 102) es Jonin, asi que el equipo se crea sin problema.
INSERT INTO Equipos (NombreEquipo, IdSensei) VALUES ('Equipo de Prueba Valido', 102);
-- Resultado: 1 fila(s) afectada(s).

--(ERROR) intentamos poner de sensei a un Genin.
-- Naruto (IdNinja 100) es Genin (prioridad menor a Jonin), el trigger debe frenar la operacion.
INSERT INTO Equipos (NombreEquipo, IdSensei) VALUES ('Equipo de Prueba Invalido', 100);
-- Resultado: Lanza excepcion en rojo: Regla: el sensei de un equipo debe ser de rango Jonin o superior.

-- Comprobacion: el "Equipo de Prueba Invalido" NO debe existir (el rollback lo deshizo)
SELECT * FROM Equipos WHERE NombreEquipo LIKE 'Equipo de Prueba%';
GO