USE AcademiaNinja;
GO

-- 1. Borramos si existe 
IF OBJECT_ID('TRG_ValidarIngresoEquipo', 'TR') IS NOT NULL
    DROP TRIGGER TRG_ValidarIngresoEquipo;
GO

-- 2. Creamos el trigger
CREATE TRIGGER TRG_ValidarIngresoEquipo
ON EquipoDetalle
AFTER INSERT
AS
BEGIN
    -- El ninja insertado esta inactivo?
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        INNER JOIN Ninjas n ON i.IdNinja = n.IdNinja
        WHERE n.Estado = 0
    )
    BEGIN
        -- Si la condicion se cumple (hay un ninja inactivo), lanzamos error y frenamos la operacion
        RAISERROR('Regla: No se puede asignar a un equipo un ninja que este dado de baja.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-- PRUEBAS DE FUNCIONAMIENTO Y VALIDACION
-- Para probar el error, primero necesitamos asegurar que haya un ninja inactivo.
-- Damos de baja logicamente a Zabuza IdNinja = 112
UPDATE Ninjas SET Estado = 0 WHERE IdNinja = 112;
-- Prueba de error (Ninja inactivo)
-- Intentamos asignar a Zabuza (112) al Equipo 1
INSERT INTO EquipoDetalle (IdEquipo, IdNinja) VALUES (1, 112);
-- Msg 50000, Level 16, State 1, Procedure TRG_ValidarIngresoEquipo, Line 15 [Batch Start Line 35]
-- Regla: No se puede asignar a un equipo un ninja que este dado de baja.

-- Prueba de éxito (Ninja activo)
-- Primero curamos/reactivamos al ninja usando el SP que creamos antes
EXEC SP_CurarNinja @IdNinja = 112;
-- Resultado: Ninja curado y reactivado exitosamente.

-- Intentamos asignarlo nuevamente al Equipo 1
INSERT INTO EquipoDetalle (IdEquipo, IdNinja) VALUES (1, 112);
-- Resultado:
-- 1 fila(s) afectada(s). (El trigger permitió la inserción porque Estado = 1)