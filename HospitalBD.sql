--Modulo I
use master
GO

Alter database HospitalDB set single_user with rollback immediate
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
	IdPaciente int identity(1,1),
	Nombre nvarchar(50) not null,
	Apellido nvarchar(50) not null,
	Email nvarchar(50) not null,
	FechaNacimiento date not null,
	Edad int not null,
	Genero char(1) not null,
	FechaRegistro datetime not null default getdate(),

	Constraint PK_Pacientes_Pacientes_IdPaciente primary key (IdPaciente)
	Constraint UQ_Pacientes_Pacientes_Email unique (Email)
	Constraint CHK_Pacientes_Pacientes_Edad check (Edad >= 0 and Edad <= 120)
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
	Salario decimal(18,2) not null,

	Constraint PK_Personal_Medicos_IdMedico primary key (IdMedico)
	Constraint UQ_Personal_Medicos_Email unique (Email)
	Constraint CHK_Personal_Medicos_Salario check (Salario >= 0)
	Constraint FK_Personal_Medicos_Especialidad foreign key (Especialidad) references Personal.Especialidades(Nombre)
)
GO

Create table Personal.Especialidades
(
	IdEspecialidad int identity(1,1),
	Nombre nvarchar(50) not null

	Constraint PK_Personal_Especialidades_IdEspecialidad primary key (IdEspecialidad)
)
GO

Create table Atencion.Citas
(
	IdCita int identity(1,1) primary key,
	IdPaciente int not null,
	IdMedico int not null,
	FechaCita datetime not null,
	Descripcion nvarchar(255) null,

	Constraint PK_Atencion_Citas_IdCita primary key (IdCita),
	Constraint FK_Atencion_Citas_IdPaciente foreign key (IdPaciente) references Pacientes.Pacientes(IdPaciente),
	Constraint FK_Atencion_Citas_IdMedico foreign key (IdMedico) references Personal.Medicos(IdMedico)
)
GO

Create table Atencion.Habitaciones
(
	IdHabitacion int identity(1,1),
	NumeroHabitacion int not null,
	TipoHabitacion nvarchar(50) not null,
	Estado varchar(20) not null

	Constraint PK_Atencion_Habitaciones_IdHabitacion primary key (IdHabitacion),
	Constraint FK_Atencion_Habitaciones_IdPaciente foreign key (IdPaciente) references Pacientes.Pacientes(IdPaciente)
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

	Constraint PK_Atencion_Tratamientos_IdTratamiento primary key (IdTratamiento),
	Constraint FK_Atencion_Tratamientos_IdPaciente foreign key (IdPaciente) references Pacientes.Pacientes(IdPaciente),
	)
GO

Create table Atencion.Medicamentos 
(
	IdMedicamento int identity(1,1),
	Nombre nvarchar(50) not null,
	Dosis varchar(20) not null,
	Frecuencia varchar(20) not null

	Constraint PK_Atencion_Medicamentos_IdMedicamento primary key (IdMedicamento),
	Constraint FK_Atencion_Medicamentos_IdTratamiento foreign key (IdTratamiento) references Atencion.Tratamientos(IdTratamiento)
)
GO

/*
Modulo II
Agrego las restricciones.
*/


