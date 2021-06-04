select * from wykonawca join umowa_cywilnoprawna using (id_wykonawcy) where NIP is not null order by ulica desc;

select * from wykonawca where imie like 'J%';

select * from rodzaj_umowy;

select * from definicja_atrybutu;

select * from definicja_atrybutu where nazwa LIKE 'P%' order by id_atrybutu asc;

select * from umowa_cywilnoprawna;

select * from wartosc_atrybutu where id_umowy = 401;

select id_rodzaju, count(*) as ile_atrybutow_charakterystycznych from atrybut_rodzaju_umowy group by id_rodzaju having count(*) > 1 order by 2 asc, 1 asc;