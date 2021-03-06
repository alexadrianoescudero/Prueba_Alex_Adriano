USE [master]
GO
/****** Object:  Database [AdrianoBase]    Script Date: 24/4/2022 22:27:33 ******/
CREATE DATABASE [AdrianoBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdrianoBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdrianoBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdrianoBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdrianoBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdrianoBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdrianoBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdrianoBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdrianoBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdrianoBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdrianoBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdrianoBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdrianoBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdrianoBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdrianoBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdrianoBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdrianoBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdrianoBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdrianoBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdrianoBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdrianoBase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AdrianoBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdrianoBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdrianoBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdrianoBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdrianoBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdrianoBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdrianoBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdrianoBase] SET RECOVERY FULL 
GO
ALTER DATABASE [AdrianoBase] SET  MULTI_USER 
GO
ALTER DATABASE [AdrianoBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdrianoBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdrianoBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdrianoBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdrianoBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdrianoBase', N'ON'
GO
ALTER DATABASE [AdrianoBase] SET QUERY_STORE = OFF
GO
USE [AdrianoBase]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 24/4/2022 22:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cl_id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[cl_identificacion] [varchar](30) NOT NULL,
	[cl_contrasenia] [varchar](30) NOT NULL,
	[cl_estado] [bit] NOT NULL,
	[cl_nombre] [varchar](30) NOT NULL,
	[cl_genero] [varchar](30) NOT NULL,
	[cl_edad] [int] NOT NULL,
	[cl_direccion] [varchar](50) NULL,
	[cl_telefono] [varchar](20) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[cl_id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuentas]    Script Date: 24/4/2022 22:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuentas](
	[cu_numero_cuenta] [varchar](30) NOT NULL,
	[cu_id_cliente] [int] NOT NULL,
	[cu_tipo] [varchar](30) NOT NULL,
	[cu_estado] [bit] NOT NULL,
 CONSTRAINT [PK__cuentas__5138EEC71FAE4CF6] PRIMARY KEY CLUSTERED 
(
	[cu_numero_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[movimientos]    Script Date: 24/4/2022 22:27:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimientos](
	[mo_id_movimiento] [int] IDENTITY(1,1) NOT NULL,
	[mo_numero_cuenta] [varchar](30) NOT NULL,
	[mo_fecha] [datetime] NOT NULL,
	[mo_tipo_movimiento] [varchar](30) NOT NULL,
	[mo_saldo_inicial] [money] NOT NULL,
	[mo_movimiento] [money] NOT NULL,
	[mo_saldo_disponible] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mo_id_movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([cl_id_cliente], [cl_identificacion], [cl_contrasenia], [cl_estado], [cl_nombre], [cl_genero], [cl_edad], [cl_direccion], [cl_telefono]) VALUES (1, N'0604434571', N'1234', 1, N'Jose Lema', N'Masculino', 27, N'Amazonas y Otavalo sn y principal', N'098254785')
GO
INSERT [dbo].[cliente] ([cl_id_cliente], [cl_identificacion], [cl_contrasenia], [cl_estado], [cl_nombre], [cl_genero], [cl_edad], [cl_direccion], [cl_telefono]) VALUES (2, N'1721213131', N'5678', 1, N'Marianela Montalvo', N'Masculino', 20, N'Amazonas y NNUU', N'097548965')
GO
INSERT [dbo].[cliente] ([cl_id_cliente], [cl_identificacion], [cl_contrasenia], [cl_estado], [cl_nombre], [cl_genero], [cl_edad], [cl_direccion], [cl_telefono]) VALUES (3, N'1724563789', N'1245', 1, N'Juan Osorio', N'Masculino', 35, N'13 junio y Equinoccial', N'098874587')
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
INSERT [dbo].[cuentas] ([cu_numero_cuenta], [cu_id_cliente], [cu_tipo], [cu_estado]) VALUES (N'225487', 2, N'Corriente', 1)
GO
INSERT [dbo].[cuentas] ([cu_numero_cuenta], [cu_id_cliente], [cu_tipo], [cu_estado]) VALUES (N'478758', 1, N'Ahorro', 1)
GO
INSERT [dbo].[cuentas] ([cu_numero_cuenta], [cu_id_cliente], [cu_tipo], [cu_estado]) VALUES (N'495878', 3, N'Ahorros', 1)
GO
INSERT [dbo].[cuentas] ([cu_numero_cuenta], [cu_id_cliente], [cu_tipo], [cu_estado]) VALUES (N'496825', 2, N'Ahorros', 1)
GO
SET IDENTITY_INSERT [dbo].[movimientos] ON 
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (1, N'478758', CAST(N'2022-04-24T16:12:15.967' AS DateTime), N'Retiro', 2000.0000, -575.0000, 1425.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (2, N'225487', CAST(N'2022-04-24T16:12:15.967' AS DateTime), N'Deposito', 100.0000, 600.0000, 700.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (3, N'495878', CAST(N'2022-04-24T16:12:15.967' AS DateTime), N'Deposito', 0.0000, 150.0000, 150.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (4, N'496825', CAST(N'2022-04-24T16:12:15.967' AS DateTime), N'Deposito', 540.0000, 540.0000, 0.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (13, N'478758', CAST(N'2022-04-24T13:40:43.167' AS DateTime), N'Retiro', 1425.0000, -400.0000, 1025.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (14, N'478758', CAST(N'2022-04-24T13:52:28.857' AS DateTime), N'Retiro', 1425.0000, -10.0000, 1415.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (15, N'478758', CAST(N'2022-04-24T14:09:37.817' AS DateTime), N'Retiro', 1425.0000, -10.0000, 1415.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (16, N'478758', CAST(N'2022-04-24T14:21:26.307' AS DateTime), N'Retiro', 1425.0000, -1.0000, 1424.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (17, N'225487', CAST(N'2022-04-24T14:24:20.303' AS DateTime), N'Retiro', 700.0000, -40.0000, 740.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (18, N'225487', CAST(N'2022-04-24T14:28:48.073' AS DateTime), N'Deposito', 700.0000, 600.0000, 1300.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (19, N'225487', CAST(N'2022-04-24T14:29:09.407' AS DateTime), N'Retiro', 700.0000, -40.0000, 740.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (20, N'225487', CAST(N'2022-04-24T14:31:42.293' AS DateTime), N'Retiro', 700.0000, -40.0000, 660.0000)
GO
INSERT [dbo].[movimientos] ([mo_id_movimiento], [mo_numero_cuenta], [mo_fecha], [mo_tipo_movimiento], [mo_saldo_inicial], [mo_movimiento], [mo_saldo_disponible]) VALUES (21, N'495878', CAST(N'2022-04-24T14:33:19.227' AS DateTime), N'Deposito', 150.0000, 150.0000, 300.0000)
GO
SET IDENTITY_INSERT [dbo].[movimientos] OFF
GO
ALTER TABLE [dbo].[cuentas]  WITH CHECK ADD  CONSTRAINT [FK_cuentas_cuentas] FOREIGN KEY([cu_id_cliente])
REFERENCES [dbo].[cliente] ([cl_id_cliente])
GO
ALTER TABLE [dbo].[cuentas] CHECK CONSTRAINT [FK_cuentas_cuentas]
GO
ALTER TABLE [dbo].[movimientos]  WITH CHECK ADD  CONSTRAINT [FK_movimientos_cuentas] FOREIGN KEY([mo_numero_cuenta])
REFERENCES [dbo].[cuentas] ([cu_numero_cuenta])
GO
ALTER TABLE [dbo].[movimientos] CHECK CONSTRAINT [FK_movimientos_cuentas]
GO
USE [master]
GO
ALTER DATABASE [AdrianoBase] SET  READ_WRITE 
GO
