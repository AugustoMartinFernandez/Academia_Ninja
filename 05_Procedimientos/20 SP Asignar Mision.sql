USE AcademiaNinja;
GO

-- 1. Borramos si existe
IF OBJECT_ID('SP_AsignarMision', 'P') IS NOT NULL
    DROP PROCEDURE SP_AsignarMision;
GO

-- 2. Creamos el procedimiento (Tema: Procedimientos Almacenados y Transacciones - TP 7)
CREATE PROCEDURE SP_AsignarMision
    @IdMision INT,
    @IdEquipo INT
AS
BEGIN
    BEGIN TRY
        -- A. Validaciones previas (Reglas de negocio)
        
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

        -- 3. Validar que el equipo no tenga ya esta misma mision asignada y pendiente
        IF EXISTS (SELECT 1 FROM Asignaciones WHERE IdMision = @IdMision AND IdEquipo = @IdEquipo AND Estado = 'Pendiente')
        BEGIN
            RAISERROR('Error: El equipo ya tiene esta mision en curso (Pendiente).', 16, 1);
            RETURN;
        END

        -- B. Inicio de la Transaccion segura
        BEGIN TRANSACTION;
            
            -- Insertamos la asignacion en la tabla
            INSERT INTO Asignaciones (IdMision, IdEquipo, FechaInicio, Estado)
            VALUES (@IdMision, @IdEquipo, GETDATE(), 'En Curso');

        -- C. Confirmamos la transaccion si todo salio perfecto
        COMMIT TRANSACTION;
        PRINT 'Exito: Mision asignada al equipo correctamente.';
    END TRY
    BEGIN CATCH
        -- D. Manejo de Errores
        -- Si hay una transaccion abierta a la mitad, deshacemos todos los cambios
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;
            
        PRINT 'Error en el sistema: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- ==========================================
-- PRUEBAS DE FUNCIONAMIENTO Y VALIDACION
-- ==========================================

-- Prueba 1: Asignacion exitosa
-- Asignamos la mision 1 (Encontrar al gato Tora) al Equipo 1 (Equipo 7)
EXEC SP_AsignarMision @IdMision = 1, @IdEquipo = 1;
-- Resultado esperado: Exito: Mision asignada al equipo correctamente.

-- Prueba 2: Regla de negocio (Evitar duplicados pendientes)
-- Intentamos asignar exactamente la misma mision al mismo equipo inmediatamente despues
EXEC SP_AsignarMision @IdMision = 1, @IdEquipo = 1;
-- Resultado esperado: Error en el sistema: Error: El equipo ya tiene esta mision en curso (Pendiente).

-- Prueba 3: Error de integridad (Equipo inexistente)
-- Intentamos asignar una mision a un equipo ID 999 que no existe
EXEC SP_AsignarMision @IdMision = 1, @IdEquipo = 999;
-- Resultado esperado: Error en el sistema: Error: El equipo especificado no existe.

-- Comprobacion final en la tabla
SELECT * FROM Asignaciones ORDER BY IdAsignacion DESC;