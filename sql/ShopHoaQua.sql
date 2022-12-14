USE [master]
GO
/****** Object:  Database [ShopHoaQua]    Script Date: 12/03/2022 11:47:47 CH ******/
CREATE DATABASE [ShopHoaQua]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopHoaQua', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PCTHAI\MSSQL\DATA\ShopHoaQua.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopHoaQua_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PCTHAI\MSSQL\DATA\ShopHoaQua_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopHoaQua] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopHoaQua].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopHoaQua] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopHoaQua] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopHoaQua] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopHoaQua] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopHoaQua] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopHoaQua] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopHoaQua] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopHoaQua] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopHoaQua] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopHoaQua] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopHoaQua] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopHoaQua] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopHoaQua] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopHoaQua] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopHoaQua] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopHoaQua] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopHoaQua] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopHoaQua] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopHoaQua] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopHoaQua] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopHoaQua] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopHoaQua] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopHoaQua] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopHoaQua] SET  MULTI_USER 
GO
ALTER DATABASE [ShopHoaQua] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopHoaQua] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopHoaQua] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopHoaQua] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopHoaQua] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopHoaQua] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopHoaQua] SET QUERY_STORE = OFF
GO
USE [ShopHoaQua]
GO
/****** Object:  Table [dbo].[tblCatagory]    Script Date: 12/03/2022 11:47:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCatagory](
	[catagoryID] [char](5) NOT NULL,
	[catagoryName] [nvarchar](50) NULL,
 CONSTRAINT [pk_tblCatalory] PRIMARY KEY CLUSTERED 
(
	[catagoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 12/03/2022 11:47:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[userID] [varchar](50) NULL,
	[total] [money] NULL,
	[status] [bit] NULL,
 CONSTRAINT [pk_tblOder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/03/2022 11:47:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [char](5) NOT NULL,
	[price] [bigint] NULL,
	[quantity] [int] NULL,
	[orderID] [int] NOT NULL,
 CONSTRAINT [pk_tblOderDetail] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 12/03/2022 11:47:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [char](5) NOT NULL,
	[productName] [nvarchar](40) NULL,
	[image] [nvarchar](max) NULL,
	[price] [bigint] NULL,
	[quantity] [int] NULL,
	[catagoryID] [char](5) NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
	[description] [ntext] NULL,
	[status] [bit] NULL,
 CONSTRAINT [pk_tblProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 12/03/2022 11:47:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [pk_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 12/03/2022 11:47:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[birthday] [date] NULL,
	[phone] [nvarchar](15) NULL,
	[email] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'N    ', N'Nấm')
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'RAC  ', N'Rau ăn củ')
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'RAH  ', N'Rau ăn hoa')
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'RAL  ', N'Rau ăn lá')
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'RAQ  ', N'Rau ăn quả')
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'RAT  ', N'Rau ăn thân')
INSERT [dbo].[tblCatagory] ([catagoryID], [catagoryName]) VALUES (N'RGV  ', N'Rau gia vị')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [userID], [total], [status]) VALUES (1, CAST(N'2022-03-12' AS Date), N'Hoadnt', 233250.0000, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [userID], [total], [status]) VALUES (2, CAST(N'2022-03-12' AS Date), N'Hoadnt', 222250.0000, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [userID], [total], [status]) VALUES (3, CAST(N'2022-03-12' AS Date), N'Hoadnt', 85250.0000, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [userID], [total], [status]) VALUES (4, CAST(N'2022-03-12' AS Date), N'Hoadnt', 120250.0000, 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [userID], [total], [status]) VALUES (5, CAST(N'2022-03-12' AS Date), N'Hoadnt', 120250.0000, 1)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (3, N'C6   ', 61250, 1, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (1, N'GV1  ', 24000, 1, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (2, N'GV2  ', 35000, 2, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (4, N'GV4  ', 78000, 1, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (7, N'C6   ', 61250, 1, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (5, N'GV1  ', 24000, 2, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (6, N'GV2  ', 35000, 1, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (8, N'GV4  ', 78000, 1, 2)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (10, N'C6   ', 61250, 1, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (9, N'GV1  ', 24000, 1, 3)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (13, N'C6   ', 61250, 1, 4)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (11, N'GV1  ', 24000, 1, 4)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (12, N'GV2  ', 35000, 1, 4)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (16, N'C6   ', 61250, 1, 5)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (14, N'GV1  ', 24000, 1, 5)
INSERT [dbo].[tblOrderDetail] ([detailID], [productID], [price], [quantity], [orderID]) VALUES (15, N'GV2  ', 35000, 1, 5)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'A22  ', N'A', NULL, 1, 1, N'N    ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-30' AS Date), N'A', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'AAAAA', N'1', NULL, 1, 1, N'RAH  ', CAST(N'2022-03-17' AS Date), CAST(N'2022-03-30' AS Date), N'1', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'ABC  ', N'ABC', NULL, 1111, 111, N'RAH  ', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date), N'ABC', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'C5   ', N'Tá»i', NULL, 61250, 100, N'RAC  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-29' AS Date), N'Tá»i cÃ³ chá»©a protein, carbohydrates, calo vÃ  má»t sá» dÆ°á»¡ng cháº¥t quan trá»ng khÃ¡c nhÆ° vitamin B, sáº¯t, magie, canxi, kali, mangan, photpho,... Än tá»i sá»ng má»i ngÃ y khÃ´ng chá» phÃ²ng ngá»«a nguy cÆ¡ bá» cáº£m cÃºm mÃ  cÃ²n cÃ³ cÃ´ng dá»¥ng tá»t trong viá»c ngÄn ngá»«a hÃ¬nh thÃ nh cÃ¡c mÃ´ liÃªn káº¿t vÃ  chuyá»n hÃ³a xÆ°Æ¡ng. Nhá»¯ng ngÆ°á»i thÆ°á»ng xuyÃªn Än tá»i sáº½ cÃ³ kháº£ nÄng háº¥p thá»¥ canxi tá»t hÆ¡n vÃ  tá»« ÄÃ³ xÆ°Æ¡ng cÅ©ng cháº¯c khá»e hÆ¡n. NgoÃ i ra, cháº¥t allicin trong tá»i cÃ³ kháº£ nÄng loáº¡i bá» cÃ¡c cháº¥t Äá»c háº¡i ra khá»i cÆ¡ thá» vÃ  bÃªn cáº¡nh ÄÃ³ tÄng cÆ°á»ng cÃ¡c táº¿ bÃ o báº¡ch cáº§u khá»e máº¡nh.', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'C6   ', N'HÃ nh tÃ­m', NULL, 61250, 0, N'RAC  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-29' AS Date), N'Bá» sung cÃ¡c dÆ°á»¡ng cháº¥t thiáº¿t yáº¿u cho cÆ¡ thá» nhÆ° vitamin C, vitamin B6, biotin, axit folic, chromium, canxi vÃ  cháº¥t xÆ¡,...', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'GV1  ', N'Xáº£ há»¯u cá»', NULL, 24000, 0, N'RGV  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-10' AS Date), N'Sáº£ lÃ  má»t loáº¡i gia vá» tuyá»t vá»i trong bá»¯a Än hÃ ng ngÃ y vÃ  lÃ  vá» thuá»c tá»t cho sá»©c khá»e cÃ³ tÃ¡c dá»¥ng ngÄn ngá»«a ung thÆ°, giáº£i cáº£m, giáº£i Äá»c vÃ  giáº£m cÃ¢n.', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'GV2  ', N'Rau thÃÂÃÂ¡m', N'https://i.imgur.com/p8mwGpK.jpg', 35000, 1000, N'RGV  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-07' AS Date), N'HÃÂ¡ÃÂ»ÃÂn hÃÂ¡ÃÂ»ÃÂ£p rau gia vÃÂ¡ÃÂ»ÃÂ hÃÂ¡ÃÂ»ÃÂ¯u cÃÂÃÂ¡ gÃÂ¡ÃÂ»ÃÂm hÃÂÃÂºng lÃÂÃÂ©i, hÃÂÃÂºng quÃÂ¡ÃÂºÃÂ¿, diÃÂ¡ÃÂºÃÂ¿p cÃÂÃÂ¡, tÃÂÃÂ­a tÃÂÃÂ´, ngÃÂÃÂ² gai, ngÃÂÃÂ² rÃÂÃÂ­...Trong rau hÃÂÃÂºng lÃÂ¡ÃÂ»ÃÂ§i rÃÂ¡ÃÂºÃÂ¥t giÃÂÃÂ u cÃÂÃÂ¡c hoÃÂ¡ÃÂºÃÂ¡t chÃÂ¡ÃÂºÃÂ¥t cÃÂÃÂ³ tÃÂÃÂ¡c dÃÂ¡ÃÂ»ÃÂ¥ng kÃÂÃÂ­ch thÃÂÃÂ­ch tuyÃÂ¡ÃÂºÃÂ¿n nÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂc bÃÂ¡ÃÂ»ÃÂt, giÃÂÃÂºp men tiÃÂÃÂªu hÃÂÃÂ³a tiÃÂ¡ÃÂºÃÂ¿t ra nhiÃÂ¡ÃÂ»ÃÂu hÃÂÃÂ¡n. NhÃÂ¡ÃÂ»ÃÂ¯ng chÃÂ¡ÃÂºÃÂ¥t nhÃÂÃÂ° limonene, dihydrocarvone, cineol ÃÂÃÂÃÂÃÂ³ng vai trÃÂÃÂ² nhÃÂÃÂ° mÃÂ¡ÃÂ»ÃÂt chÃÂ¡ÃÂºÃÂ¥t ngÃÂÃÂn ngÃÂ¡ÃÂ»ÃÂ«a sÃÂ¡ÃÂ»ÃÂ± phÃÂÃÂ¡t triÃÂ¡ÃÂ»ÃÂn cÃÂ¡ÃÂ»ÃÂ§a vi khuÃÂ¡ÃÂºÃÂ©n, nÃÂ¡ÃÂºÃÂ¥m, giÃÂÃÂºp hÃÂ¡ÃÂ»ÃÂ tiÃÂÃÂªu hÃÂÃÂ³a hoÃÂ¡ÃÂºÃÂ¡t ÃÂÃÂÃÂ¡ÃÂ»ÃÂng khÃÂ¡ÃÂ»ÃÂe mÃÂ¡ÃÂºÃÂ¡nh. BÃÂÃÂªn cÃÂ¡ÃÂºÃÂ¡nh ÃÂÃÂÃÂÃÂ³, loÃÂ¡ÃÂºÃÂ¡i rau nÃÂÃÂ y cÃÂÃÂ²n tÃÂ¡ÃÂ»ÃÂt cho nhÃÂ¡ÃÂ»ÃÂ¯ng ngÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂi bÃÂ¡ÃÂ»ÃÂ hÃÂ¡ÃÂ»ÃÂi chÃÂ¡ÃÂ»ÃÂ©ng kÃÂÃÂ­ch ÃÂ¡ÃÂ»ÃÂ©ng ruÃÂ¡ÃÂ»ÃÂt.Rau hÃÂÃÂºng quÃÂ¡ÃÂºÃÂ¿ cÃÂÃÂ³ thÃÂ¡ÃÂ»ÃÂ giÃÂ¡ÃÂºÃÂ£m triÃÂ¡ÃÂ»ÃÂu chÃÂ¡ÃÂ»ÃÂ©ng mÃÂ¡ÃÂ»ÃÂt sÃÂ¡ÃÂ»ÃÂ bÃÂ¡ÃÂ»ÃÂnh nhÃÂÃÂ° co thÃÂ¡ÃÂºÃÂ¯t dÃÂ¡ÃÂºÃÂ¡ dÃÂÃÂ y, biÃÂ¡ÃÂºÃÂ¿ng ÃÂÃÂn, ÃÂÃÂÃÂ¡ÃÂºÃÂ§y hÃÂÃÂ¡i, cÃÂÃÂ¡c bÃÂ¡ÃÂ»ÃÂnh vÃÂ¡ÃÂ»ÃÂ thÃÂ¡ÃÂºÃÂ­n, chÃÂ¡ÃÂ»ÃÂ©ng phÃÂÃÂ¹ nÃÂ¡ÃÂ»ÃÂ,...Rau diÃÂ¡ÃÂºÃÂ¿p cÃÂÃÂ¡ theo ÃÂÃÂÃÂÃÂ´ng y lÃÂÃÂ  loÃÂ¡ÃÂºÃÂ¡i rau cÃÂÃÂ³ vÃÂ¡ÃÂ»ÃÂ cay chua, mÃÂÃÂ¹i tanh giÃÂ¡ÃÂ»ÃÂng mÃÂÃÂ¹i cÃÂÃÂ¡, tÃÂÃÂ­nh mÃÂÃÂ¡t, cÃÂÃÂ³ tÃÂÃÂ¡c dÃÂ¡ÃÂ»ÃÂ¥ng thanh nhiÃÂ¡ÃÂ»ÃÂt, giÃÂ¡ÃÂºÃÂ£i ÃÂÃÂÃÂ¡ÃÂ»ÃÂc, lÃÂ¡ÃÂ»ÃÂ£i tiÃÂ¡ÃÂ»ÃÂu, sÃÂÃÂ¡t trÃÂÃÂ¹ng. NgoÃÂÃÂ i ra, diÃÂ¡ÃÂºÃÂ¿p cÃÂÃÂ¡ cÃÂÃÂ²n chÃÂ¡ÃÂ»ÃÂ¯a viÃÂÃÂªm phÃÂ¡ÃÂ»ÃÂi, viÃÂÃÂªm khÃÂ¡ÃÂ»ÃÂp, lÃÂ¡ÃÂ»ÃÂ loÃÂÃÂ©t cÃÂ¡ÃÂ»ÃÂ tÃÂ¡ÃÂ»ÃÂ­ cung, tÃÂÃÂ¡o bÃÂÃÂ³n do thÃÂÃÂ³i quen, kiÃÂ¡ÃÂºÃÂ¿t lÃÂ¡ÃÂ»ÃÂµ do vi khuÃÂ¡ÃÂºÃÂ©n cÃÂ¡ÃÂºÃÂ¥p tÃÂÃÂ­nh, viÃÂÃÂªm gan vÃÂÃÂ ng mÃÂ¡ÃÂºÃÂ­t cÃÂ¡ÃÂºÃÂ¥p tÃÂÃÂ­nh, cÃÂÃÂ¡c chÃÂ¡ÃÂ»ÃÂ©ng bÃÂ¡ÃÂ»ÃÂnh vÃÂ¡ÃÂ»ÃÂ thÃÂ¡ÃÂºÃÂ­n, viÃÂÃÂªm mÃÂÃÂ©i, viÃÂÃÂªm tai giÃÂ¡ÃÂ»ÃÂ¯a sÃÂÃÂ°ng mÃÂ¡ÃÂ»ÃÂ§, quai bÃÂ¡ÃÂ»ÃÂ, viÃÂÃÂªm hÃÂ¡ÃÂ»ÃÂng mÃÂÃÂ£n tÃÂÃÂ­nh, bÃÂ¡ÃÂ»ÃÂnh vÃÂ¡ÃÂ»ÃÂ ruÃÂ¡ÃÂ»ÃÂt giÃÂÃÂ , viÃÂÃÂªm tuyÃÂ¡ÃÂºÃÂ¿n tiÃÂ¡ÃÂ»ÃÂn liÃÂ¡ÃÂ»ÃÂt, mÃÂ¡ÃÂ»ÃÂ¥n nhÃÂ¡ÃÂ»ÃÂt mÃÂ¡ÃÂºÃÂ©n ÃÂÃÂÃÂ¡ÃÂ»ÃÂ vÃÂÃÂ  mÃÂ¡ÃÂ»ÃÂt sÃÂ¡ÃÂ»ÃÂ chÃÂ¡ÃÂ»ÃÂ©ng bÃÂ¡ÃÂ»ÃÂnh khÃÂÃÂ¡c.TÃÂÃÂ­a tÃÂÃÂ´ cÃÂÃÂ²n cÃÂÃÂ³ tÃÂÃÂ¡c dÃÂ¡ÃÂ»ÃÂ¥ng lÃÂÃÂ m giÃÂ¡ÃÂºÃÂ£m co thÃÂ¡ÃÂºÃÂ¯t cÃÂÃÂ¡ trÃÂÃÂ¡n cÃÂ¡ÃÂ»ÃÂ§a phÃÂ¡ÃÂºÃÂ¿ quÃÂ¡ÃÂºÃÂ£n, chÃÂ¡ÃÂºÃÂ¥t tinh dÃÂ¡ÃÂºÃÂ§u lÃÂÃÂ m tÃÂÃÂng ÃÂÃÂÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂng huyÃÂ¡ÃÂºÃÂ¿t. Aldehyt tÃÂÃÂ­a tÃÂÃÂ´ chÃÂ¡ÃÂ»ÃÂng ÃÂ¡ÃÂ»ÃÂ©c chÃÂ¡ÃÂºÃÂ¿ trung khu thÃÂ¡ÃÂºÃÂ§n kinh. NÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂc ngÃÂÃÂ¢m lÃÂÃÂ¡ tÃÂÃÂ­a tÃÂÃÂ´ cÃÂÃÂ³ tÃÂÃÂ¡c dÃÂ¡ÃÂ»ÃÂ¥ng ÃÂ¡ÃÂ»ÃÂ©c chÃÂ¡ÃÂºÃÂ¿ cÃÂÃÂ¡c loÃÂ¡ÃÂºÃÂ¡i vi trÃÂÃÂ¹ng nhÃÂÃÂ° tÃÂ¡ÃÂ»ÃÂ¥ cÃÂ¡ÃÂºÃÂ§u khuÃÂ¡ÃÂºÃÂ©n, trÃÂ¡ÃÂ»ÃÂ±c khuÃÂ¡ÃÂºÃÂ©n lÃÂ¡ÃÂ»ÃÂ, trÃÂ¡ÃÂ»ÃÂ±c khuÃÂ¡ÃÂºÃÂ©n ÃÂÃÂÃÂ¡ÃÂºÃÂ¡i trÃÂÃÂ ng.NgÃÂÃÂ² gai cÃÂÃÂ³ tÃÂÃÂ­nh ÃÂ¡ÃÂºÃÂ¥m, vÃÂ¡ÃÂ»ÃÂ ÃÂÃÂÃÂ¡ÃÂºÃÂ¯ng, mÃÂÃÂ¹i thÃÂÃÂ¡m hÃÂ¡ÃÂºÃÂ¯c, cÃÂÃÂ³ tÃÂÃÂ¡c dÃÂ¡ÃÂ»ÃÂ¥ng tiÃÂ¡ÃÂ»ÃÂn kÃÂ¡ÃÂ»ÃÂ³, sÃÂÃÂ¡ phong thanh nhiÃÂ¡ÃÂ»ÃÂt, giÃÂ¡ÃÂºÃÂ£m ÃÂÃÂau, hÃÂÃÂ nh khÃÂÃÂ­ tiÃÂÃÂªu thÃÂÃÂ©ng, thÃÂÃÂ´ng khÃÂÃÂ­, giÃÂ¡ÃÂºÃÂ£i ÃÂÃÂÃÂ¡ÃÂ»ÃÂc, giÃÂ¡ÃÂºÃÂ£i nhiÃÂ¡ÃÂ»ÃÂt, kiÃÂ¡ÃÂ»ÃÂn tÃÂ¡ÃÂ»ÃÂ³, kÃÂÃÂ­ch thÃÂÃÂ­ch tiÃÂÃÂªu hoÃÂÃÂ¡, khÃÂ¡ÃÂ»ÃÂ­ mÃÂÃÂ¹i hÃÂÃÂ´i hiÃÂ¡ÃÂ»ÃÂu quÃÂ¡ÃÂºÃÂ£.NgÃÂÃÂ² rÃÂÃÂ­ giÃÂÃÂºp cÃÂÃÂ¢n bÃÂ¡ÃÂºÃÂ±ng lÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂ£ng ÃÂÃÂÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂng trong mÃÂÃÂ¡u, hÃÂ¡ÃÂºÃÂ¡t ngÃÂÃÂ² rÃÂÃÂ­ giÃÂÃÂºp loÃÂ¡ÃÂºÃÂ¡i bÃÂ¡ÃÂ»ÃÂ ÃÂÃÂÃÂ¡ÃÂ»ÃÂc tÃÂ¡ÃÂ»ÃÂ, nhÃÂ¡ÃÂºÃÂ¥t lÃÂÃÂ  kim loÃÂ¡ÃÂºÃÂ¡i nÃÂ¡ÃÂºÃÂ·ng cÃÂÃÂ³ hÃÂ¡ÃÂºÃÂ¡i trong cÃÂÃÂ¡ thÃÂ¡ÃÂ»ÃÂ. NgÃÂÃÂ² rÃÂÃÂ­ giÃÂÃÂ u vitamin A, C, B1, 2, axit folic, sÃÂ¡ÃÂºÃÂ¯tÃÂ¢ÃÂÃÂ¦ giÃÂÃÂºp giÃÂ¡ÃÂºÃÂ£m cholesterol trong mÃÂÃÂ¡u, hÃÂ¡ÃÂ»ÃÂ trÃÂ¡ÃÂ»ÃÂ£ tiÃÂÃÂªu hÃÂÃÂ³a, tÃÂÃÂng cÃÂÃÂ°ÃÂ¡ÃÂ»ÃÂng sÃÂ¡ÃÂ»ÃÂ©c khÃÂ¡ÃÂ»ÃÂe cho dÃÂ¡ÃÂºÃÂ¡ dÃÂÃÂ y, phÃÂ¡ÃÂ»ÃÂ¥ nÃÂ¡ÃÂ»ÃÂ¯ ÃÂÃÂn nhiÃÂ¡ÃÂ»ÃÂu ngÃÂÃÂ² rÃÂÃÂ­ giÃÂÃÂºp bÃÂ¡ÃÂ»ÃÂ mÃÂÃÂ¡u, giÃÂ¡ÃÂºÃÂ£m rÃÂ¡ÃÂ»ÃÂi loÃÂ¡ÃÂºÃÂ¡n kinh nguyÃÂ¡ÃÂ»ÃÂt hiÃÂ¡ÃÂ»ÃÂu quÃÂ¡ÃÂºÃÂ£.', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'GV3  ', N'Ngải cứu', N'https://i.imgur.com/NcNZdZ1.jpg', 12000, 100, N'RGV  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-07' AS Date), N'Ngải cứu là một loại rau gia vị làm tăng hương vị cho món ăn, bên cạnh đó còn có nhiều lợi ích cho sức khỏe: điều hòa kinh nguyệt; sơ cứu vết thương; trị đau thần kinh tọa, xương khớp; lưu thông máu lên não; giảm suy nhược cơ thể.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'GV4  ', N'Háº¹', N'https://i.imgur.com/K1ouoyh.png', 78000, 1, N'RGV  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-06' AS Date), N'LÃ¡ háº¹ lÃ  má»t loáº¡i rau xanh cÃ³ hÆ°Æ¡ng vá» gáº§n giá»ng nhÆ° hÃ nh, cÃ¹ng há» vá»i cÃ¡c loáº¡i cÃ¢y gia vá» nhÆ° tá»i, tá»i tÃ¢y, hÃ nh lÃ¡... Loáº¡i cÃ¢y nÃ y cÃ³ vá» cay ná»ng Äáº·c trÆ°ng, hÆ¡i chua, hÄng, thÆ°á»ng dÃ¹ng trong náº¥u Än vÃ  há» trá»£ chá»¯a bá»nh.LÃ¡ háº¹ lÃ  má»t loáº¡i thá»±c pháº©m cÃ³ lÆ°á»£ng calo tháº¥p, chá»©a nhiá»u cháº¥t dinh dÆ°á»¡ng cÃ³ lá»£i nhÆ° vitamin, khoÃ¡ng cháº¥t, cÃ¡c cháº¥t chá»ng oxy hÃ³a. LÃ¡ háº¹ cÃ²n lÃ  thá»±c pháº©m giÃ u folate, tá»t cho phá»¥ ná»¯ cÃ³ thai. Má»t nghiÃªn cá»©u chá» ra ráº±ng cÃ¡c há»£p cháº¥t organosulfur cÃ³ trong háº¹ cÃ³ thá» mang Äáº·c tÃ­nh khÃ¡ng khuáº©n, khÃ¡ng náº¥m vÃ  virus. Äá»ng thá»i cÃ¡c cháº¥t chá»ng oxy hÃ³a, cháº¥t organosulfur vÃ  thiosulfate trong háº¹ giÃºp ngÄn ngá»«a sá»± hÃ¬nh thÃ nh cá»§a cÃ¡c cá»¥c mÃ¡u ÄÃ´ng, giáº£m nguy cÆ¡ máº¯c cÃ¡c bá»nh tim máº¡ch, giÃºp lÆ°u thÃ´ng mÃ¡u tá»t.', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'GV5  ', N'HÃ nh lÃ¡', N'https://i.imgur.com/D1w98Jy.jpg', 21000, 2, N'RGV  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-06' AS Date), N'HÃ nh lÃ¡ giÃ u cháº¥t xÆ¡ giÃºp tiÃªu hÃ³a tá»t hÆ¡n. HÃ nh lÃ¡ giÃ u vitamin C vÃ  vitamin A, giÃºp tÄng cÆ°á»ng há» thá»ng miá»n dá»ch vÃ  báº£o vá» cÆ¡ thá» khá»i nhiá»m trÃ¹ng.', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'H1   ', N'Hoa chuối', N'https://i.imgur.com/NvWltKl.jpg', 40000, 100, N'RAH  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-12' AS Date), N'Hoa chuối có công dụng điều trị thiếu máu, điều trị chu kỳ kinh bất thường, cải thiện khả năng , giảm viêm và nhiễm trùng', 0)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'H2   ', N'Súp lơ,', N'https://i.imgur.com/dxL3DAh.jpg', 43000, 100, N'RAH  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-15' AS Date), N'Trong súp lơ xanh có hàm lượng canxi, vitamin K và chất xơ rất dồi dào. Tuy vậy, nếu đưa súp lơ xanh và súp lơ trắng lên bàn cân thì cả hai đều tốt như nhau. Chúng đề có lượng calo thấp, chứa nhiều dưỡng chất tốt cho cơ thể như mangan, folate, protein và các vitamin khác..', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'hhh  ', N'hhh222', NULL, 100, 100, N'N    ', CAST(N'2022-03-11' AS Date), CAST(N'2022-03-30' AS Date), N'121', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'N1   ', N'Nấm hào hương hữu cơ', N'https://i.imgur.com/oFdVGfw.jpg', 179000, 100, N'N    ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-10' AS Date), N'Bước 1: Rửa sạch nấm, để ráo nước

Bước 2: Chế biến món ăn theo sở thích (hấp, nấu canh, lẩu, xào, ...)', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'N2   ', N'Nấm linh chi', N'https://i.imgur.com/te2aLFN.jpg', 1790000, 100, N'N    ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-15' AS Date), N'Giàu protein
Hỗ trợ phòng chống giun sán', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'N3   ', N'Đông trùng hạ thảo hữu cơ', N'https://i.imgur.com/6b1qdo8.jpg', 199000, 100, N'N    ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-16' AS Date), N'Chữa bệnh cao huyết áp.
Trị đau nhức, mệt mỏi, viêm khớp.
Giúp an thần, chống suy nhược thần kinh kéo dài.
Trị các chứng chán ăn, mất ngủ.
Chống béo phì, giúp giảm cân hiệu quả.
Chống ung thư, kháng siêu vi.
Trợ tim, chống xơ vữa thành động mạch.
Tăng cường hoạt động của nang thượng thận.
Điều trị các bệnh liên quan đến dạ dày, tá tràng.
Điều trị bệnh tiểu đường.
Chữa bệnh gan, viêm gan mãn tính, gan nhiễm mỡ, viêm thận, viêm phế quản.
Ngăn chặn quá trình lão hóa. Chống oxy hóa tế bào. Khử các gốc tự do. Làm trẻ hóa cơ thể, gia tăng tuổi thọ. Chống các bệnh thường gặp ở tuổi già.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'N4   ', N'Nấm đùi gà', N'https://i.imgur.com/NGX0AWk.jpg', 179000, 100, N'N    ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-17' AS Date), N'Nấm đùi gà tốt cho hệ tiêu hóa, phòng chống bệnh tiểu đường, giúp tăng cường miễn dịch.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'N5   ', N'Nấm hương', N'https://i.imgur.com/n5OCtYD.jpg', 215000, 100, N'N    ', CAST(N'2022-03-09' AS Date), CAST(N'2022-03-20' AS Date), N'Nấm hương hữu cơ chứa các vitamin B1, B2, B6, B12, Kali, Sắt, Protein, Beta glucose và axit nucleic, lượng calo thấp, giàu chất xơ và khoáng chất giúp ngăn ngừa các bệnh về tim mạch, hỗ trợ giảm cân, tốt cho làn da, tăng cường hệ miễn dịch.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'Q1   ', N'Mướp', N'https://i.imgur.com/j5nVKeo.jpg', 40000, 100, N'RAQ  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-15' AS Date), N'Theo Đông y, mướp có vị ngọt, tính mát, không độc. Mướp là nguồn dinh dưỡng cần thiết cho mẹ, giải pháp tuyệt vời cho những mẹ ít sữa. Một trái mướp nhỏ (khoảng 100g) có chứa đến 95gr nước, 0,9gr protit, 0,1gr lipit, 3gr glucit, 0,5gr xeluloza, 28mg sắt, 160mcg betacaroen và rất nhiều vitamin B, C… Đây thực sự là 1 nguồn dinh dưỡng quý giá cho mẹ và bé yêu luôn khỏe mạnh. Sau sinh, nếu mẹ quá ít sữa, có thể tham khảo thực đơn với mướp để có được nguồn sữa dồi dào hơn.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'Q2   ', N'Bầu', N'https://i.imgur.com/hvZlBmf.jpg', 56000, 100, N'RAQ  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-15' AS Date), N'Giảm thân nhiệt: Bạn lấy quả bầu cho vào luộc ăn thì sẽ giúp thân nhiệt mát. Quả bầu có nhiều chất xơ giúp chống táo bón.

Đối với những người bị béo phì thì khi ăn quả bầu không lo bị tăng cân.

Giúp giảm lượng đường trong cơ thể: Những người bị tiểu đường, ăn bầu giúp giảm lượng đường.

Vỏ quả bầu có tác dụng lợi tiểu: Nhưng bạn cần lưu ý tới những quả bầu phải thật sạch, không sử dụng bất cứ loại thuốc bảo vệ thực vật nào ở ngoài vỏ.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'Q3   ', N'Ớt', N'https://i.imgur.com/miix76V.png', 45000, 100, N'RAQ  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-30' AS Date), N'Bạn có biết ớt chuông có hàm lượng vitamin C cao hơn cả cam, chanh, đu đủ, dứa/ thơm không?

Rất bất ngờ nhưng đó là sự thật sau khi các nhà dinh dưỡng phân tích vitamin C trong các loại rau quả nói trên.
Tại Organica, chúng tôi trồng được những trái ớt chuông hữu cơ có cùi giày, ăn giòn ngọt không khác gì trái cây. Hãy cung cấp vitamin C mỗi ngày bằng một trái ớt chuông nhé.
Ớt chuông được trồng hoàn toàn không sử dụng phân bón hóa học, thuốc diệt cỏ, thuốc bảo vệ thực vật và chất kích thích tăng trưởng. Bạn có thể dùng ớt chuông để xào thịt hoặc nấu chay, ép nước,...', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'Q4   ', N'Bí xanh', N'https://i.imgur.com/AD2Syc0.jpg', 45000, 100, N'RAQ  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-10' AS Date), N'Lượng vitamin C trong khổ qua giúp tăng sức đề kháng cho cơ thể, kháng viêm tốt, ngăn ngừa và có tác dụng tiêu diệt tế bào ung thư. Kali trong khổ qua chứa có tác dụng giảm huyết áp, beta-carotene giúp sáng mắt, giúp điều trị chứng trào ngược axit và chứng khó tiêu.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'Q5   ', N'Cà chua', N'https://i.imgur.com/llbkVJ9.jpg', 55000, 100, N'RAQ  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-11' AS Date), N'Trong bí xanh chứa nhiều nước, nhiệt lượng thấp, không có chất béo. Theo y học cổ truyền, bí xanh vị ngọt nhạt, tính mát, có công dụng thanh nhiệt, giải nhiệt và làm tan đờm, làm mát ruột và hết khát, lợi tiểu, làm hết phù, giải độc và giảm béo.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'R1   ', N'Xà lách', N'https://i.imgur.com/ZJebL7U.jpg', 12000, 100, N'RAL  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-09' AS Date), N'Xà lách hay còn gọi là cải bèo, là loài thực vật có hoa thuộc họ Cúc. Nó thường được trồng làm rau ăn lá, đặc biệt trong các món salad, bánh mì kẹp, hamburger và nhiều món ăn khác. Rau xà lách là một trong những nguồn thực phẩm cung cấp chất dinh dưỡng thiết yếu tốt cho sức khỏe..', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'R2   ', N'Bắp cải', N'https://i.imgur.com/8rlHp48.jpg', 46000, 100, N'RAL  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-09' AS Date), N'Bắp cải được ví như "thần dược của người nghèo" với những công dụng tuyệt vời của nó: ngăn ngừa quá trình lão hóa, phòng chống loãng xương, ngăn ngừa ung thư, phòng và điều trị bệnh huyết áp cao, làm giảm các cơn đau, cải thiện sức khỏe mắt, cải thiện khả năng tập trung, giảm cân hiệu quả, hỗ trợ chức năng tiêu hóa.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'R3   ', N'Rau rền', N'https://i.imgur.com/yA0pqlJ.jpg', 32250, 100, N'RAL  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-10' AS Date), N'Hàm lượng chất xơ trong rau dền khá cao và cao hơn gấp 3 lần so với lúa mì. Do đó, sử dụng rau dền thường xuyên có thể giúp cải thiện chất lượng hệ tiêu hoá đồng thời giúp ngăn ngừa tình trạng táo bón. Ngoài ra, nước nấu từ cây rau dền còn có tác dụng hỗ trợ điều trị triệu chứng tiêu chảy, xuất huyết hoặc mất nước.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'R4   ', N'Rau muống', N'https://i.imgur.com/yFggWqZ.jpg', 22500, 150, N'RAL  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-07' AS Date), N'Đến 99% người Việt Nam biết về rau muống là một loại rau ăn, quen thuộc và rất gần gũi, gần như tuần nào các gia đình cũng có nó trong bữa ăn. Tuy nhiên, ít ai biết rau muống có nhiều tác dụng tốt như giảm cholesterol, trị vàng da, chữa khó tiêu, táo bón, thiếu máu, phòng chống bệnh tiểu đường, bảo vệ tim mạch,…', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'R5   ', N'Cải bẹ xanh', N'https://i.imgur.com/T4qO3YR.jpg', 22500, 200, N'RAL  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-09' AS Date), N'Ăn cải bẹ xanh mỗi ngày giúp phòng ngừa ung thư bàng quang, thanh nhiệt, hỗ trợ tiêu hóa, trị táo bón. Theo Đông y, cải bẹ xanh có vị cay, tính ôn, có tác dụng giải cảm hàn, thông đàm, lợi khí, an thần, giảm đau, lợi tiểu.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'R6   ', N'Mồng tơi', N'https://i.imgur.com/4QOezDV.jpg', 21000, 150, N'RAL  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-05' AS Date), N'Mồng tơi không chỉ là món rau thông thường, trong dân gian rau mồng tơi còn các tác dụng chữa bệnh. Theo đông y, rau mồng tơi có tính hàn, vị chua, tán nhiệt, mất máu, lợi tiểu, giải độc, đẹp da, trị rôm sảy mụn nhọt hiệu quả… rất thích hợp trong mùa nóng. Theo các nghiên cứu cho thấy, trong mồng tơi chứa chất nhầy pectin rất quý để phòng chữa nhiều bệnh, làm cho rau mồng tơi có tác dụng nhuận tràng, thải chất béo chống béo phì, thích hợp cho người có mỡ và đường cao trong máu.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'T1   ', N'Măng tây', N'https://i.imgur.com/aRTLDP6.jpg', 78000, 100, N'RAT  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-20' AS Date), N'Măng tây xanh thường được sử dụng như một món ăn đơn thuần nhưng có hàm lưỡng dinh dưỡng cao và có nhiều dược tính. Một số lợi ích sức khỏe của măng tây xanh: tốt cho tim mạch và đường ruột; tăng cường hệ miễn dịch; ngăn ngừa lão hóa và loãng xương; ngăn ngừa ung thu; tốt cho phụ nữ mang thai.', 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [catagoryID], [importDate], [usingDate], [description], [status]) VALUES (N'T2   ', N'Cần Tây', N'https://i.imgur.com/JrjGe8C.jpg', 10000, 100, N'RAT  ', CAST(N'2022-03-09' AS Date), CAST(N'2022-04-20' AS Date), N'Cần tây giàu vitamin K, cụ thể thân cây này cung cấp đến 25% vitamin K mỗi ngày cho bạn. Ngoài ra, nó còn chứa một lượng nhỏ các vitamin khác như: vitamin A, vitamin B và vitamin C. Mặc dù cần tây có hàm lượng calo thấp nhưng lại chứa một số khoáng chất nhất định như: kali, folate, choline, canxi, mangan, magiê, phốt pho,.', 1)
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'khách hàng')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'A', N'1', N'1', N'US', N'521/2 ', NULL, N'0962654410', N'nguoicuatheki20@gmail.com', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', N'Dai hoc FPT', NULL, N'0987654321', N'hoadnt@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'SE150443', N'LE MINH KHOA', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [birthday], [phone], [email], [status]) VALUES (N'thaidep', N'Phuong Thai', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
GO
ALTER TABLE [dbo].[tblProduct] ADD  CONSTRAINT [DF_tblProduct_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [fk01_tblOder] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [fk01_tblOder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [fk01_tblOderDetail] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [fk01_tblOderDetail]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [fk02_tblOderDetail] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [fk02_tblOderDetail]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [fk01_tblProduct] FOREIGN KEY([catagoryID])
REFERENCES [dbo].[tblCatagory] ([catagoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [fk01_tblProduct]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [fk01_tblUsers] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [fk01_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [ShopHoaQua] SET  READ_WRITE 
GO
