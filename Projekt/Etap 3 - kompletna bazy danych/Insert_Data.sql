ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

/* Tabela Wykonawca */

/* Kolejnoœæ atrybutów: ID_wykonawcy, NIP (opcja), Ulica, Nr_domu, Nr_mieszkania (Opcja), Kod_pocztowy, Miejscowoœæ, Kraj, Imiê (Opcja), Nazwisko (Opcja), Data_urodzenia (Opcja), PESEL (Opcja)  */

INSERT INTO wykonawca VALUES (101, '9516966753', 'G³ówna', '16B', 20, '00-001', 'Warszawa', 'Polska', 'Jan', 'Kowalski', '01/12/1978', '78120118701'); -- OK
INSERT INTO wykonawca VALUES (102, null, 'Polna', 24, null, '15-434', 'Kraków', 'Polska', 'Piotr', 'Nowak', '27/11/1965', '65112709098'); -- OK
INSERT INTO wykonawca VALUES (103, '9214498124', 'Leœna', '11C', 56, '07-232', 'Szczecin', 'Polska', 'Anna', 'Krakowska', '16/09/1982', '82091600919'); -- OK
INSERT INTO wykonawca VALUES (104, '9472896694', 'S³oneczna', '1F', 67, '06-198', 'Marki', 'Polska', 'Marcin', 'Komorowski', '17/05/1971', '71051718976'); -- OK
INSERT INTO wykonawca VALUES (105, '9232787887', 'Szkolna', '7J', 80, '47-141', 'Rzeszów', 'Polska', 'Jowita', 'Jowialska', '19/08/1966', '66081901865'); -- OK
INSERT INTO wykonawca VALUES (106, null, 'Krótka', '101A', 145, '23-887', 'Olsztyn', 'Polska', 'Adam', 'Gigant', '01/08/1990', '90080110987'); -- OK
INSERT INTO wykonawca VALUES (107, '9153959497', 'D³uga', 15, null, '01-564', 'Stasi Las', 'Polska', 'Sebastian', 'Cieœlak', '28/02/1987', '87022844556'); -- OK
INSERT INTO wykonawca VALUES (108, '9678758585', 'Lipowa', 167, 80, '76-909', 'Ciechanów', 'Polska', 'Andrzej', 'Koz³owski', '23/01/1965', '65012379910'); -- OK


commit;

----------------



/* Tabela rodzaj_umowy */


/* Kolejnosc atrybutów: ID_rodzaju, Nazwa, Opis (Opcja) */

INSERT INTO rodzaj_umowy VALUES (201, 'Umowa przechowania', 'Umowa ta okreœla m.in. sposób przechowania pewnej rzeczy.');
INSERT INTO rodzaj_umowy VALUES (202, 'Umowa sprzeda¿y samochodu', 'Umowa ta okreœla m.in. parametry samochodu podlegajacego sprzedazy.');
INSERT INTO rodzaj_umowy VALUES (203, 'Umowa po¿yczki', 'Umowa ta okreœla m.in. kwotê po¿yczki.');
INSERT INTO rodzaj_umowy VALUES (204, 'Umowa o roboty budowlane', 'Umowa ta okreœla m.in. jaki obiekt ma zostaæ zbudowany.');
INSERT INTO rodzaj_umowy VALUES (205, 'Umowa darowizny', 'Umowa ta okreœla m.in. przedmiot darowizny.');
INSERT INTO rodzaj_umowy VALUES (206, 'Umowa najmu lokalu mieszkalnego', 'Umowa ta okreœla m.in. okres najmu i czynsz.');
INSERT INTO rodzaj_umowy VALUES (207, 'Umowa spólki cywilnej', 'Umowa ta okreœla m.in. cel dziaania i siedzibê spólki.');
INSERT INTO rodzaj_umowy VALUES (208, 'Umowa dzier¿awy', 'Umowa ta okreœla m.in. przedmiot dzier¿awy.');
INSERT INTO rodzaj_umowy VALUES (209, 'Umowa dostawy', 'Umowa ta okreœla m.in. przedmioty dostawy oraz kary za przekroczenie terminu dostawy.');


commit;
---------------------


/* Tabela definicja_atrybutu */


/* Kolejnoœæ atrybutów: ID_atrybutu, Nazwa, Czy_opcjonalna, Typ_danych, Opis (Opcja)  */

/* Atrybuty u¿yteczne w ró¿nych umowach */
INSERT INTO definicja_atrybutu VALUES (301, 'Wysokoœæ kary umownej', 1, 'N', 'Wysokoœæ kary za niedotrzymanie terminu umowy lub inne uchybienia.');
INSERT INTO definicja_atrybutu VALUES (302, 'Nazwa banku', 1, 'C', 'Nazwa banku, w którym znajduje siê konto, na które ma byæ uiszczona kwota zawarta w umowie.');
INSERT INTO definicja_atrybutu VALUES (303, 'Nr rachunku bankowego', 1, 'C', 'Numer rachunku bankowego, na które ma byæ uiszczona kwota zawarta w umowie.');

/* Umowa przechowania -> ID_rodzaju = 201 */
INSERT INTO definicja_atrybutu VALUES (304, 'Przedmiot przechowania', 0, 'C', 'Przedmiot, jaki zostanie przechowany.');
INSERT INTO definicja_atrybutu VALUES (305, 'Miejsce przechowania', 0, 'C', 'Adres, pod którym bêdzie przechowany przedmiot zawarty w umowie.');

/* Umowa sprzeda¿y samochodu -> ID_rodzaju = 202 */
INSERT INTO definicja_atrybutu VALUES (306, 'Nazwa samochodu', 0, 'C', 'Marka i model sprzedawanego samochodu.');
INSERT INTO definicja_atrybutu VALUES (307, 'Typ samochodu', 0, 'C', 'Typ sprzedawanego samochodu - osobowy lub ciê¿arowy.');
INSERT INTO definicja_atrybutu VALUES (308, 'Rok produkcji', 0, 'N', 'Rok produkcji sprzedawanego samochodu.');
INSERT INTO definicja_atrybutu VALUES (309, 'Nr rejestracyjny', 0, 'C', 'Numer rejestracyjny sprzedawanego samochodu.');
INSERT INTO definicja_atrybutu VALUES (310, 'Nr nadwozia', 0, 'C', 'Numer nadwozia sprzedawanego samochodu.');
INSERT INTO definicja_atrybutu VALUES (311, 'Nr karty pojazdu', 0, 'C', 'Numer karty pojazdu sprzedawanego samochodu.');
INSERT INTO definicja_atrybutu VALUES (312, 'Nr silnika', 0, 'C', 'Numer silnika sprzedawanego samochodu.');

/* Umowa po¿yczki -> ID_rodzaju = 203 */
INSERT INTO definicja_atrybutu VALUES (313, 'Wysokoœæ odsetek', 0, 'N', 'Kwota odsetek, jakie ma zapaciæ po¿yczkobiorca.');

/* Umowa o roboty budowlane -> ID_rodzaju = 204 */
INSERT INTO definicja_atrybutu VALUES (314, 'Nazwa obiektu', 0, 'C', 'Nazwa obiektu, jaki ma zostaæ wybudowany.');
INSERT INTO definicja_atrybutu VALUES (315, 'Adres dzialki', 0, 'N', 'Adres dzialki, na której ma byæ wybudowany obiekt, o którym mowa w umowie.');

/* Umowa darowizny -> ID_rodzaju = 205 */
INSERT INTO definicja_atrybutu VALUES (316, 'Przedmiot darowizny', 0, 'C', 'Przedmiot darowizny, o którym mowa w umowie.');

/* Umowa najmu lokalu mieszkalnego -> ID_rodzaju = 206 */
INSERT INTO definicja_atrybutu VALUES (317, 'Adres lokalu mieszkalnego', 0, 'C', 'Adres wynajmowanego lokalu mieszkalnego.');
INSERT INTO definicja_atrybutu VALUES (318, 'Powierzchnia u¿ytkowa', 0, 'N', 'Powierzchnia u¿ytkowa wynajmowanego lokalu mieszkalnego.');

/* Umowa spóki cywilnej -> ID_rodzaju = 207 */
INSERT INTO definicja_atrybutu VALUES (319, 'Nazwa spólki', 0, 'C', 'Nazwa utworzonej spólki.');
INSERT INTO definicja_atrybutu VALUES (320, 'Cel spólki', 0, 'C', 'Cel istnienia utworzonej spólki.');
INSERT INTO definicja_atrybutu VALUES (321, 'Siedziba spólki', 0, 'C', 'Siedziba utworzonej spólki.');

/* Umowa dzier¿awy -> ID_rodzaju = 208 */
INSERT INTO definicja_atrybutu VALUES (322, 'Przedmiot dzier¿awy', 0, 'C', 'Przedmiot, jaki zostanie wydzier¿awiony.');

/* Umowa dostawy -> ID_rodzaju = 209 */
INSERT INTO definicja_atrybutu VALUES (323, 'Iloœæ sztuk', 0, 'N', 'Iloœæ sztuk towaru, jaka ma byæ dostarczona.');

commit;

-------------------------



/* Tabela umowa_cywilnoprawna */


/* Kolejnoœæ atrybutów: ID_rodzaju, ID_wykonawcy, ID_umowy, Nr_umowy, Data_zawarcia, Kwota, Poczatek_wykonania, Koniec_wykonania, Temat   */

ALTER SESSION SET NLS_DATE_FORMAT = "DD/MM/YYYY";

INSERT INTO umowa_cywilnoprawna VALUES (201, 101, 401, '6/2015', '04/11/2015', 1500.04, '08/01/2016', '15/01/2016', 'Przechowanie ciagnika siodlowego');
INSERT INTO umowa_cywilnoprawna VALUES (203, 102, 402, '1/2014', '15/02/2014', 7500, '20/02/2014', '31/12/2014', 'Po¿yczka na telewizor');
INSERT INTO umowa_cywilnoprawna VALUES (204, 103, 403, '3/2000', '07/07/2000', 8876.45, '08/07/2000', '31/12/2003', 'Zbudowanie altany');
INSERT INTO umowa_cywilnoprawna VALUES (205, 104, 404, '2/2018', '03/04/2018', 1234.56, '03/04/2018', '03/04/2018', 'Darowizna zegarka');
INSERT INTO umowa_cywilnoprawna VALUES (206, 105, 405, '6/1999', '18/08/1999', 100000.09, '01/09/1999', '30/06/2000', 'Wynajem luksusowego apartamentu');
INSERT INTO umowa_cywilnoprawna VALUES (208, 106, 406, '9/2005', '15/12/2005', 500.99, '01/01/2006', '31/12/2007', 'Dzier¿awa traktora');
INSERT INTO umowa_cywilnoprawna VALUES (209, 107, 407, '11/2003', '17/11/2003', 3000.99, '01/12/2003', '31/12/2003', 'Dostawa tysiaca palet jaj');
commit;
------------------



/* Tabela atrybut_rodzaju_umowy */

/* Kolejnoœæ atrybutów: ID_rodzaju, ID_atrybutu */

/* Umowa przechowania */
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 301); -- kara umowna
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 304); -- przedmiot przechowania
INSERT INTO atrybut_rodzaju_umowy VALUES (201, 305); -- adres przechowania


/* Umowa sprzeda¿y samochodu */
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 306); -- nazwa samochodu
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 307); -- typ samochodu
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 308); -- rok produkcji
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 309); -- nr rejestracyjny
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 310); -- nr nadwozia
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 311); -- nr karty pojazdu
INSERT INTO atrybut_rodzaju_umowy VALUES (202, 312); -- nr silnika


/* Umowa po¿yczki */
INSERT INTO atrybut_rodzaju_umowy VALUES (203, 301); -- kara umowna
INSERT INTO atrybut_rodzaju_umowy VALUES (203, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (203, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (203, 313); -- odsetki

/* Umowa o roboty budowlane */
INSERT INTO atrybut_rodzaju_umowy VALUES (204, 301); -- kara umowna
INSERT INTO atrybut_rodzaju_umowy VALUES (204, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (204, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (204, 314); -- obiekt do zbudowania
INSERT INTO atrybut_rodzaju_umowy VALUES (204, 315); -- adres dzialki

/* Umowa darowizny */
INSERT INTO atrybut_rodzaju_umowy VALUES (205, 316); -- przedmiot darowizny

/* Umowa najmu lokalu mieszkalnego */
INSERT INTO atrybut_rodzaju_umowy VALUES (206, 301); -- kara umowna
INSERT INTO atrybut_rodzaju_umowy VALUES (206, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (206, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (206, 317); -- adres mieszkania
INSERT INTO atrybut_rodzaju_umowy VALUES (206, 318); -- powierzchnia u¿ytkowa


/* Umowa spóki cywilnej */
INSERT INTO atrybut_rodzaju_umowy VALUES (207, 319); -- nazwa spolki
INSERT INTO atrybut_rodzaju_umowy VALUES (207, 320); -- cel spolki
INSERT INTO atrybut_rodzaju_umowy VALUES (208, 321); -- siedziba spolki


/* Umowa dzier¿awy */
INSERT INTO atrybut_rodzaju_umowy VALUES (208, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (208, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (208, 322); -- przedmiot dzier¿awy

/* Umowa dostawy */
INSERT INTO atrybut_rodzaju_umowy VALUES (209, 301); -- kara umowna
INSERT INTO atrybut_rodzaju_umowy VALUES (209, 302); -- nazwa banku
INSERT INTO atrybut_rodzaju_umowy VALUES (209, 303); -- nr konta
INSERT INTO atrybut_rodzaju_umowy VALUES (209, 323); -- Iloœæ sztuk dostarczonego towaru

commit;

-----------------



/* Tabela wartosc_atrybutu */


/* Kolejnoœæ atrybutów: ID_rodzaju, ID_umowy, ID_atrybutu, Wartoœæ (Opcja) */

/* Umowa przechowania */
INSERT INTO wartosc_atrybutu VALUES (201, 401, 304, 'Traktor Ursus'); -- przedmiot przechowania
INSERT INTO wartosc_atrybutu VALUES (201, 401, 305, 'ul. Dobra 64, 07-232 Warszawa'); -- adres przechowania

/* Umowa po¿yczki */
INSERT INTO wartosc_atrybutu VALUES (203, 402, 313, '450.00'); -- odsetki
INSERT INTO wartosc_atrybutu VALUES (203, 402, 302, 'Przyjazny Bank'); -- nazwa banku
INSERT INTO wartosc_atrybutu VALUES (203, 402, 303, '24 0987 0000 0000 1234 1234 0009'); -- nr konta

/* Umowa o roboty budowlane */
INSERT INTO wartosc_atrybutu VALUES (204, 403, 314,  'Drewniana altana'); -- obiekt do zbudowania
INSERT INTO wartosc_atrybutu VALUES (204, 403, 315, 'ul. Wielka 6, 05-245 Warszawa'); -- adres dzialki
INSERT INTO wartosc_atrybutu VALUES (204, 403, 301, '1500.00'); -- kara umowna

/* Umowa darowizny */
INSERT INTO wartosc_atrybutu VALUES (205, 404, 316, 'Szwajcarski zegarek'); -- przedmiot darowizny

/* Umowa najmu lokalu mieszkalnego */
INSERT INTO wartosc_atrybutu VALUES (206, 405, 317, 'ul. Marszalkowska 7, m. 50, 00-001 Warszawa'); -- adres mieszkania
INSERT INTO wartosc_atrybutu VALUES (206, 405, 318, '140 m^2'); -- powierzchnia u¿ytkowa

/* Umowa dzier¿awy */
INSERT INTO wartosc_atrybutu VALUES (208, 406, 322, 'Traktor Renault'); -- przedmiot dzier¿awy

/* Umowa dostawy */
INSERT INTO wartosc_atrybutu VALUES (209, 407, 323, '1000'); -- Iloœæ sztuk dostarczonego towaru

commit;

------------------------------------------------------------


