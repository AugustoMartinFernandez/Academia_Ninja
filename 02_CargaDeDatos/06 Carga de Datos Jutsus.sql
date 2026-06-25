USE AcademiaNinja;
GO

INSERT INTO Jutsus (Nombre, IdElemento, Descripcion)
VALUES

('Jutsu Gran Bola de Fuego', 1, 'Técnica característica del Clan Uchiha que expulsa una esfera masiva de fuego.'),
('Rasenshuriken', 4, 'Esfera de chakra de viento con forma de shuriken que daña a nivel celular.'),
('Chidori', 3, 'Concentración de chakra de rayo en la mano que suena como un millar de pájaros.'),
('Muro de Tierra', 5, 'Técnica defensiva que crea una pared de roca sólida escupiendo barro por la boca.'),
('Jutsu Dragón de Agua', 2, 'Crea un enorme dragón a partir de agua preexistente para impactar al enemigo.'),
('Jutsu Clon de Sombra', 10, 'Arte ninja que crea copias físicas reales del usuario dividiendo su chakra.'),
('Raikiri / Cuchilla Relámpago', 3, 'Versión avanzada del Chidori, capaz de cortar un relámpago.'),
('Jutsu Posesión de Sombra', 10, 'Arte ninja secreto que conecta la sombra del usuario con la del enemigo.'),
('Ataúd de Arena', 8, 'Manipulación de arena para inmovilizar y aplastar al oponente.'),
('Impacto de Flor de Cerezo', 10, 'Taijutsu que libera una cantidad masiva de chakra en un solo golpe.'),
('Ocho Trigramas 64 Palmas', 10, 'Taijutsu del Clan Hyuga que bloquea los puntos de chakra del enemigo.'),
('Loto Primario', 10, 'Taijutsu de alta velocidad que requiere abrir la primera puerta interna.'),
('Pavo Real Matutino', 1, 'Ráfaga de golpes a tan alta velocidad que se encienden en llamas.'),
('Restauración Divina', 10, 'Ninjutsu médico supremo que acelera la regeneración celular.'),
('Jutsu Guadaña de Viento', 4, 'Potentes ráfagas de viento cortante generadas con un abanico.'),
('Jutsu de Marioneta', 10, 'Uso de hilos de chakra imperceptibles para controlar títeres en combate.'),
('Ocultación en la Niebla', 2, 'Ninjutsu que crea una espesa niebla para facilitar asesinatos silenciosos.'),
('Jutsu de Niebla Corrosiva', 2, 'Ninjutsu que exhala una niebla ácida capaz de derretir casi cualquier defensa.'),
('Pantera Negra', 3, 'Ninjutsu de elemento rayo que toma la forma de una pantera de electricidad negra.'),
--Jutsus nuevos
('Amaterasu', 1, 'Llamas negras del Mangekyo Sharingan que no se apagan hasta consumir el objetivo.'),
('Susanoo', 10, 'Avatar gigante de chakra que envuelve y protege al usuario Uchiha.'),
('Tsukuyomi', 10, 'Genjutsu supremo que atrapa a la víctima en una ilusión donde el tiempo se distorsiona.'),
('Izanami', 9, 'Técnica prohibida del Sharingan que encierra al rival en un bucle de destino inevitable.'),
('Kamui', 10, 'Técnica espacio-tiempo que transporta al usuario u objetos a otra dimensión.'),
('Espejos de Hielo Demoniacos', 7, 'Domo de espejos de hielo que permite atacar desde todos los ángulos a gran velocidad.'),
('Hyoton: Dragon de Hielo', 7, 'Crea un dragón de hielo que congela todo a su paso.'),
('Mokuton: Nacimiento de un Bosque', 6, 'Genera árboles y raíces gigantes para aplastar o inmovilizar al enemigo.'),
('Edo Tensei', 9, 'Técnica prohibida que reanima a los muertos como soldados de combate.'),
('Shinra Tensei', 10, 'Onda de repulsión que rechaza con fuerza todo lo que rodea al usuario.'),
('Bansho Tenin', 10, 'Fuerza de atracción que arrastra objetos y personas hacia el usuario.'),
('Hiraishin: Dios del Trueno Volador', 10, 'Teletransporte instantáneo del usuario hacia una marca previamente colocada.'),
('Bijuudama: Bomba de Bestia con Cola', 10, 'Esfera de chakra comprimido de un bijuu, capaz de arrasar un campo entero.'),
('Suiton: Gran Tiburon de Agua', 2, 'Tiburón gigante de agua que embiste al enemigo con fuerza devastadora.'),
('Bakuton: Arcilla Explosiva', 5, 'Esculturas de arcilla cargadas con chakra que detonan a voluntad del usuario.'),
('Raiton: Armadura de Rayo', 3, 'Cubre el cuerpo del usuario con rayo, aumentando su velocidad y fuerza de golpe.'),
('Lariat Relampago', 3, 'Embestida a máxima velocidad reforzada con chakra de rayo.'),
('Tsunami de Arena', 8, 'Ola gigante de arena que sepulta a múltiples enemigos a la vez.'),
('Invocacion: Gamabunta', 10, 'Invoca al sapo jefe del Monte Myoboku para combatir junto al usuario.'),
('Modo Sabio', 10, 'Estado que absorbe energía natural para potenciar enormemente al usuario.'),
('Doton: Pantano del Inframundo', 5, 'Convierte el suelo en un pantano profundo que hunde al enemigo.'),
('Fuuton: Gran Avance', 4, 'Ráfaga concentrada de viento cortante lanzada desde la boca.');
GO

-- Verificamos
SELECT * FROM Jutsus;
GO