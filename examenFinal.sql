-- creación de base de datos --
DROP DATABASE dbConferenceVG;
create database dbConferenceVG;

-- poner en uso la base de datos --
use dbConferenceVG;

-- creacion de tablas --
CREATE TABLE PARTICIPANTE (

    IDPAR int auto_increment,
    FECREGPAR date,	
    NOMPAR varchar(60),
    APEPAR varchar(80),
    DNIPAR char(8),
    TIPPAR char(1),
    CELPAR char(9),
    EMAPAR varchar(90),
    DIRPAR varchar(90),
    ESTPAR char(1),
    CONSTRAINT PARTICIPANTE_pk PRIMARY KEY (IDPAR)
);


CREATE TABLE PONENTE (

    CODPON char(5),
    NOMPON varchar(60),	
    APEPON varchar(80),
    CELPON char(9),
    DNIPON char(8),
    EMAPON varchar(90),
    DIRPON varchar(90),
    CONSTRAINT PONENTE_pk PRIMARY KEY (CODPON)
);

CREATE TABLE CONFERENCIA (

    CODCONF char(5),
    TEMCONF varchar(90),	
    FECCONF date,
    PONCONF char(5),
    CONSTRAINT CONFERENCIA_pk PRIMARY KEY (CODCONF)
);

CREATE TABLE REGISTRO (

    CODREG char(5),
    CODPAR int,	
    FECREG date,
    CERTREG char(1),	
    CONSTRAINT REGISTRO_pk PRIMARY KEY (CODREG)
);


CREATE TABLE REGISTRO_DETALLE (

    IDREGDET int auto_increment,
    CODREG char(5),	
    CODCONF char(5),
    CANTPART char(1),	
    CONSTRAINT REGISTRO_DETALLE_pk PRIMARY KEY (IDREGDET)
);


-- relaciones --



-- Reference: PARTICIPANTE_REGISTRO (table: CONDUCTOR)
ALTER TABLE REGISTRO 
ADD CONSTRAINT REGISTRO FOREIGN KEY PARTICIPANTE (IDPAR)
    REFERENCES PARTICIPANTE (IDPAR);
    
    
    
    
    
    
    
    
    
    -- Reference: CONDUCTOR_UBIGEO (table: CONDUCTOR)
ALTER TABLE CONDUCTOR
 ADD CONSTRAINT CONDUCTOR FOREIGN KEY CONDUCTOR_UBIGEO (CODUBI)
    REFERENCES UBIGEO (CODUBI);












-- inserción de datos--

Insert into PARTICIPANTE
		(NOMPAR,APEPAR,DNIPAR,TIPPAR,CELPAR,EMAPAR,DIRPAR,ESTPAR)
	values
         ('Juan','Campos Pérez','40255133','1','986512478','juan.campos@vallegrande.edu.pe','Av.Miraflores','A'),
         ('Sofia','Solano Ávila','64978531','1','974815258','sofia.ávila@vallegrande.edu.pe','Jr. Huallaga','A'),
         ('Maria','Rosales Guerra','15925874','1','986532147','maria.rosales@vallegrande.edu.pe','Calle Girasoles','A'),
         ('Marcos','Alarcón Hermosa','48781512','2','','marcos.alarcón@vallegrande.edu.pe','','A'),
         ('Martin','Samán Arata','84152631','2','','martin.samán@vallegrande.edu.pe','Jr. La Unión','A'),
         ('Jose','Quispe Luyo','48161937','2','978415321','jose.quispe@vallegrande.edu.pe','Calle Abancay','A'),
         ('Claudia','Barraza Carrasco','78452596','3','','cbarraza@gmail.com','Jr. Las Gardenias','A'),
         ('Jhohana','Bendezú Anccasi','74321564','3','','jbendezu@yahoo.com','','A'),
         ('Mario','Acosta Palomino','15326499','3','931764521','mario.acosta@outlook.com','Av. Miraflores','A');
select * from PARTICIPANTE;


Insert into PONENTE
		(CODPON,NOMPON,APEPON,CELPON,DNIPON,EMAPON,DIRPON)
	values
         ('P0001','Alberto','Corrales Lozada','','15263798','alberto.corrales@yahoo.com','Calle Los Portales'),
         ('P0002','Juana','Sánchez Ortega','974815258','13256497','Juana.sanchez@outlook.com','Av. La Libertad'),
         ('P0003','Javier','Nakasone Vila','995236147','15953575','Javier.nakasone@gmail.com','Jr. San Martín'),
         ('P0004','Sonia','Huayta Medina','','12657814','Sonia.huayta@gmail.com','Av. Las Guardenias'),
         ('P0005','Fabiano','Carrión Ávila','','12233647','','Jr. Huancayo');
select * from PONENTE;



Insert into CONFERENCIA
		(CODCONF,TEMCONF,FECCONF,PONCONF)
	values
         ('C0001','Gestión de datos con MySQL','15-7-2022','','P0001'),
         ('C0002','Gestión de datos con MySQL','16-7-2022','','P0002'),
         ('C0003','Gestión de datos con MySQL','17-7-2022','','P0003'),
         ('C0004','Gestión de datos con MySQL','16-7-2022','','P0002'),
         ('C0005','Gestión de datos con MySQL','15-7-2022','','P0004');
select * from CONFERENCIA;



Insert into REGISTRO
		(CODREG,CODPAR,CERTREG)
	values
         ('R0001','1','S'),
         ('R0002','3','S'),
         ('R0003','4','S'),
         ('R0004','7','S'),
         ('R0005','2','N'),
         ('R0006','5','N'),
         ('R0007','6','N'),
         ('R0008','9','N');
select * from REGISTRO;



Insert into REGISTRO_DETALLE
		(IDREGDET,CODREG,CODCONF,CANTPART)
	values
         ('1','R0001','C0001','2'),
         ('2','R0001','C0002','1'),
         ('3','R0002','C0001','4'),
         ('4','R0002','C0003','1'),
         ('5','R0003','C0004','1'),
         ('6','R0004','C0005','2'),
         ('7','R0005','C0005','3'),
         ('8','R0005','C0003','2'),
         ('9','R0006','C0002','3'),
         ('10','R0006','C0003','4'),
         ('11','R0007','C0005','2'),
         ('12','R0007','C0003','6'),
         ('13','R0008','C0005','1');

select * from REGISTRO_DETALLE;















