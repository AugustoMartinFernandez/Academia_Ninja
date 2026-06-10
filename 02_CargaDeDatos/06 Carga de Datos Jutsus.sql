USE AcademiaNinja;
GO

INSERT INTO Jutsus (Nombre, IdElemento, Descripcion)
VALUES
('Jutsu Gran Bola de Fuego', 1, 'Técnica característica del Clan Uchiha que expulsa una esfera masiva de fuego.'),
('Rasenshuriken', 2, 'Esfera de chakra de viento con forma de shuriken que daña a nivel celular.'),
('Chidori', 3, 'Concentración de chakra de rayo en la mano que suena como un millar de pájaros.'),
('Muro de Tierra', 4, 'Técnica defensiva que crea una pared de roca sólida escupiendo barro por la boca.'),
('Jutsu Dragón de Agua', 5, 'Crea un enorme dragón a partir de agua preexistente para impactar al enemigo.'),
('Jutsu Clon de Sombra', 6, 'Arte ninja que crea copias físicas reales del usuario dividiendo su chakra.'),
('Raikiri / Cuchilla Relámpago', 3, 'Versión avanzada del Chidori, capaz de cortar un relámpago.'),
('Jutsu Posesión de Sombra', 6, 'Arte ninja secreto que conecta la sombra del usuario con la del enemigo.'),
('Ataúd de Arena', 4, 'Manipulación de arena para inmovilizar y aplastar al oponente.'),
('Impacto de Flor de Cerezo', 6, 'Taijutsu que libera una cantidad masiva de chakra en un solo golpe.'),
('Ocho Trigramas 64 Palmas', 6, 'Taijutsu del Clan Hyuga que bloquea los puntos de chakra del enemigo.'),
('Loto Primario', 6, 'Taijutsu de alta velocidad que requiere abrir la primera puerta interna.'),
('Pavo Real Matutino', 1, 'Ráfaga de golpes a tan alta velocidad que se encienden en llamas.'),
('Restauración Divina', 6, 'Ninjutsu médico supremo que acelera la regeneración celular.'),
('Jutsu Guadaña de Viento', 2, 'Potentes ráfagas de viento cortante generadas con un abanico.'),
('Jutsu de Marioneta', 6, 'Uso de hilos de chakra imperceptibles para controlar títeres en combate.'),
('Ocultación en la Niebla', 5, 'Ninjutsu que crea una espesa niebla para facilitar asesinatos silenciosos.'),
('Jutsu de Niebla Corrosiva', 5, 'Ninjutsu que exhala una niebla ácida capaz de derretir casi cualquier defensa.'),
('Pantera Negra', 3, 'Ninjutsu de elemento rayo que toma la forma de una pantera de electricidad negra.');
GO

-- Verificamos
SELECT * FROM Jutsus;
GO