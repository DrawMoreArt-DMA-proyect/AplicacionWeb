use dmadatabase;
go
create table Sexos(
	IdSexo int identity(1,1) primary key,
	sexo varchar(15) not null
);
drop table Sexos;

create table RedesSociales(
	IdRedSocial int identity(1,1) primary key,
	Link varchar(500),
	IdTipoRedSocial int,
	IdUsuario int,
	CONSTRAINT fk_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuarios (IdUsuario),
	CONSTRAINT fk_TipoRedSocial FOREIGN KEY (IdTipoRedSocial) REFERENCES TipoRedesSociales (IdTipoRedSocial)
);

create table TipoRedesSociales(
	IdTipoRedSocial int primary key not null,
	TipoRedSocial varchar(20) not null
);

insert into TipoRedesSociales values(1,'Facebook');
insert into TipoRedesSociales values(2,'Twitter');


create table Usuarios(
	IdUsuario int identity(1,1) primary key,
	UsuarioNombre varchar(20) not null unique,
	CorreoElectronico varchar(50) not null,
	Contrasena varchar(100) not null,	
	NombrePersona varchar(15),
	ApellidoPaterno varchar(15),
	ApellidoMaterno varchar(15),
	FechaDeNacimiento varchar(30),
	Presentacion varchar(500),
	ImagenPerfil varchar(500),
	IdSexo int,
	CONSTRAINT fk_Sexo FOREIGN KEY (IdSexo) REFERENCES Sexos (IdSexo)
);
ALTER TABLE Usuarios drop column token;

drop table Usuarios;

select * from Usuarios;

ALTER TABLE Usuarios
ADD ImagenPerfil varchar(500);

create table ElementosGuardados(
	IdElementoGuardado int identity(1,1) primary key,
	IdUsuario int,
	IdPost int,
	CONSTRAINT fk_Usuario_Elemento_Guardado FOREIGN KEY (IdUsuario) REFERENCES Usuarios (IdUsuario),
	CONSTRAINT fk_Post FOREIGN KEY (IdPost) REFERENCES Posts (IdPost)
);

create table Posts(
	IdPost int identity(1,1) primary key,
	Titulo varchar(50) not null,
	Descripcion varchar(500) not null,
	MeGusta int,
	Imagen varchar(500) not null,
	IdGenero int,
	IdUsuario int,
	CONSTRAINT fk_Genero FOREIGN KEY (IdGenero) REFERENCES Generos (IdGenero),
	CONSTRAINT fk_Usuario_Post FOREIGN KEY (IdUsuario) REFERENCES Usuarios (IdUsuario)
);
ALTER TABLE Posts
ADD CONSTRAINT fk_Usuario_Post FOREIGN KEY (IdUsuario) REFERENCES Usuarios (IdUsuario);


create table Generos(
	IdGenero int identity(1,1) primary key,
	Genero varchar(100) not null,
	Descripcion varchar(500) not null
);

select * from Generos;

delete from Usuarios where IdUsuario = 1;


