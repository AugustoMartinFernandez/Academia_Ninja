USE AcademiaNinja;
GO

INSERT INTO Ninjas (Nombre, Apellido, FechaNacimiento, IdRango, IdAldea) 
VALUES 

('Naruto', 'Uzumaki', '2005-10-10', 2, 1),
('Sasuke', 'Uchiha', '2005-07-23', 2, 1),
('Kakashi', 'Hatake', '1991-09-15', 4, 1),
('Shikamaru', 'Nara', '2005-09-22', 3, 1),
('Gaara', 'del Desierto', '2006-01-19', 6, 2),   
('Sakura', 'Haruno', '2006-03-28', 2, 1),
('Hinata', 'Hyuga', '2005-12-27', 2, 1),
('Rock', 'Lee', '2004-11-27', 2, 1),
('Might', 'Guy', '1987-01-01', 4, 1),
('Tsunade', 'Senju', '1961-08-02', 5, 1),        
('Temari', 'del Desierto', '2003-08-23', 3, 2),
('Kankuro', 'del Desierto', '2004-05-15', 3, 2),
('Zabuza', 'Momochi', '1982-08-15', 4, 3),
('Mei', 'Terumi', '1981-05-21', 6, 3),           
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
('Chojuro', '(Sin Apellido)', '2005-11-01', 3, 3),
--Personajes nuevos 
-- Konoha
('Iruka', 'Umino', '1991-05-26', 3, 1),
('Konohamaru', 'Sarutobi', '2008-12-30', 2, 1),
('Shino', 'Aburame', '2005-01-23', 2, 1),
('Kiba', 'Inuzuka', '2005-07-07', 2, 1),
('Choji', 'Akimichi', '2005-05-01', 2, 1),
('Asuma', 'Sarutobi', '1985-10-18', 4, 1),
('Kurenai', 'Yuhi', '1986-06-11', 4, 1),
('Hiruzen', 'Sarutobi', '1945-02-08', 6, 1),
('Minato', 'Namikaze', '1968-01-25', 6, 1),
('Kushina', 'Uzumaki', '1970-07-10', 4, 1),
('Jiraiya', '(Sin Apellido)', '1965-11-11', 5, 1), 
('Itachi', 'Uchiha', '1990-06-09', 4, 1),
('Shisui', 'Uchiha', '1989-01-01', 4, 1),
('Obito', 'Uchiha', '1986-02-10', 4, 1),
('Madara', 'Uchiha', '1885-12-24', 6, 1),
('Hashirama', 'Senju', '1880-10-23', 6, 1),
('Tobirama', 'Senju', '1881-02-19', 6, 1),
('Sai', '(Sin Apellido)', '2005-11-25', 4, 1),
('Yamato', '(Sin Apellido)', '1985-08-10', 4, 1),
('Danzo', 'Shimura', '1930-01-01', 4, 1),
-- Suna
('Baki', '(Sin Apellido)', '1975-01-01', 4, 2),
('Chiyo', '(Sin Apellido)', '1925-01-01', 4, 2),
('Rasa', '(Sin Apellido)', '1960-01-01', 6, 2),
('Sasori', 'Akasuna', '1970-11-08', 4, 2),
-- Kiri
('Suigetsu', 'Hozuki', '2004-02-18', 2, 3),
('Yagura', '(Sin Apellido)', '1970-01-01', 6, 3),
('Utakata', '(Sin Apellido)', '1985-01-01', 4, 3),
-- Kumo
('A', '(Sin Apellido)', '1965-01-01', 6, 4),
('Yugito', 'Nii', '1972-01-01', 4, 4),
('Cee', '(Sin Apellido)', '1980-01-01', 4, 4),
-- Iwa
('Onoki', '(Sin Apellido)', '1930-01-08', 6, 5),
('Deidara', '(Sin Apellido)', '1985-05-05', 4, 5),
('Kurotsuchi', '(Sin Apellido)', '1995-01-01', 3, 5),
-- Ame
('Nagato', 'Uzumaki', '1968-09-19', 4, 6),
('Konan', '(Sin Apellido)', '1968-02-20', 4, 6),
('Yahiko', '(Sin Apellido)', '1965-01-01', 4, 6),
-- Oto
('Orochimaru', '(Sin Apellido)', '1960-10-27', 5, 7),   
('Kabuto', 'Yakushi', '1984-02-29', 4, 7),
('Kimimaro', 'Kaguya', '1985-01-01', 4, 7),
-- Taki
('Kakuzu', '(Sin Apellido)', '1910-08-15', 4, 8),
('Fu', '(Sin Apellido)', '1990-01-01', 2, 8);
GO

SELECT * FROM Ninjas;
GO