USE AcademiaNinja;
GO

INSERT INTO Ninjas (Nombre, Apellido, FechaNacimiento, IdRango, IdAldea) 
VALUES 

('Naruto', 'Uzumaki', '2005-10-10', 2, 1),
('Sasuke', 'Uchiha', '2005-07-23', 2, 1),
('Kakashi', 'Hatake', '1991-09-15', 4, 1),
('Shikamaru', 'Nara', '2005-09-22', 3, 1),
('Gaara', 'del Desierto', '2006-01-19', 5, 2),
('Sakura', 'Haruno', '2006-03-28', 2, 1),
('Hinata', 'Hyuga', '2005-12-27', 2, 1),
('Rock', 'Lee', '2004-11-27', 2, 1),
('Might', 'Guy', '1987-01-01', 4, 1),
('Tsunade', 'Senju', '1961-08-02', 5, 1),
('Temari', 'del Desierto', '2003-08-23', 3, 2),
('Kankuro', 'del Desierto', '2004-05-15', 3, 2),
('Zabuza', 'Momochi', '1982-08-15', 4, 3),
('Mei', 'Terumi', '1981-05-21', 5, 3),
('Darui', 'de las Nubes', '1988-01-06', 4, 4),
('Neji', 'Hyuga', '2003-07-03', 3, 1),
('Tenten', '(Sin Apellido)', '2004-03-09', 3, 1),
('Haku', 'Yuki', '2003-01-09', 2, 3),
('Kisame', 'Hoshigaki', '1984-03-18', 4, 3),
('Killer', 'Bee', '1980-05-15', 4, 4),
('Omoi', 'de las Nubes', '2003-12-25', 3, 4),
('Karui', 'de las Nubes', '2003-02-14', 3, 4),
('Shizune', 'Kato', '1988-11-18', 4, 1),
('Ino', 'Yamanaka', '2005-09-23', 2, 1),
('Ao', '(Sin Apellido)', '1979-08-01', 4, 3),
('Chojuro', '(Sin Apellido)', '2005-11-01', 3, 3);
GO

-- Verificamos 
SELECT * FROM Ninjas;
GO