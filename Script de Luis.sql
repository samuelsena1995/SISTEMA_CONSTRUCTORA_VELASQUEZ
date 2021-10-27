select * from USUARIOS
create database BD_JAVIER_VASQUEZ
GO
use BD_JAVIER_VASQUEZ 
GO
CREATE TABLE USUARIOS(
Codigo int identity(1,1)primary key not null,
Nombre_Completo char(50),
Observacion char(240),
Contraseña char(100),
Usuario char(50),
Estado char(1)
)
go
create proc Usuario_Mostrar
as
select Codigo,
ltrim(rtrim(Nombre_Completo))as[Nombre],
ltrim(rtrim(Observacion))as[Observacion],
ltrim(rtrim(Usuario))as[Usuario],
case Estado
when 'H' then 'Habilitado'
when 'D' then 'Deshabilitado'
end as Estado
from USUARIOS
go
create proc Usuario_Registrar
@Nombre_Completo char(50),
@Observacion char(240),
@Contraseña char(100),
@Usuario char(50),
@Estado char(1)
as
insert into USUARIOS(Nombre_Completo,Observacion,Contraseña,Usuario,Estado)
values(ltrim(rtrim(@Nombre_Completo)),ltrim(rtrim(@Observacion)),ltrim(rtrim(@Contraseña)),ltrim(rtrim(@Usuario)),ltrim(rtrim(@Estado)))
go
select * from USUARIOS
go
alter proc Usuario_Id
@Id int
as
select Codigo,
ltrim(rtrim(Nombre_Completo))as[Nombre],
ltrim(rtrim(Observacion))as[Observacion],
ltrim(rtrim(Usuario))as[Usuario],
LTRIM(RTRIM(Contraseña))as[Contraseña],
case Estado
when 'H' then 'Habilitado'
when 'D' then 'Deshabilitado'
end as Estado
from USUARIOS
where Codigo=@Id
go
create proc Usuario_Editar
@Codigo int,
@Nombre_Completo char(50),
@Observacion char(240),
@Contraseña char(100),
@Usuario char(50)
as
update USUARIOS set Nombre_Completo=@Nombre_Completo,
Observacion=@Observacion, Contraseña=@Contraseña,Usuario=@Usuario
where Codigo=@Codigo
go
create proc Usuario_Cambio_Estado
@Codigo int,
@Estado char(1)
as
update USUARIOS set Estado=@Estado
where Codigo=@Codigo
go
create proc Usuario_Eliminar
@Codigo int
as
delete USUARIOS where Codigo=@Codigo

