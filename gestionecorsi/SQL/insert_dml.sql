-- admin
insert into admin values(1, 'admin', 'Pass01$');

-- gestionale
insert into docente values(1, 'Mario', 'Rossi');
insert into docente values(2, 'Sergio', 'Verdi');

insert into corso values(1, 'Algebra', '12-GEN-2021', '12-MAR-2021', 1000, 'Interessante, impegnativo', 'Aula A', 1);
insert into corso values(2, 'Trigonometria', '12-MAR-2021', '12-APR-2021', 500, 'Difficile, poco strutturato', 'Aula B', 2);
insert into corso values(3, 'Geometria', '1-MAR-2021', '24-APR-2021', 700, 'Interessante, poco strutturato', 'Aula A', 1);

insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Rita', 'Viola', 0);
insert into corsista values(corsista_seq.nextval, 'Ciro', 'Rossi', 1);
insert into corsista values(corsista_seq.nextval, 'Aldo', 'Blu', 0);
insert into corsista values(corsista_seq.nextval, 'Gloria', 'Rossi', 0);
insert into corsista values(corsista_seq.nextval, 'Gino', 'Blu', 0);
