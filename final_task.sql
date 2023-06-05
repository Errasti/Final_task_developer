/* Создаем таблицы
**/

CREATE TABLE Cat (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);


CREATE TABLE Dog (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);


CREATE TABLE Hamster (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);



CREATE TABLE Horse (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);


CREATE TABLE Camel (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);


CREATE TABLE Donkey (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
	Birthday DATE
);

/* Создаем таблицы групп 
**/

CREATE TABLE Pet (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);


CREATE TABLE packAnimal (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    liftWeight INT,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday DATE
);

/* 
Создаем общую таблицу
**/
CREATE TABLE humanFriend(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(45),
    Command VARCHAR(45),
    Birthday Date
    );
    
/*
Заполнение данных
**/
    
    INSERT INTO Cat (Name, Command, Birthday) VALUES
    ('Мурка', 'Спать', '218-10-01'),
    ('Мурзик', 'Спать', '2012-09-01'),
	('Буля', 'Спать', '2010-02-09'),
    ('Барсик', 'Спать', '2017-03-10');
    
    SELECT * FROM Cat;

    INSERT INTO Dog (Name, Command, Birthday) VALUES
    ('Стив', 'Лежать', '2020-01-11'),
    ('Долар', 'Лежать', '2010-06-08'),
	('Рогу', 'Лежать', '2013-01-07'),
    ('Тайсон', 'Лежать', '2001-03-12');
	
    SELECT * FROM Dog;
 
	INSERT INTO Hamster (Name, Command, Birthday) VALUES
    ('Эйнштейн', 'Бежать', '2012-01-01'),
    ('Лама', 'Бежать', '2010-06-06'),
	('Стиффлер', 'Бежать', '2010-01-06'),
    ('Мамонт', 'Бежать', '2018-03-17');
	
    SELECT * FROM Hamster;
     
	INSERT INTO Сamel (Name, Command, LiftWeight, Birthday) VALUES
    ('Пачка', 'Поднять', 100, '2022-01-01'),
    ('Плевок', 'Поднять', 200, '2017-06-06'),
	('Каскад', 'Поднять', 400, '2023-01-06'),
    ('Дичка', 'Поднять', 50, '2021-03-17');
	
    SELECT * FROM Сamel;
     
	INSERT INTO Horse (Name, Command, liftWeight, Birthday) VALUES
    ('Плотва', 'Галоп', 100, '2022-01-01'),
    ('Геральт', 'Галоп', 100, '2017-06-06'),
	('Бывшая', 'Галоп', 250, '2023-01-06'),
    ('Ярость', 'Галоп', 350, '2021-03-17');
	
    SELECT * FROM Horse;    
     
	INSERT INTO Donkey (Name, Command, liftWeight, Birthday) VALUES
    ('Насир', 'Жевать', 55, '2022-01-01'),
    ('Ия', 'Жевать', 50, '2017-06-06'),
	('Травник', 'Жевать', 45, '2023-01-06'),
    ('Осёл', 'Жевать', 40, '2021-03-17');
	
    SELECT * FROM Donkey;  	
 
 /* Удаляем верблюдов
 **/
 
 DELETE FROM Camel WHERE id > 0;
 SELECT * FROM Сamel;
 
/* 
Обьединяем нужные таблицы
**/

CREATE TABLE packAnimalNew (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  Name, 
        Command, 
        Birthday
FROM Horse UNION 
SELECT  Name, 
        Command, 
        Birthday
FROM Donkey;

SELECT * FROM packAnimalNew;

/* Таблицы с возрастом
**/


INSERT INTO Pet (Name, Command, Birthday)
SELECT  Name, 
        Command, 
        Birthday
FROM Cat UNION 
SELECT  Name, 
        Command, 
        Birthday
FROM Dog UNION
SELECT  Name, 
        Command, 
        Birthday
FROM Hamster;
SELECT * FROM pet;

INSERT INTO humanFriend (Name, Command, Birthday)
SELECT  Name, 
        Command, 
        Birthday
FROM Pet UNION 
SELECT  Name, 
        Command, 
        Birthday
FROM packAnimalNew;
SELECT * FROM humanFriend;

CREATE TABLE youngAnimals (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT Name, 
        Command, 
        Birthday,
        Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) as age
FROM humanFriend
WHERE Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) > 1 
	AND Round((year(current_date()) - year(Birthday)) + (month(current_date() - month(Birthday)))/10, 2) < 3;
SELECT * FROM youngAnimals;

/*
Обьединяем таблицы с сохранением принадлежности
*/

CREATE TABLE newhumanFriend (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
SELECT  Name, 
        Command,
        Birthday,
        'cat' as oldTable
FROM Сat UNION 
SELECT  Name, 
        Command, 
        Birthday,
        'dog' as oldTable
FROM Dog UNION
SELECT  Name, 
        Command, 
        Birthday,
        'hamster' as oldTable
FROM Hamster UNION 
SELECT  Name, 
        Command, 
        Birthday,
        'horse' as oldTable
FROM Horse UNION 
SELECT  Name, 
        Command, 
        Birthday,
        'donkey' as oldTable
FROM Donkey;

SELECT * FROM newhumanFriend;