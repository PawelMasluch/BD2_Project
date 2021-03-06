DROP TABLE atrybut_rodzaju_umowy CASCADE CONSTRAINTS;
DROP TABLE definicja_atrybutu CASCADE CONSTRAINTS;
DROP TABLE osoba_fizyczna CASCADE CONSTRAINTS;
DROP TABLE rodzaj_umowy CASCADE CONSTRAINTS;
DROP TABLE umowa_cywilnoprawna CASCADE CONSTRAINTS;
DROP TABLE wartosc_atrybutu CASCADE CONSTRAINTS;
DROP TABLE wykonawca CASCADE CONSTRAINTS;





CREATE TABLE atrybut_rodzaju_umowy (
    rodz_um_id_rodzaju    NUMBER(4) NOT NULL,
    def_atr_id_atrybutu   NUMBER(4) NOT NULL
);

CREATE INDEX atrybut_rodzaju_umowy__idx ON
    atrybut_rodzaju_umowy (
        def_atr_id_atrybutu
    ASC );

ALTER TABLE atrybut_rodzaju_umowy ADD CONSTRAINT atr_rodz_um_pk PRIMARY KEY ( rodz_um_id_rodzaju,
                                                                              def_atr_id_atrybutu );

CREATE TABLE definicja_atrybutu (
    id_atrybutu      NUMBER(4) NOT NULL,
    nazwa            VARCHAR2(100) NOT NULL,
    czy_opcjonalna   NUMBER(1) NOT NULL,
    typ_danych       CHAR(1) NOT NULL,
    opis             VARCHAR2(2000)
);

COMMENT ON COLUMN definicja_atrybutu.typ_danych IS
    '
';

ALTER TABLE definicja_atrybutu ADD constraint def_atr_typ_danych_ck CHECK ( typ_danych in('C', 'N', 'D'))
;


ALTER TABLE definicja_atrybutu add constraint def_atr_czy_opcjonalna_ck
check(czy_opcjonalna in(0, 1));

ALTER TABLE definicja_atrybutu ADD CONSTRAINT def_atr_pk PRIMARY KEY ( id_atrybutu );

ALTER TABLE definicja_atrybutu ADD CONSTRAINT def_atr_nazwa_un UNIQUE ( nazwa );

CREATE TABLE osoba_fizyczna (
    id_wykonawcy     NUMBER(4) NOT NULL,
    imie             VARCHAR2(50) NOT NULL,
    nazwisko         VARCHAR2(100) NOT NULL,
    pesel            CHAR(11),
    data_urodzenia   DATE NOT NULL
);

ALTER TABLE osoba_fizyczna ADD CONSTRAINT osoba_fizyczna_un UNIQUE ( id_wykonawcy );

CREATE TABLE rodzaj_umowy (
    id_rodzaju   NUMBER(4) NOT NULL,
    nazwa        VARCHAR2(100) NOT NULL,
    opis         VARCHAR2(2000)
);

ALTER TABLE rodzaj_umowy ADD CONSTRAINT rodz_um_pk PRIMARY KEY ( id_rodzaju );

ALTER TABLE rodzaj_umowy ADD CONSTRAINT rodz_um_nazwa_un UNIQUE ( nazwa );

CREATE TABLE umowa_cywilnoprawna (
    rodz_um_id_rodzaju    NUMBER(4) NOT NULL,
    os_fiz_id_wykonawcy   NUMBER(4) NOT NULL,
    id_umowy              NUMBER(4) NOT NULL,
    data_zawarcia         DATE NOT NULL,
    kwota                 NUMBER(9, 2) NOT NULL,
    poczatek_wykonania    DATE NOT NULL,
    koniec_wykonania      DATE NOT NULL,
    temat                 VARCHAR2(500) NOT NULL,
    nr_umowy              VARCHAR2(100) NOT NULL
);

ALTER TABLE umowa_cywilnoprawna ADD CONSTRAINT um_cywpraw_pk PRIMARY KEY ( rodz_um_id_rodzaju,
                                                                           id_umowy );

ALTER TABLE umowa_cywilnoprawna ADD CONSTRAINT um_cywpraw_un UNIQUE ( id_umowy );

ALTER TABLE umowa_cywilnoprawna ADD CONSTRAINT um_cywpraw__un UNIQUE ( os_fiz_id_wykonawcy );

CREATE TABLE wartosc_atrybutu (
    atr_rodz_um_id_rodzaju    NUMBER(4) NOT NULL,
    atr_rodz_um_id_atrybutu   NUMBER(4) NOT NULL,
    um_cywpraw_id_rodzaju     NUMBER(4) NOT NULL,
    um_cywpraw_id_umowy       NUMBER(4) NOT NULL,
    wartosc                   VARCHAR2(100),
    id_rodzaju                NUMBER(4) NOT NULL
);

CREATE INDEX wart_atr__idx ON
    wartosc_atrybutu (
        atr_rodz_um_id_atrybutu
    ASC );

CREATE INDEX wart_atr__idxv1 ON
    wartosc_atrybutu (
        um_cywpraw_id_rodzaju
    ASC );

CREATE INDEX wart_atr__idxv2 ON
    wartosc_atrybutu (
        um_cywpraw_id_umowy
    ASC );

ALTER TABLE wartosc_atrybutu ADD CONSTRAINT wart_atr_pk PRIMARY KEY ( atr_rodz_um_id_rodzaju,
                                                                      atr_rodz_um_id_atrybutu );

CREATE TABLE wykonawca ( nip CHAR(10), id_wykonawcy NUMBER(
4) NOT NULL, ulica VARCHAR2(100) NOT NULL, numer_domu VARCHAR2(5) NOT NULL, numer_mieszkania NUMBER(4), kod_pocztowy VARCHAR2(15)
NOT NULL, miejscowosc VARCHAR2(50) NOT NULL,
kraj VARCHAR2(30) NOT NULL );
ALTER TABLE wykonawca ADD CONSTRAINT wykonawca_pk PRIMARY KEY ( id_wykonawcy );

ALTER TABLE atrybut_rodzaju_umowy
    ADD CONSTRAINT atr_rodz_um_def_atr_fk FOREIGN KEY ( def_atr_id_atrybutu )
        REFERENCES definicja_atrybutu ( id_atrybutu );

ALTER TABLE atrybut_rodzaju_umowy
    ADD CONSTRAINT atr_rodz_um_rodz_um_fk FOREIGN KEY ( rodz_um_id_rodzaju )
        REFERENCES rodzaj_umowy ( id_rodzaju );

ALTER TABLE osoba_fizyczna
    ADD CONSTRAINT osoba_fizyczna_fk FOREIGN KEY ( id_wykonawcy )
        REFERENCES wykonawca ( id_wykonawcy );

ALTER TABLE umowa_cywilnoprawna
    ADD CONSTRAINT um_cywpraw_os_fiz_fk FOREIGN KEY ( os_fiz_id_wykonawcy )
        REFERENCES osoba_fizyczna ( id_wykonawcy );

ALTER TABLE umowa_cywilnoprawna
    ADD CONSTRAINT um_cywpraw_rodz_um_fk FOREIGN KEY ( rodz_um_id_rodzaju )
        REFERENCES rodzaj_umowy ( id_rodzaju );

ALTER TABLE wartosc_atrybutu
    ADD CONSTRAINT wart_atr_atr_rodz_um_fk FOREIGN KEY ( atr_rodz_um_id_rodzaju,
                                                         atr_rodz_um_id_atrybutu )
        REFERENCES atrybut_rodzaju_umowy ( rodz_um_id_rodzaju,
                                           def_atr_id_atrybutu );

ALTER TABLE wartosc_atrybutu
    ADD CONSTRAINT wart_atr_um_cywpraw_fk FOREIGN KEY ( um_cywpraw_id_rodzaju,
                                                        um_cywpraw_id_umowy )
        REFERENCES umowa_cywilnoprawna ( rodz_um_id_rodzaju,
                                         id_umowy )
            ON DELETE CASCADE;

CREATE OR REPLACE TRIGGER fkntm_atrybut_rodzaju_umowy BEFORE
    UPDATE OF rodz_um_id_rodzaju, def_atr_id_atrybutu ON atrybut_rodzaju_umowy
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table ATRYBUT_RODZAJU_UMOWY is violated');
END;
/

CREATE OR REPLACE TRIGGER fkntm_umowa_cywilnoprawna BEFORE
    UPDATE OF os_fiz_id_wykonawcy, rodz_um_id_rodzaju ON umowa_cywilnoprawna
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table UMOWA_CYWILNOPRAWNA is violated');
END;
/

CREATE OR REPLACE TRIGGER fkntm_wartosc_atrybutu BEFORE
    UPDATE OF um_cywpraw_id_rodzaju, um_cywpraw_id_umowy, atr_rodz_um_id_rodzaju, atr_rodz_um_id_atrybutu ON wartosc_atrybutu
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table WARTOSC_ATRYBUTU is violated');
END;
/
