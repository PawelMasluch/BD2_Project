set echo on
set linesize 300
set pagesize 500
spool BD2A31_TEST.LIS



--------------------------------



select imie, nazwisko, data_zawarcia, temat
from wykonawca join umowa_cywilnoprawna using (id_wykonawcy) 
where NIP is not null 
order by ulica desc;

-------

select imie, nazwisko, NIP, data_urodzenia 
from wykonawca 
where imie like 'J%';

-------

select * 
from rodzaj_umowy
where nazwa like 'Nazwa%' or nazwa like '%lokalu%';

-------

select * 
from definicja_atrybutu
where nazwa like 'Nr%'
order by id_atrybutu desc;

-------
select * 
from definicja_atrybutu 
where nazwa LIKE 'P%' 
order by id_atrybutu asc;

-------

select nr_umowy, data_zawarcia, poczatek_wykonania, temat 
from umowa_cywilnoprawna
where (kwota > 1000 and kwota < 5000) or extract(year from poczatek_wykonania) < 2008
order by data_zawarcia;

-------

select * 
from wartosc_atrybutu 
where id_umowy = 300;

-------

select id_rodzaju, count(*) as ile_atrybutow_charakterystycznych
from atrybut_rodzaju_umowy 
group by id_rodzaju 
having count(*) > 4 
order by 2 asc, 1 asc;

-------

select rodz_umowy.nazwa as nazwa_umowy, def_atr.nazwa as nazwa_atrybutu
from rodzaj_umowy rodz_umowy join atrybut_rodzaju_umowy atr_rodz_umowy using (id_rodzaju) join definicja_atrybutu def_atr using (id_atrybutu)
where rodz_umowy.nazwa like '%da%';

-------

select distinct id_atrybutu, id_umowy as ID_UMOWY, umowa_cywpraw.nr_umowy as NR_UMOWY, umowa_cywpraw.data_zawarcia as DATA_ZAWARCIA, umowa_cywpraw.temat as TEMAT_UMOWY, def_atr.nazwa as NAZWA_ATRYBUTU, wart_atr.wartosc as WARTOSC_ATRYBUTU
from umowa_cywilnoprawna umowa_cywpraw join wartosc_atrybutu wart_atr using (id_umowy) join atrybut_rodzaju_umowy atr_rodz_umowy using (id_atrybutu) join definicja_atrybutu def_atr using (id_atrybutu)
order by id_umowy asc, id_atrybutu asc;

-------

select id_wykonawcy, count(*) as ile_umow
from wykonawca join umowa_cywilnoprawna using (id_wykonawcy)
group by id_wykonawcy;


------------------------------------



spool off

















































































