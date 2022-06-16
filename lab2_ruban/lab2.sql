-- Лабораторна робота № 2
-- З дисципліни Бази даних та інформаційні системи
-- Студента групи МІТ-31 Рубан Марго

-- 1 Обрати всі значення елементи з таблиці bicycle
SELECT * FROM bicycle;
-- 2  Обрати всі значення стовпчиків full_name і brand_id з таблиці bicycle
SELECT full_name, brand_id FROM bicycle;
-- 3 Обрати всі значення стовпчика full_name з таблиці bicycle із заголовком "Full name"
SELECT full_name AS "Full name" FROM bicycle;
-- 4 Обрати всі значення стовпчиків full_name і brand_id з таблиці bicycle де created_at рівно '2019-01-01'
SELECT full_name, brand_id FROM bicycle WHERE created_at='2019-01-01';
-- 5 Обрати всі значення стовпчиків full_name або brand_id з таблиці bicycle
SELECT full_name || brand_id FROM bicycle;
-- 6 Обрати всі значення стовпчика id та значення суми full_name та brand_id з таблиці bicycle
SELECT id, concat(full_name, brand_id) FROM bicycle;
-- 7 Обрати максимальне значення price з таблиці bicycle
SELECT max(price) FROM bicycle;
-- 8 Обрати середнє значення price з таблиці bicycle
SELECT avg(price) FROM bicycle;
-- 9 Обрати мінімальне значення price з таблиці bicycle
SELECT min(price) FROM bicycle;
-- 10 Обрати кількість price з таблиці bicycle
SELECT count(price) FROM bicycle;
-- 11 Обрати всі значення стовпчика price які менші за 90000 з таблиці bicycle
SELECT price FROM bicycle WHERE price<90000;
-- 12 Обрати всі значення стовпчика price які більше за 90000 з таблиці bicycle
SELECT price FROM bicycle WHERE price>90000;
-- 13 Обрати всі значення стовпчика price які менші за 90000 і більші за 80000 з таблиці bicycle
SELECT price FROM bicycle WHERE price<90000 AND price>80000;
-- 14 Обрати всі значення стовпчика price які менші за 90000 або більші за 122000 з таблиці bicycle
SELECT price FROM bicycle WHERE price<90000 OR price>122000;
-- 15 Обрати всі значення стовпчика price які менші за 90000 або більші за 100000 з таблиці bicycle де created_at більше '2001-01-01'
SELECT price FROM bicycle WHERE price<90000 AND price>100000 OR created_at > '2001-01-01';
-- 16 Обрати всі значення стовпчика price які менші за 90000 і created_at менше '2001-01-01' або price більші за 100000 і created_at більше '2001-01-01' з таблиці bicycle
SELECT price FROM bicycle WHERE (price<90000 AND created_at<'2000-01-01') OR (price>100000 AND created_at > '2001-01-01');
-- 17 Обрати всі значення елементи з таблиці bicycle де full_name не 'M'
SELECT * FROM bicycle WHERE NOT full_name = 'M';
-- 18 Обрати всі значення елементи з таблиці bicycle де created_at між '1930-01-01' і '1980-01-01'
SELECT * FROM bicycle WHERE created_at BETWEEN '1930-01-01' AND '1980-01-01';
-- 19 Обрати всі місяць поля created_at кожного елемента з таблиці bicycle
SELECT EXTRACT (MONTH FROM created_at) FROM bicycle;
-- 20 Обрати 1,2,3 місяць поля created_at кожного елемента з таблиці bicycle з заголовком "month"
SELECT EXTRACT (MONTH FROM created_at) AS "month" FROM bicycle WHERE EXTRACT (MONTH FROM created_at) IN (1,2,3);
-- 21 Обрати всі значення елементи з таблиці bicycle де full_name має другий сhar a
SELECT * FROM bicycle WHERE full_name LIKE '_a%';
-- 22 Обрати всі значення елементи з таблиці bicycle де full_name має перший сhar g
SELECT * FROM bicycle WHERE full_name LIKE 'g%';
-- 23 Обрати created_at як text з таблиці bicycle
SELECT created_at :: TEXT FROM bicycle;
-- 24 Обрати всі унікальні значення full_name з таблиці bicycle
SELECT DISTINCT full_name FROM bicycle;
-- 25 Обрати всі рядки з таблиці bicycle сортовано по full_name
SELECT * FROM bicycle ORDER BY full_name;
-- 26 Обрати всі рядки з таблиці bicycle сортовано по brand_id по DESC
SELECT * FROM bicycle ORDER BY brand_id DESC;
-- 27 Обрати всі рядки з таблиці bicycle сортовано по price, size по DESC
SELECT * FROM bicycle ORDER BY price, size DESC;
-- 28 Обрати всі значення стовпчиків full_name і created_at і size з таблиці bicycle
SELECT full_name, created_at, size FROM bicycle e JOIN color c ON (e.brand_id = c.id);
-- 29 Обрати всі значення стовпчиків full_name і created_at і size з таблиці bicycle без нул значень bicycle таблиці
SELECT full_name, created_at, size FROM bicycle e LEFT JOIN color c ON (e.brand_id = c.id);
-- 30 Обрати всі значення стовпчиків full_name і created_at і size з таблиці bicycle без нул значень color таблиці
SELECT full_name, created_at, size FROM bicycle e RIGHT JOIN color c ON (e.brand_id = c.id);
-- 31 Обрати всі значення стовпчиків full_name і created_at і size  з таблиці bicycle і color
SELECT full_name, created_at, size FROM bicycle e FULL OUTER JOIN color c ON (e.brand_id = c.id);
-- 32 Обрати всі значення стовпчиків full_name і created_at і size  з таблиці bicycle
SELECT full_name, created_at, size FROM bicycle e JOIN color c USING (id);
-- 33 Обрати всі значення стовпчиків full_name і color з таблиці bicycle і size з color
SELECT DISTINCT e.full_name, e.brand_id, c.name FROM bicycle e JOIN color c ON (e.brand_id = c.id);
-- 34 Обрати всі значення елементи з таблиці bicycle
SELECT * FROM brand;
-- 35 Обрати всі значення елементи з таблиці bicycle
SELECT * FROM size;
-- 36 Обрати всі значення елементи з таблиці bicycle
SELECT * FROM bookings;
-- 37 Обрати всі значення елементи з таблиці bicycle
SELECT * FROM color;
-- 38  Обрати всі значення стовпчиків name і id з таблиці brand
SELECT NAME, id FROM brand;
-- 39  Обрати всі значення стовпчиків name і size з таблиці bookings
SELECT NAME, id FROM bookings;
-- 40  Обрати всі значення стовпчиків name і bicycle_id з таблиці bookings
SELECT NAME, bicycle_id FROM bookings;
-- 41  Обрати всі значення стовпчиків red і green з таблиці color
SELECT red, green FROM color;
-- 42 Обрати всі значення стовпчика name з таблиці brand із заголовком "Name"
SELECT NAME AS "Name" FROM brand;
-- 43 Обрати всі значення стовпчика name з таблиці size із заголовком "Name"
SELECT NAME AS "Name" FROM size;
-- 44 Обрати всі значення стовпчика bicycle_id з таблиці bookings із заголовком "Brand"
SELECT bicycle_id AS "Brand" FROM bookings;
-- 45 Обрати всі значення стовпчика transparency з таблиці color із заголовком "Transparency"
SELECT transparency AS "Transparency" FROM color;
-- 46 Обрати всі значення стовпчиків name або id з таблиці brand
SELECT NAME || id FROM brand;
-- 47 Обрати всі значення стовпчиків id і name або size з таблиці size
SELECT id, NAME || size FROM size;
-- 48 Обрати всі значення стовпчиків id і name або bicycle_id з таблиці bookings
SELECT id, NAME || bicycle_id FROM bookings;
-- 49 Обрати всі значення стовпчиків id і name або transparency з таблиці color
SELECT id, NAME || transparency FROM color;
-- 50 Обрати всі значення суми id та name з таблиці brand
SELECT concat(id, NAME) FROM brand;
-- 51 Обрати всі значення стовпчика id та значення суми name та bicycle_id з таблиці bookings
SELECT id, concat(NAME, bicycle_id) FROM bookings;
-- 52 Обрати всі значення стовпчика id та значення суми name та size з таблиці size
SELECT id, concat(NAME, size) FROM size;
-- 53 Обрати всі значення стовпчика id та значення суми name та transparency з таблиці color
SELECT id, concat(NAME, transparency) FROM color;
-- 54 Обрати максимальне значення id з таблиці brand
SELECT max(id) FROM brand;
-- 55 Обрати максимальне значення bicycle_id з таблиці bookings
SELECT max(bicycle_id) FROM bookings;
-- 56 Обрати максимальне значення size з таблиці size
SELECT max(size) FROM size;
-- 57 Обрати максимальне значення price з таблиці bicycle
SELECT max(transparency) FROM color;
-- 58 Обрати середнє значення id з таблиці brand
SELECT avg(id) FROM brand;
-- 59 Обрати середнє значення bicycle_id з таблиці bookings
SELECT avg(bicycle_id) FROM bookings;
-- 60 Обрати середнє значення size з таблиці size
SELECT avg(size) FROM size;
-- 61 Обрати середнє значення transparency з таблиці color
SELECT avg(transparency) FROM color;
-- 62 Обрати мінімальне значення id з таблиці brand
SELECT min(id) FROM brand;
-- 63 Обрати мінімальне значення size з таблиці size
SELECT min(size) FROM size;
-- 64 Обрати мінімальне значення bicycle_id з таблиці bookings
SELECT min(bicycle_id) FROM bookings;
-- 65 Обрати мінімальне значення transparency з таблиці color
SELECT min(transparency) FROM color;
-- 66 Обрати кількість id з таблиці brand
SELECT count(id) FROM brand;
-- 67 Обрати кількість sizesize з таблиці size
SELECT count(size) FROM size;
-- 68 Обрати кількість bicycle_id з таблиці bookings
SELECT count(bicycle_id) FROM bookings;
-- 69 Обрати кількість transparency з таблиці color
SELECT count(transparency) FROM color;
-- 70 Обрати всі значення стовпчика id які менші за 90000 з таблиці brand
SELECT id FROM brand WHERE id<90000;
-- 71 Обрати всі значення стовпчика size які менші за 90000 з таблиці size
SELECT size FROM size WHERE size<90000;
-- 72 Обрати всі значення стовпчика bicycle_id які менші за 90000 з таблиці bookings
SELECT bicycle_id FROM bookings WHERE bicycle_id<90000;
-- 73 Обрати всі значення стовпчика transparency які менші за 90000 з таблиці color
SELECT transparency FROM color WHERE transparency<90000;
-- 74 Обрати всі значення стовпчика id які більше за 90000 з таблиці brand
SELECT id FROM brand WHERE id>90000;
-- 75 Обрати всі значення стовпчика size які більше за 90000 з таблиці size
SELECT size FROM size WHERE size>90000;
-- 76 Обрати всі значення стовпчика bicycle_id які більше за 90000 з таблиці bookings
SELECT bicycle_id FROM bookings WHERE bicycle_id>90000;
-- 77 Обрати всі значення стовпчика price які більше за 90000 з таблиці bicycle
SELECT transparency FROM color WHERE transparency>90000;
-- 78 Обрати всі значення стовпчика id які менші за 90000 і більші за 80000 з таблиці brand
SELECT id FROM brand WHERE id<90000 AND id>80000;
-- 79 Обрати всі значення стовпчика size які менші за 90000 і більші за 80000 з таблиці size
SELECT size FROM size WHERE size<90000 AND size>80000;
-- 80 Обрати всі значення стовпчика bicycle_id які менші за 90000 і більші за 80000 з таблиці bookings
SELECT bicycle_id FROM bookings WHERE bicycle_id<90000 AND bicycle_id>80000;
-- 81 Обрати всі значення стовпчика transparency які менші за 90000 і більші за 80000 з таблиці color
SELECT transparency FROM color WHERE transparency<90000 AND transparency>80000;
-- 82 Обрати всі значення стовпчика id які менші за 90000 або більші за 122000 з таблиці brand
SELECT id FROM brand WHERE id<90000 OR id>122000;
-- 83 Обрати всі значення стовпчика size які менші за 90000 або більші за 122000 з таблиці size
SELECT size FROM size WHERE size<90000 OR size>122000;
-- 84 Обрати всі значення стовпчика bicycle_id які менші за 90000 або більші за 122000 з таблиці bookings
SELECT bicycle_id FROM bookings WHERE bicycle_id<90000 OR bicycle_id>122000;
-- 85 Обрати всі значення стовпчика price які менші за 90000 або більші за 122000 з таблиці bicycle
SELECT transparency FROM color WHERE transparency<90000 OR transparency>122000;
-- 86 Обрати всі значення елементи з таблиці brand де name не 'M'
SELECT * FROM brand WHERE NOT NAME = 'M';
-- 87 Обрати всі значення елементи з таблиці size де name не 'M'
SELECT * FROM size WHERE NOT NAME = 'M';
-- 88 Обрати всі значення елементи з таблиці bookings де name не 'M'
SELECT * FROM bookings WHERE NOT NAME = 'M';
-- 89 Обрати всі значення елементи з таблиці color де name не 'M'
SELECT * FROM color WHERE NOT NAME = 'M';
-- 90 Обрати всі значення елементи з таблиці brand де name має другий сhar a
SELECT * FROM brand WHERE NAME LIKE '_a%';
-- 91 Обрати всі значення елементи з таблиці size де name має другий сhar a
SELECT * FROM size WHERE NAME LIKE '_a%';
-- 92 Обрати всі значення елементи з таблиці bookings де name має другий сhar a
SELECT * FROM bookings WHERE NAME LIKE '_a%';
-- 93 Обрати всі значення елементи з таблиці color де name має другий сhar a
SELECT * FROM color WHERE NAME LIKE '_a%';
-- 94 Обрати всі значення елементи з таблиці brand де name має перший сhar g
SELECT * FROM brand WHERE NAME LIKE 'g%';
-- 95 Обрати всі значення елементи з таблиці size де name має перший сhar g
SELECT * FROM size WHERE NAME LIKE 'g%';
-- 96 Обрати всі значення елементи з таблиці bookings де name має перший сhar g
SELECT * FROM bookings WHERE NAME LIKE 'g%';
-- 97 Обрати всі значення елементи з таблиці color де name має перший сhar g
SELECT * FROM color WHERE NAME LIKE 'g%';
-- 98 Обрати всі унікальні значення name з таблиці size
SELECT DISTINCT NAME FROM size;
-- 99 Обрати всі унікальні значення name з таблиці bookings
SELECT DISTINCT NAME FROM bookings;
-- 100
SELECT concat(bicycle.full_name, ' size: ', SIZE.name, ' brand: ', BRAND.name, ' bookings: ', DIST.name, ' color: ', COLOR.name) AS "bicyclees"
FROM bicycle bicycle
    JOIN size SIZE ON (bicycle.size = SIZE.id)
    JOIN brand BRAND ON (bicycle.brand_id = BRAND.id)
    JOIN bookings DIST ON (DIST.bicycle_id = BICYCLE.id)
    JOIN color COLOR ON (bicycle.color_id = COLOR.id)
WHERE bicycle.id<90000
  AND bicycle.full_name LIKE 'The%'
  AND bicycle.created_at BETWEEN '2020-01-01' AND '2021-01-01'

-- Висновки: В результаті виконання даної лабораторної роботи було створино 100 SQL запитів