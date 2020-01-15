if object_id('[dbo].[USP_SSF_DemoTable]') is not null
    drop procedure [dbo].[USP_SSF_DemoTable];

go
set quoted_identifier on;
go
set ansi_nulls on;
go
create procedure [dbo].[USP_SSF_DemoTable]
as
begin
    select *
    from dbo.demotable;
end;
go
