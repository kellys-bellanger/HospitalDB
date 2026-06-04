use master
GO

Alter database HospitalDB set single_user with rollback immediate
GO

Drop database if exists HospitalDB --Si existe la base de datos Hospital, se eliminara.
GO

create database HospitalDB --Creacion de la base de datos.
GO

use HospitalDB
GO

--Creamos los schemas
Create schema Personal
GO

Create schema Pacientes
GO

Create schema Atencion
GO

--Creacion de las tablas 
Create table Pacientes.Pacientes
(
	IdPaciente int identity(1,1) primary key,
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Email varchar(50) not null,
	FechaNacimiento date not null,
	Genero char(1) not null
)
GO

Create table Personal.Medicos
(
	IdMedico int identity(1,1),
	Nombre nvarchar(50) not null,
	Apellido nvarchar(50) not null,
	Especialidad nvarchar(50) not null,
	Email varchar(50) not null,
	Edad int not null,
)
GO

Create table Personal.Especialidades
(
	IdEspecialidad int identity(1,1) primary key,
	Nombre nvarchar(50) not null
)
GO

Create table Atencion.Citas
(
	IdCita int identity(1,1) primary key,
	IdPaciente int not null,
	IdMedico int not null,
	FechaCita datetime not null,
	Descripcion nvarchar(255) null,
	Foreign key (IdPaciente) references Pacientes.Pacientes(IdPaciente),
	Foreign key (IdMedico) references Personal.Medicos(IdMedico)
)
GO

Create table Atencion.Habitaciones
(
	IdHabitacion int identity(1,1),
	NumeroHabitacion int not null,
	TipoHabitacion nvarchar(50) not null,
	Estado varchar(20) not null
)
GO

Create table Atencion.Tratamientos
(
	IdTratamiento int identity(1,1) primary key,
	IdPaciente int not null,
	IdMedico int not null,
	Descripcion nvarchar(255) not null,
	FechaInicio datetime not null,
	FechaFin datetime null,
	Foreign key (IdPaciente) references Pacientes.Pacientes(IdPaciente),
	Foreign key (IdMedico) references Personal.Medicos(IdMedico)
)
GO

Create table Atencion.Medicamentos 
(
	IdMedicamento int identity(1,1),
	Nombre nvarchar(50) not null,
	Dosis varchar(20) not null,
	Frecuencia varchar(20) not null
)



