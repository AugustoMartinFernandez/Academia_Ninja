USE AcademiaNinja;
GO

-- 1. Borramos si existe
IF OBJECT_ID('SP_AsignarMision', 'P') IS NOT NULL
    DROP PROCEDURE SP_AsignarMision;
GO

-- 2. Creamos el procedimiento
CREATE PROCEDURE SP_AsignarMision
    @IdMision INT,
    @IdEquipo INT
AS
BEGIN
    BEGIN TRY
        -- 1. Validar que la mision exista
        IF NOT EXISTS (SELECT 1 FROM Misiones WHERE IdMision = @IdMision)
        BEGIN
            RAISERROR('Error: La mision especificada no existe.', 16, 1);
            RETURN;
        END
        -- 2. Validar que el equipo exista
        IF NOT EXISTS (SELECT 1 FROM Equipos WHERE IdEquipo = @IdEquipo)
        BEGIN
            RAISERROR('Error: El equipo especificado no existe.', 16, 1);
            RETURN;
        END
        -- 3. Regla de negocio: un equipo no puede tomar una mision nueva
        --    si todavia tiene CUALQUIER mision en curso. Debe terminar la actual primero.
        IF EXISTS (SELECT 1 FROM Asignaciones WHERE IdEquipo = @IdEquipo AND Estado = 'En Curso')
        BEGIN
            RAISERROR('Error: El equipo ya tiene una mision en curso. Debe finalizarla antes de tomar otra.', 16, 1);
            RETURN;
        END
        -- Inicio de la Transaccion segura
        BEGIN TRANSACTION;
            -- Insertamos la asignacion en la tabla
            INSERT INTO Asignaciones (IdMision, IdEquipo, FechaInicio, Estado)
            VALUES (@IdMision, @IdEquipo, GETDATE(), 'En Curso');
        -- Confirmamos la transaccion si todo salio perfecto
        COMMIT TRANSACTION;
        PRINT 'Exito: Mision asignada al equipo correctamente.';
    END TRY
    BEGIN CATCH
        -- Manejo de Errores
        -- Si hay una transaccion abierta a la mitad, deshacemos todos los cambios
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

-- PRUEBAS DE FUNCIONAMIENTO Y VALIDACION

-- (EXITO) el Equipo 8 (IdEquipo 2) no tiene ninguna mision en curso en la carga.
EXEC SP_AsignarMision @IdMision = 2, @IdEquipo = 2;
-- Resultado: Exito: Mision asignada al equipo correctamente.

--(BLOQUEO por equipo ocupado) el Equipo 7 (IdEquipo 1) ya tiene la mision de Pain en curso.
-- Le mandamos una mision DISTINTA para demostrar que bloquea cualquier mision nueva, no solo la repetida.
EXEC SP_AsignarMision @IdMision = 5, @IdEquipo = 1;
-- Resultado: Lanza excepcion: Error: El equipo ya tiene una mision en curso...

--(Equipo inexistente)
EXEC SP_AsignarMision @IdMision = 1, @IdEquipo = 999;
-- Resultado: Lanza excepcion: Error: El equipo especificado no existe.

--(Mision inexistente)
EXEC SP_AsignarMision @IdMision = 999, @IdEquipo = 4;
-- Resultado: Lanza excepcion: Error: La mision especificada no existe.

-- Comprobacion final en la tabla
SELECT * FROM Asignaciones ORDER BY IdAsignacion DESC;