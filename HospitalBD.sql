use master
GO

Alter database HospitalDB set single_user with rollback immediate
GO

Drop database if exists HospitalDB --Si existe la base de datos Hospital, se eliminara.
GO

create database HospitalDB --Creacion de la base de datos.
GO
