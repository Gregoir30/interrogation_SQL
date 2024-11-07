Drop table etablissement;
drop table prof;
drop table niveau;
drop table eleve;
drop table exercice;
drop table devoir;
drop table notion;
drop table contenu;
drop table passage;

create table ETABLISSEMENT(		RNE varchar2(8), 
								NOM varchar2(50) not null, 
								LOCALITE varchar2(30),
								constraint cp_etab Primary Key (RNE));

create table PROF(				IDP integer not null, 
								NOM varchar2(20) not null, 
								ANNEE_NAISSANCE integer,
								RNE varchar2(8),
								VILLE varchar2(30),
								constraint cp_prof Primary Key (IDP),
								constraint ce_prof FOREIGN KEY (RNE) REFERENCES ETABLISSEMENT(RNE));

create table NIVEAU(			NIVEAU varchar2(4), 
								constraint cp_niveau Primary Key (NIVEAU),
								constraint chk_niveau check (niveau in ('6eme', '5eme', '4eme','3eme')));

create table ELEVE(				IDEL integer not null, 
								NOM varchar2(50) not null, 
								PRENOM varchar2(30),
								COLLEGE varchar2(8),
								NIVEAU varchar2(4),
								constraint cp_eleve Primary Key (IDEL),
								constraint ce1_eleve FOREIGN KEY (COLLEGE) REFERENCES ETABLISSEMENT(RNE),
								constraint ce2_eleve FOREIGN KEY (NIVEAU) REFERENCES NIVEAU(NIVEAU));

create table EXERCICE(			IDEX integer not null, 
								CONTENU varchar2(250), 
								NIVEAU varchar2(4), 
								PROPRIETAIRE integer, 
								DATE_CREATION date,
								constraint cp_exercice primary key (IDEX),
								constraint ce1_exercice FOREIGN KEY (NIVEAU) REFERENCES NIVEAU(NIVEAU),
								constraint ce2_exercice FOREIGN KEY (PROPRIETAIRE) REFERENCES PROF(IDP));

create table DEVOIR(			IDD integer not null, 
								DATE_CREATION date, 
								PROF_CREATEUR integer not null, 
								NIVEAU varchar2(4),
								constraint cp_devoir primary key (IDD),
								constraint ce1_devoir FOREIGN KEY (PROF_CREATEUR) REFERENCES PROF(IDP),
								constraint ce2_devoir FOREIGN KEY (NIVEAU) REFERENCES NIVEAU(NIVEAU));

create table NOTION(			IDEXO integer, 
								NOTION varchar2(20),
								constraint cp_notion primary key (IDEXO));


create table CONTENU(			IDD integer,
								IDEX integer,
								BAREME real,
								constraint cp_contenu primary key (IDD,IDEX));

create table PASSAGE(			IDD integer,
								IDEL integer,
								DATE_PASSAGE date,
								NOTE integer,
								constraint cp_passage primary key (IDD,IDEL,DATE_PASSAGE));

 