-- gestione amministratore

create table admin(
id_admin int,
username varchar2(500) not null,
password varchar2(30) not null,
constraint p_admin primary key(id_admin));

-- gestione corsi, corsisti

create table docente(
id_docente int,
nome_docente varchar2(30) not null,
cognome_docente varchar2(30) not null,
cv_docente varchar2(50) not null,
constraint p_docente primary key(id_docente));

create table corso(
id_corso int,
nome_corso varchar2(30) not null,
data_inizio_corso date not null,
data_fine_corso date not null,
costo_corso number(9,2) not null,
commenti_corso varchar2(200),
aula_corso varchar2(30) not null,
id_docente int,
constraint p_corso primary key(id_corso),
constraint f_iddocente foreign key(id_docente) references docente(id_docente) on delete cascade);

create table corsista(
id_corsista int,
nome_corsita varchar2(30) not null,
cognome_corsita varchar2(30) not null,
precedenti_formativi number(1),
constraint p_corsista primary key(id_corsista));

create table corso_corsista(
id_corso int,
id_corsista int,
constraint p_cc primary key (id_corso,id_corsista),
constraint f_idCorso foreign key(id_corso) references corso(id_corso) on delete cascade,
constraint f_idCorsista foreign key(id_corsista) references corsista(id_corsista) on delete cascade);

-- gestione sequenze

create sequence corsista_seq;
