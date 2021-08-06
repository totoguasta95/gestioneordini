-- admin
insert into admin values(1, 'admin', 'b0Er93%d£xW4a1plVmz%2Pa3Lx$#2Er93%d£xW4a1plVmz%2Pa3Lx$#43Er93%d£xW4a1plVmz%2Pa3Lx$#bEr93%d£xW4a1plVmz%2Pa3Lx$#abEr93%d£xW4a1plVmz%2Pa3Lx$#fEr93%d£xW4a1plVmz%2Pa3Lx$#b3Er93%d£xW4a1plVmz%2Pa3Lx$#96Er93%d£xW4a1plVmz%2Pa3Lx$#6dEr93%d£xW4a1plVmz%2Pa3Lx$#e2Er93%d£xW4a1plVmz%2Pa3Lx$#99Er93%d£xW4a1plVmz%2Pa3Lx$#89Er93%d£xW4a1plVmz%2Pa3Lx$#3Er93%d£xW4a1plVmz%2Pa3Lx$#76Er93%d£xW4a1plVmz%2Pa3Lx$#2Er93%d£xW4a1plVmz%2Pa3Lx$#9Er93%d£xW4a1plVmz%2Pa3Lx$#');

-- gestionale
insert into docente values(1, 'Mario', 'Rossi', '/cv/mr.pdf');
insert into docente values(2, 'Sergio', 'Verdi', '/cv/sv.pdf');

insert into corso values(1, 'Algebra', '12-GEN-2021', '12-MAR-2021', 1000, 'Interessante, impegnativo', 'Aula A', 1);
insert into corso values(2, 'Trigonometria', '12-MAR-2021', '12-APR-2021', 500, 'Difficile, poco strutturato', 'Aula B', 2);
insert into corso values(3, 'Geometria', '1-MAR-2021', '24-APR-2021', 700, 'Interessante, poco strutturato', 'Aula A', 1);
insert into corso values(4, 'JAVA', '12-AGO-2021', '24-APR-2022', 800, 'Interessante, poco strutturato', 'Aula A5', 2);

insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Rita', 'Viola', 0);
insert into corsista values(corsista_seq.nextval, 'Ciro', 'Rossi', 1);
insert into corsista values(corsista_seq.nextval, 'Aldo', 'Blu', 0);
insert into corsista values(corsista_seq.nextval, 'Gloria', 'Rossi', 0);
insert into corsista values(corsista_seq.nextval, 'Gino', 'Blu', 0);

insert into corso_corsista values(1,1);
insert into corso_corsista values(1,2);
insert into corso_corsista values(1,3);
insert into corso_corsista values(2,1);
insert into corso_corsista values(2,4);
insert into corso_corsista values(2,5);
insert into corso_corsista values(3,4);
insert into corso_corsista values(3,3);
insert into corso_corsista values(3,6);

-- gestionale corso completo
insert into corso values(5, 'SQL', '12-SET-2021', '24-Nov-2021', 2000, 'Interessante, poco strutturato', 'Aula A5', 2);

insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Anna', 'Neri', 0);
insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Anna', 'Neri', 0);
insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Anna', 'Neri', 0);
insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Anna', 'Neri', 0);
insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Anna', 'Neri', 0);
insert into corsista values(corsista_seq.nextval, 'Marco', 'Neri', 1);
insert into corsista values(corsista_seq.nextval, 'Anna', 'Neri', 0);

insert into corso_corsista values(5,7);
insert into corso_corsista values(5,8);
insert into corso_corsista values(5,9);
insert into corso_corsista values(5,10);
insert into corso_corsista values(5,11);
insert into corso_corsista values(5,12);
insert into corso_corsista values(5,13);
insert into corso_corsista values(5,14);
insert into corso_corsista values(5,15);
insert into corso_corsista values(5,16);
insert into corso_corsista values(5,17);
insert into corso_corsista values(5,18);



