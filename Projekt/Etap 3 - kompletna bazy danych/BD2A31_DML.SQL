spool BD2A31_DML.LIS

------------------------------


ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

/* Tabela Wykonawca */

/* Kolejno�� atrybut�w: ID_wykonawcy, NIP (opcja), Ulica, Nr_domu, Nr_mieszkania (Opcja), Kod_pocztowy, Miejscowo��, Kraj, Imi� (Opcja), Nazwisko (Opcja), Data_urodzenia (Opcja), PESEL (Opcja)  */

INSERT INTO wykonawca VALUES (null, '9516966753', null, '16B', 20, '00-001', 'Warszawa', 'Polska', 'Jan', 'Kowalski', '01/12/1978', '78120118701');
INSERT INTO wykonawca VALUES (102, null, 'Polna', 24, null, null, 'Krak�w', null, 'Piotr', 'Nowak', '27/11/1965', '65112709098');
INSERT INTO wykonawca VALUES (103, '9214498124', 'Le�na', '11C', 56, '07-232', 'Szczecin', 'Polska', 'Anna', 'Krakowska', '16/09/1982', '82091600919');
INSERT INTO wykonawca VALUES (104, '9472896694', 'S�oneczna', '1F', 67, '06-198', null, 'Polska', 'Marcin', 'Komorowski', '17/05/1971', '71051718976');
INSERT INTO wykonawca VALUES (105, '9232787887', 'Szkolna', '7J', 80, '47-141', 'Rzesz�w', 'Polska', null, 'Jowialska', null, '66081901865');
INSERT INTO wykonawca VALUES (106, null, 'Kr�tka', '101A', 145, '23-887', 'Olsztyn', null, 'Adam', 8, '01/08/1990', '90080110987');
INSERT INTO wykonawca VALUES (107, null, 'D�uga', 15, 'Ananasowa', '01-564', 88, 'Polska', 'Sebastian', 'Cie�lak', '28/02/1987', '87022844556');
INSERT INTO wykonawca VALUES (108, '9678758585', 'Lipowa', 167, 80, '76-909', null, null, 'Andrzej', 'Kaniowski', null, '65012379910');
INSERT INTO wykonawca VALUES (108, '9678758585', 'Lipowa', 167, 80, '76-909', 'aaa', 'aaa', 'Andrzej', 'Kaniowski', null, '65012379910000000000');

----------------



/* Tabela rodzaj_umowy */


/* Kolejnosc atrybut�w: ID_rodzaju, Nazwa, Opis (Opcja) */

INSERT INTO rodzaj_umowy VALUES (201, 'Umowa przechowania', 'Umowa ta okre�la m.in. spos�b przechowania pewnej rzeczy.');
INSERT INTO rodzaj_umowy VALUES (300, 'Umowa sprzeda�y samochodu', 'Umowa ta okre�la m.in. parametry samochodu podlegajacego sprzedazy.');

---------------------


/* Tabela definicja_atrybutu */


/* Kolejno�� atrybut�w: ID_atrybutu, Nazwa, Czy_opcjonalna, Typ_danych, Opis (Opcja)  */

INSERT INTO definicja_atrybutu VALUES (301, 'abcd', 'T', 'N', 'Wysoko�� kary za niedotrzymanie terminu umowy lub inne uchybienia.');
INSERT INTO definicja_atrybutu VALUES (333, 'Nazwa banku', 'T', 'C', 'Nazwa banku, w kt�rym znajduje si� konto, na kt�re ma by� uiszczona kwota zawarta w umowie.');
INSERT INTO definicja_atrybutu VALUES (303, null, 'T', 'C', 'Numer rachunku bankowego, na kt�re ma by� uiszczona kwota zawarta w umowie.');
INSERT INTO definicja_atrybutu VALUES (304, 'Przedmiot przechowania', null, 'C', 'Przedmiot, jaki zostanie przechowany.');
INSERT INTO definicja_atrybutu VALUES (305, 'Miejsce przechowania', 'N', null, 'Adres, pod kt�rym b�dzie przechowany przedmiot zawarty w umowie.');
INSERT INTO definicja_atrybutu VALUES (null, 'Miejsce przechowania', 'N', null, 'Adres, pod kt�rym b�dzie przechowany przedmiot zawarty w umowie.');
INSERT INTO definicja_atrybutu VALUES (351, 'abcd', 'Q', 'N', 'Wysoko�� kary za niedotrzymanie terminu umowy lub inne uchybienia.');


-------------------------



/* Tabela umowa_cywilnoprawna */


/* Kolejno�� atrybut�w: ID_rodzaju, ID_wykonawcy, ID_umowy, Nr_umowy, Data_zawarcia, Kwota, Poczatek_wykonania, Koniec_wykonania, Temat   */

ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

INSERT INTO umowa_cywilnoprawna VALUES (201, 101, 401, '6/2015', '04/11/2015', 1500.04, '08/01/2016', '15/01/2016', 'Przechowanie ciagnika siodlowego');
INSERT INTO umowa_cywilnoprawna VALUES (203, 102, 402, null, '15/02/2014', 7500, '20/02/2014', '31/12/2014', 'Po�yczka na telewizor');
INSERT INTO umowa_cywilnoprawna VALUES (null, 103, 403, '3/2000', '07/07/2000', 8876.45, '08/07/2000', '31/12/2003', 'Zbudowanie altany');
INSERT INTO umowa_cywilnoprawna VALUES (205, null, 404, '2/2018', '03/04/2018', 1234.56, '03/04/2018', '03/04/2018', 'Darowizna zegarka');
INSERT INTO umowa_cywilnoprawna VALUES (206, 105, 405, '6/1999', '18/08/1999', 100000.09, '01/09/1999', '30/06/2000', null);
INSERT INTO umowa_cywilnoprawna VALUES (208, 106, 406, '9/2005', '15/12/2005', 500.99, '01/01/2006', null, 'Dzier�awa traktora');
INSERT INTO umowa_cywilnoprawna VALUES (209, 107, 407, '11/2003', '17/11/2003', 3000.99, null, '31/12/2003', 'Dostawa tysiaca palet jaj');
INSERT INTO umowa_cywilnoprawna VALUES (201, 101, 410, '6/2015', '04/11/2015', 1500.04, '08/01/2000', '15/01/2016', 'Przechowanie ciagnika siodlowego');
INSERT INTO umowa_cywilnoprawna VALUES (201, 101, 401, '6/2015', '04/11/2015', 1500.04, '08/01/2016', '15/01/2012', 'Przechowanie ciagnika siodlowego');

------------------



/* Tabela atrybut_rodzaju_umowy */

/* Kolejno�� atrybut�w: ID_rodzaju, ID_atrybutu */
INSERT INTO atrybut_rodzaju_umowy VALUES (null, 301); -- kara umowna
INSERT INTO atrybut_rodzaju_umowy VALUES (201, null); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 'aaa'); -- przedmiot przechowania
INSERT INTO atrybut_rodzaju_umowy VALUES (9.5, 305); -- adres przechowania

-----------------



/* Tabela wartosc_atrybutu */


/* Kolejno�� atrybut�w: ID_rodzaju, ID_umowy, ID_atrybutu, Warto�� (Opcja) */

INSERT INTO wartosc_atrybutu VALUES (null, 401, 304, 'Traktor Ursus');
INSERT INTO wartosc_atrybutu VALUES (201, null, 305, 'ul. Dobra 64, 07-232 Warszawa');
INSERT INTO wartosc_atrybutu VALUES (203, 402, null, '450.00 zl');
INSERT INTO wartosc_atrybutu VALUES (203, 500, 302, null);

------------------------------------------------------------

UPDATE wykonawca SET id_wykonawcy = 106 WHERE id_wykonawcy = 101;
UPDATE wykonawca SET kraj = null;
UPDATE wykonawca set numer_domu = null;

UPDATE umowa_cywilnoprawna SET id_wykonawcy = 104 WHERE id_wykonawcy = 401;
UPDATE umowa_cywilnoprawna SET kwota = 'abd';
UPDATE umowa_cywilnoprawna set id_rodzaju = 999;

UPDATE definicja_atrybutu SET nazwa = 'Nr silnika';
UPDATE definicja_atrybutu SET typ_danych = 'H';
UPDATE definicja_atrybutu set czy_opcjonalna = 'Q';

UPDATE wartosc_atrybutu SET id_rodzaju = 444;
UPDATE wartosc_atrybutu SET id_umowy = 1;
UPDATE wartosc_atrybutu set id_atrybutu = 888;

UPDATE rodzaj_umowy SET nazwa = 'Umowa darowizny';
UPDATE rodzaj_umowy SET id_rodzaju = 999;


------------------------------

DELETE FROM wykonawca where id_wykonawcy = 101;
DELETE FROM rodzaj_umowy;
DELETE FROM definicja_atrybutu where czy_opcjonalna = 'T';



spool off