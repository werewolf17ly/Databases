CREATE TABLE active_info
(
    active_id INT GENERATED ALWAYS AS IDENTITY,
    fio VARCHAR(255),
    mail VARCHAR(255),
    interests VARCHAR(255),
    groups VARCHAR(255),
    dorm INT,
    PRIMARY KEY (active_id)    
);

CREATE TABLE department
(
    dep_id INT GENERATED ALWAYS AS IDENTITY,
    dep_name VARCHAR(255),
    boss_id INT,
    descr VARCHAR(255),
    PRIMARY KEY (dep_id),
    FOREIGN KEY (boss_id) REFERENCES active_info(active_id)
);

CREATE TABLE active_profkom
(
    id INT,
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES active_info(active_id),
    FOREIGN KEY (department_id) REFERENCES department(dep_id)
);

CREATE TABLE active_mki
(
    id INT,
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES active_info(active_id),
    FOREIGN KEY (department_id) REFERENCES department(dep_id)
);

CREATE TABLE active_231
(
    id INT,
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES active_info(active_id),
    FOREIGN KEY (department_id) REFERENCES department(dep_id)
);

CREATE TABLE active_other
(
    id INT,
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES active_info(active_id),
    FOREIGN KEY (department_id) REFERENCES department(dep_id)
);

CREATE TABLE cases
(
    case_id INT GENERATED ALWAYS AS IDENTITY,
    depart_id INT,
    act_id INT,
    case_date VARCHAR(255),
    problem VARCHAR(255),
    PRIMARY KEY (case_id),
    FOREIGN KEY (depart_id) REFERENCES department(dep_id),
    FOREIGN KEY (act_id) REFERENCES active_info(active_id)
);


INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('WolfyEK','wolfy', 'wolfs', 'B05-141', 12);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('LizzyLB','blin', 'fox', 'B02-151', 4);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('NikitaNP','Persostrat@', 'dogs', 'B05-241', 7);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('SophiSM','FPMI@.b.raq1', 'fox', 'M05-941', 10);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('ArtemAA','Zhuk@', 'music', 'B03-013', 13);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('ArtemAK', 'ex-predsed!mail.ru','tsardom', 'M05-141', 3);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('AlexSI','predsed@re', 'KMO', 'B05-141', 12);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('AlexSI','predsed@re', 'KMO', 'B05-141', 1);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('AlexSI','predsed@re', 'KMO', 'B05-141', 2);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('KostyaKK','pravo@.re', 'Законы', 'Академ', 0);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('AliceAB','fhysic', 'психология', 'B02-013', 0);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('TimurTS','fact@mail.ru', 'самолеты', 'B03-003', 3);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('TimurTS','fact@mail.ru', 'самолеты', 'B03-003', 12);
INSERT INTO active_info (fio,mail,interests,groups,dorm)
    VALUES ('TimurTS','fact@mail.ru', 'самолеты', 'B03-003', 5);

INSERT INTO department (dep_name, boss_id, descr)
    VALUES ('Правовой', 8, 'Работа с документами');
INSERT INTO department (dep_name, boss_id, descr)
    VALUES ('КМО', 3, 'Организация мероприятий');
INSERT INTO department (dep_name, boss_id, descr)
    VALUES ('Психология', 9, 'Психологическая поддержка');
INSERT INTO department (dep_name, boss_id, descr)
    VALUES ('Промо', 1, 'Сотрудничество');
INSERT INTO department (dep_name, boss_id, descr)
    VALUES ('ПрофоргиФАКТ', 10, 'Профорги');
INSERT INTO department (dep_name, boss_id, descr)
    VALUES ('Мероприятия', 4, 'Творчество');

INSERT INTO active_profkom (id, department_id)
    VALUES (1, 4);
INSERT INTO active_mki (id, department_id)
    VALUES (2, 3);
INSERT INTO active_profkom (id, department_id)
    VALUES (3, 2);
INSERT INTO active_profkom (id, department_id)
    VALUES (4, 1);
INSERT INTO active_profkom (id, department_id)
    VALUES (5, 2);
INSERT INTO active_profkom (id, department_id)
    VALUES (6, 1);
INSERT INTO active_profkom (id, department_id)
    VALUES (7, 2);
INSERT INTO active_profkom (id, department_id)
    VALUES (8, 1);
INSERT INTO active_mki (id, department_id)
    VALUES (9, 3);
INSERT INTO active_231 (id, department_id)
    VALUES (10, 5);

INSERT INTO cases (depart_id, act_id, case_date, problem)
    VALUES (1, 8, '21.04', 'перевод между групп');
INSERT INTO cases (depart_id, act_id, case_date, problem)
    VALUES (2, 2, '18.04-25.05', 'батуты');
INSERT INTO cases (depart_id, act_id, case_date, problem)
    VALUES (5, 4, '1.02', 'МП');
INSERT INTO cases (depart_id, act_id, case_date, problem)
    VALUES (4, 1, '24.08', 'соглашение');

UPDATE active_info
    SET groups = REPLACE(groups, 'B', 'Б');


DELETE FROM active_mki
    WHERE department_id = 6;


SELECT * FROM active_info;
SELECT * FROM department;
SELECT id, department_id, fio, mail FROM active_profkom
    LEFT OUTER JOIN active_info
    ON active_profkom.id = active_info.active_id;
SELECT * FROM active_mki;
SELECT * FROM active_231;
SELECT * FROM active_other;
SELECT * FROM cases;

SELECT dorm, fio, mail FROM active_info GROUP BY dorm, fio, mail 
    HAVING (mail NOT LIKE '%[^[-\w.]+@([A-z0-9][-A-z0-9]+\.)+[A-z]{2,4}$]%');

SELECT fio, dorm, groups FROM active_info ORDER BY dorm;

SELECT DISTINCT fio, max(dorm) OVER(PARTITION BY fio) FROM active_info;

SELECT fio, groups, last_value(dorm) OVER(ORDER BY groups) FROM active_info;

SELECT fio, mail, groups, max(dorm) OVER(PARTITION BY dorm ORDER BY fio) FROM active_info;