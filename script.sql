USE [eBilling]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08/23/2017 00:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[BillId] [uniqueidentifier] NOT NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 08/23/2017 00:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Mobile] [int] NULL,
	[Address] [nvarchar](50) NOT NULL,
	[AadharNumber] [int] NULL,
	[TinNumber] [nvarchar](20) NULL,
	[GstNumber] [nvarchar](20) NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 08/23/2017 00:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[AadharNumber] [bigint] NULL,
	[TinNumber] [nvarchar](20) NULL,
	[GstNumber] [nvarchar](20) NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 08/23/2017 00:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Cgst] [decimal](18, 2) NULL,
	[Sgst] [decimal](18, 2) NULL,
	[Vat] [decimal](18, 2) NULL,
	[Date] [datetime] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Paid] [decimal](18, 2) NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedAt] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 08/23/2017 00:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](10) NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/23/2017 00:58:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Mrp] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[RetailerPrice] [decimal](18, 2) NULL,
	[Quantity] [decimal](18, 4) NOT NULL,
	[UnitId] [uniqueidentifier] NOT NULL,
	[Stock] [decimal](18, 4) NOT NULL,
	[Cgst] [int] NULL,
	[Sgst] [int] NULL,
	[Vat] [int] NULL,
	[ManufacturedDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[Status] [smallint] NOT NULL,
	[CreatedBy] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[ModifiedAt] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Product_Company]    Script Date: 08/23/2017 00:58:09 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
/****** Object:  ForeignKey [FK_Product_Unit]    Script Date: 08/23/2017 00:58:09 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
