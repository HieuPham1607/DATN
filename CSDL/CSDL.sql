USE [WebBanGiayAdidas]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/28/2025 10:16:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Position] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifierDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[childImage]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[childImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ImagePath] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Website] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Message] [nvarchar](max) NULL,
	[Read] [bit] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[New]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifierDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_New] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[OrderCode] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](500) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Payment] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Size] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifierDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[ProductCategoryId] [int] NULL,
	[ProductCode] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[Price] [decimal](18, 2) NULL,
	[PriceSale] [decimal](18, 2) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifierDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
	[IsActive] [bit] NOT NULL,
	[IsHome] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsFeature] [bit] NOT NULL,
	[IsSale] [bit] NOT NULL,
	[ShoeColorId] [int] NULL,
	[ProductGroupId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Icon] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifierDate] [datetime] NULL,
	[ModifierBy] [nvarchar](250) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSizes]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Size] [nvarchar](10) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK__ProductS__3214EC0747542826] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoeColors]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeColors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
	[ColorCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/28/2025 10:16:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](250) NULL,
	[PasswordHash] [nvarchar](250) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title], [Alias], [Description], [Position], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (8, N'Sản phẩm', N'san-pham', NULL, 2, CAST(N'2025-04-23T01:08:55.743' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Alias], [Description], [Position], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (9, N'Tin tức', N'tin-tuc', NULL, 3, CAST(N'2025-04-23T01:09:18.210' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Alias], [Description], [Position], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (10, N'Bài viết', N'bai-viet', NULL, 4, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Category] ([Id], [Title], [Alias], [Description], [Position], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (11, N'Liên hệ', N'lien-he', NULL, 5, CAST(N'2025-04-23T01:09:54.860' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([Id], [Title], [Alias], [Description], [Position], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (14, N'Trang chủ', N'trang-chu', NULL, 1, CAST(N'2025-05-03T16:33:03.133' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[childImage] ON 

INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (270, 44, N'/uploads/product-images/e305fc7a-c266-4163-95e3-72145b3659f6_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-1-1732786311.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (271, 44, N'/uploads/product-images/22e9cdc7-814d-4432-ab43-c787b5dd59cc_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (272, 44, N'/uploads/product-images/c568a4ee-682d-4915-b750-bea82323cfd4_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (273, 44, N'/uploads/product-images/0777eaa9-8b34-474b-8bdc-6d94765ca24e_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (274, 44, N'/uploads/product-images/9c053bdb-c154-4e80-b9a5-dbf176de7a8c_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (275, 44, N'/uploads/product-images/7919063d-5638-4223-b1ec-e7581cf69f6d_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (276, 44, N'/uploads/product-images/00c99646-72cf-4c56-95b7-504bfa4a0f23_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (277, 44, N'/uploads/product-images/a760cd5b-f9d0-4c05-8738-be2351739b7e_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (288, 44, N'/uploads/product-images/635ed341-e968-4d03-ad32-46c185f9a954_gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (289, 35, N'/uploads/product-images/24d38641-41a8-4b96-8bb9-7c50877fe890_ADIDAS SAMBA OG.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (290, 35, N'/uploads/product-images/df45082c-7752-4ccc-a70b-9851da743330_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (291, 35, N'/uploads/product-images/2a282f7c-530f-4f3c-920e-5ef9c50b7a83_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (292, 35, N'/uploads/product-images/178c6654-fba9-4568-ba1f-896a2db62fb3_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (293, 35, N'/uploads/product-images/eddcc2ec-f5d0-47ee-ae3b-58fefc8e2199_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (294, 35, N'/uploads/product-images/a7a09448-3502-4f1e-a6a4-4a322841082d_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (295, 35, N'/uploads/product-images/b2975f6d-1508-4329-9f48-8dcb0f754d86_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-7 (1).jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (296, 35, N'/uploads/product-images/015fba92-cbb7-49bf-ad18-e2701ea5ac56_ih8047-giay-adidas-samba-og-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (297, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-1-1743923139.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (298, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (299, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (300, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (301, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (302, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (303, 51, N'/uploads/product-images/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (304, 52, N'/uploads/product-images/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-1.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (305, 52, N'/uploads/product-images/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-3.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (306, 52, N'/uploads/product-images/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-4.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (307, 52, N'/uploads/product-images/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (308, 52, N'/uploads/product-images/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (309, 52, N'/uploads/product-images/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-7-1743319934.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (310, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-1-1730607844.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (311, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (312, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (313, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (314, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (315, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (316, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (317, 53, N'/uploads/product-images/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (318, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-1-1730607528.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (319, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (320, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (321, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (322, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (323, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (324, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (325, 54, N'/uploads/product-images/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (326, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-1-1728301475.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (327, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (328, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (329, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (330, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (331, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (332, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (333, 55, N'/uploads/product-images/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (334, 56, N'/uploads/product-images/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (335, 56, N'/uploads/product-images/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (336, 56, N'/uploads/product-images/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (337, 56, N'/uploads/product-images/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (338, 56, N'/uploads/product-images/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (339, 56, N'/uploads/product-images/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (340, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (341, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (342, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (343, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (344, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (345, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (346, 57, N'/uploads/product-images/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (347, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (348, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (349, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (350, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (351, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (352, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (353, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (354, 58, N'/uploads/product-images/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (355, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (356, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (357, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (358, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (359, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (360, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (361, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (362, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (363, 59, N'/uploads/product-images/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes-12.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (364, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-1-1726319060.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (365, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (366, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (367, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (368, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (369, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (370, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (371, 60, N'/uploads/product-images/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (372, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-1-1730607211.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (373, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (374, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (375, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (376, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (377, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (378, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-7.jpg')
GO
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (379, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (380, 61, N'/uploads/product-images/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (381, 62, N'/uploads/product-images/ig8660-giay-adidas-campus-00s-black-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (382, 62, N'/uploads/product-images/ig8660-giay-adidas-campus-00s-black-gia-tot-den-king-shoes-13.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (383, 62, N'/uploads/product-images/ig8660-giay-adidas-campus-00s-black-gia-tot-den-king-shoes-7.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (384, 62, N'/uploads/product-images/ig8660-giay-adidas-campus-00s-black-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (385, 62, N'/uploads/product-images/ig8660-giay-adidas-campus-00s-black-gia-tot-den-king-shoes-5.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (386, 63, N'/uploads/product-images/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-8-1737185730.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (387, 63, N'/uploads/product-images/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (388, 63, N'/uploads/product-images/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (389, 63, N'/uploads/product-images/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (390, 63, N'/uploads/product-images/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (391, 63, N'/uploads/product-images/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (392, 64, N'/uploads/product-images/cz0294-800-court-legacy-cnvs-giay-nike-chinh-hang-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (393, 64, N'/uploads/product-images/cz0294-800-court-legacy-cnvs-giay-nike-chinh-hang-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (394, 64, N'/uploads/product-images/cz0294-800-court-legacy-cnvs-giay-nike-chinh-hang-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (395, 64, N'/uploads/product-images/cz0294-800-court-legacy-cnvs-giay-nike-chinh-hang-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (396, 64, N'/uploads/product-images/cz0294-800-court-legacy-cnvs-giay-nike-chinh-hang-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (397, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-2.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (398, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-3.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (399, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-4.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (400, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-5.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (401, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (402, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-7.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (403, 65, N'/uploads/product-images/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-8.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (404, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-9-1654923061.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (405, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-3-1654923063.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (406, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-4.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (407, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-5.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (408, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (409, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (410, 66, N'/uploads/product-images/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (427, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (428, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (429, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (430, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (431, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (432, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (433, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (434, 69, N'/uploads/product-images/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (435, 70, N'/uploads/product-images/if5416-giay-adidas-superstar-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (436, 70, N'/uploads/product-images/if5416-giay-adidas-superstar-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (437, 70, N'/uploads/product-images/if5416-giay-adidas-superstar-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (438, 70, N'/uploads/product-images/if5416-giay-adidas-superstar-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (439, 70, N'/uploads/product-images/if5416-giay-adidas-superstar-gia-tot-den-king-shoes-13.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (440, 71, N'/uploads/product-images/sneaker-c77124-super-star-adidas-kingshoes.vn-tphcm-tanbinh-27-1628053703.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (441, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-62.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (442, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-63.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (443, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-65.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (444, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-66.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (445, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-67.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (446, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-68.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (447, 71, N'/uploads/product-images/giày-adidas-superstar-review-on-feet-c77124-king-shoes-sneaker-real-hcm-69.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (448, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (449, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (450, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (451, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (452, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (453, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (454, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (455, 72, N'/uploads/product-images/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (456, 68, N'/uploads/product-images/72cee0a7-ab90-47c1-b790-af4efad3ed54_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (457, 68, N'/uploads/product-images/351dc7fe-ea0a-4945-8132-ccabfcf37235_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (458, 68, N'/uploads/product-images/e51d0950-ea53-482c-94de-6e4a64bd9856_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (459, 68, N'/uploads/product-images/e17022bc-ed85-4a89-a2d5-b121bb37d9a9_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (460, 68, N'/uploads/product-images/9df059d5-7aa8-47a8-a8a6-7288d0c21c4b_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (461, 68, N'/uploads/product-images/4f7cf393-f483-44ff-a1b8-37c9ac9a7e66_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (462, 68, N'/uploads/product-images/02c8f0e4-6889-4a5c-8375-8fc729ea4b6f_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (463, 68, N'/uploads/product-images/13a4c9c8-36cc-4d3d-a008-67409aa277bc_hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (488, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (489, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (490, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (491, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (492, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (493, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (494, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (495, 76, N'/uploads/product-images/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-12.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (496, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (497, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (498, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (499, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (500, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (501, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (502, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (503, 77, N'/uploads/product-images/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-12-1740569862.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (504, 78, N'/uploads/product-images/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-1-1734755708.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (505, 78, N'/uploads/product-images/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (506, 78, N'/uploads/product-images/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (507, 78, N'/uploads/product-images/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (508, 78, N'/uploads/product-images/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-5.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (509, 78, N'/uploads/product-images/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (510, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-9.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (511, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-2-1740211581.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (512, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (513, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (514, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (515, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (516, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (517, 79, N'/uploads/product-images/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (518, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-1-1739770630.jpg')
GO
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (519, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (520, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (521, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (522, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (523, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-6.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (524, 80, N'/uploads/product-images/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (525, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-1.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (526, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-2.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (527, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-3.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (528, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-4.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (529, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-5.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (530, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (531, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-7.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (532, 81, N'/uploads/product-images/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-12-1734758053.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (533, 82, N'/uploads/product-images/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-12-1733666451.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (534, 82, N'/uploads/product-images/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-2.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (535, 82, N'/uploads/product-images/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-3.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (536, 82, N'/uploads/product-images/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-4.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (537, 82, N'/uploads/product-images/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-5.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (538, 82, N'/uploads/product-images/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-6.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (539, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (540, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-1.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (541, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-2.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (542, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-3.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (543, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-4.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (544, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-5.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (545, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (546, 83, N'/uploads/product-images/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-7.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (547, 84, N'/uploads/product-images/nike-jordan-1-low-white-black-gym-red-ib8971-gia-tot-den-king-shoes-1744608209.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (548, 84, N'/uploads/product-images/ib8971-giay-air-jordan-1-low-white-black-gym-red-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (549, 84, N'/uploads/product-images/ib8971-giay-air-jordan-1-low-white-black-gym-red-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (550, 84, N'/uploads/product-images/ib8971-giay-air-jordan-1-low-white-black-gym-red-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (551, 84, N'/uploads/product-images/ib8971-giay-air-jordan-1-low-white-black-gym-red-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (552, 84, N'/uploads/product-images/ib8971-giay-air-jordan-1-low-white-black-gym-red-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (553, 85, N'/uploads/product-images/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-1.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (554, 85, N'/uploads/product-images/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-2.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (555, 85, N'/uploads/product-images/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-3.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (556, 85, N'/uploads/product-images/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-4.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (557, 85, N'/uploads/product-images/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-5.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (558, 85, N'/uploads/product-images/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (559, 86, N'/uploads/product-images/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (560, 86, N'/uploads/product-images/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (561, 86, N'/uploads/product-images/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (562, 86, N'/uploads/product-images/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (563, 86, N'/uploads/product-images/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (564, 86, N'/uploads/product-images/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-12-1743922375.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (565, 87, N'/uploads/product-images/fv3624-151-giay-jordan-stadium-90-gia-tot-den-king-shoes-4-1742982950.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (566, 87, N'/uploads/product-images/fv3624-151-giay-jordan-stadium-90-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (567, 87, N'/uploads/product-images/fv3624-151-giay-jordan-stadium-90-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (568, 87, N'/uploads/product-images/fv3624-151-giay-jordan-stadium-90-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (569, 87, N'/uploads/product-images/fv3624-151-giay-jordan-stadium-90-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (570, 88, N'/uploads/product-images/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-1.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (571, 88, N'/uploads/product-images/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-2.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (572, 88, N'/uploads/product-images/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-3.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (573, 88, N'/uploads/product-images/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-4.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (574, 88, N'/uploads/product-images/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-5.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (575, 88, N'/uploads/product-images/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-6.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (576, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (577, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (578, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (579, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (580, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (581, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (582, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (583, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (584, 89, N'/uploads/product-images/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (585, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (586, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-2 (1).jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (587, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (588, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (589, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (590, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (591, 90, N'/uploads/product-images/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (592, 91, N'/uploads/product-images/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (593, 91, N'/uploads/product-images/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (594, 91, N'/uploads/product-images/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-6.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (595, 91, N'/uploads/product-images/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-7.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (596, 91, N'/uploads/product-images/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-8.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (597, 91, N'/uploads/product-images/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (598, 92, N'/uploads/product-images/dd1503-117-giay-nike-dunk-low-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (599, 92, N'/uploads/product-images/dd1503-117-giay-nike-dunk-low-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (600, 92, N'/uploads/product-images/dd1503-117-giay-nike-dunk-low-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (601, 92, N'/uploads/product-images/dd1503-117-giay-nike-dunk-low-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (602, 92, N'/uploads/product-images/dd1503-117-giay-nike-dunk-low-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (603, 93, N'/uploads/product-images/ao9944-4412.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (604, 93, N'/uploads/product-images/ao9944-4413.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (605, 93, N'/uploads/product-images/ao9944-4414.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (606, 93, N'/uploads/product-images/ao9944-4415.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (607, 93, N'/uploads/product-images/ao9944-4416.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (608, 93, N'/uploads/product-images/ao9944-4417.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (609, 93, N'/uploads/product-images/ao9944-4418.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (610, 94, N'/uploads/product-images/dz5485-020-giay-nike-air-jordan-1-palomino-chinh-hang-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (611, 94, N'/uploads/product-images/dz5485-020-giay-nike-air-jordan-1-palomino-chinh-hang-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (612, 94, N'/uploads/product-images/dz5485-020-giay-nike-air-jordan-1-palomino-chinh-hang-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (613, 94, N'/uploads/product-images/dz5485-020-giay-nike-air-jordan-1-palomino-chinh-hang-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (614, 94, N'/uploads/product-images/dz5485-020-giay-nike-air-jordan-1-palomino-chinh-hang-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (615, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-1.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (616, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-2.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (617, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-3.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (618, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-5.png')
GO
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (619, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-6.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (620, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-8.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (621, 95, N'/uploads/product-images/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (622, 96, N'/uploads/product-images/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (623, 96, N'/uploads/product-images/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (624, 96, N'/uploads/product-images/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-3-1648028376.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (625, 96, N'/uploads/product-images/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (626, 96, N'/uploads/product-images/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (627, 96, N'/uploads/product-images/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (628, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (629, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (630, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-4.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (631, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (632, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (633, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-7 (1).jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (634, 97, N'/uploads/product-images/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-8.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (635, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (636, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (637, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-4.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (638, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (639, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (640, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-7.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (641, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-8.png')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (642, 98, N'/uploads/product-images/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-9.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (643, 99, N'/uploads/product-images/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-12.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (644, 99, N'/uploads/product-images/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-13.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (645, 99, N'/uploads/product-images/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-14.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (646, 99, N'/uploads/product-images/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-15.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (647, 99, N'/uploads/product-images/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-19.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (648, 99, N'/uploads/product-images/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (649, 100, N'/uploads/product-images/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (650, 100, N'/uploads/product-images/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (651, 100, N'/uploads/product-images/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (652, 100, N'/uploads/product-images/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-5.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (653, 100, N'/uploads/product-images/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-6.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (654, 100, N'/uploads/product-images/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-12-1728300817.jpeg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (655, 101, N'/uploads/product-images/575441-711-giay-nike-air-jordan-1-high-gia-tot-den-king-shoes-1.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (656, 101, N'/uploads/product-images/575441-711-giay-nike-air-jordan-1-high-gia-tot-den-king-shoes-2.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (657, 101, N'/uploads/product-images/575441-711-giay-nike-air-jordan-1-high-gia-tot-den-king-shoes-3.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (658, 101, N'/uploads/product-images/575441-711-giay-nike-air-jordan-1-high-gia-tot-den-king-shoes-4.jpg')
INSERT [dbo].[childImage] ([Id], [ProductId], [ImagePath]) VALUES (659, 101, N'/uploads/product-images/575441-711-giay-nike-air-jordan-1-high-gia-tot-den-king-shoes-12.jpeg')
SET IDENTITY_INSERT [dbo].[childImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [Name], [Website], [Email], [Message], [Read], [CreatedDate]) VALUES (4, N'phamhiuhiu', N'https://www.facebook.com/pham.hieu.7525', N'susikimchi69@gmail.com', N'Giày của tôi bị lỗi rồi liên hệ với tôi qua Fb', 1, CAST(N'2025-05-16T11:26:21.847' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Name], [Website], [Email], [Message], [Read], [CreatedDate]) VALUES (8, N'Tuấn Anh', N'https://www.facebook.com/anh.nguye2003', N'TuanAnh@gmail.com', N'Giày của tôi bị hỏng tồi cần tư vấn ', 1, CAST(N'2025-05-16T12:35:41.570' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Name], [Website], [Email], [Message], [Read], [CreatedDate]) VALUES (9, N'Quốc Hồng', N'https://www.facebook.com/quoc.hong.9833', N'QuocHongHoa@gmail.com', N'Tôi cần tư vấn về giày cho phụ nữ', 1, CAST(N'2025-05-16T12:37:32.527' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Name], [Website], [Email], [Message], [Read], [CreatedDate]) VALUES (10, N'Tuấn Tú', N'https://www.facebook.com/Tuan.tu.1995', N'jack97@gmail.com', N'Tôi muốn tư vấn về giày', 1, CAST(N'2025-05-16T12:38:33.700' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Name], [Website], [Email], [Message], [Read], [CreatedDate]) VALUES (11, N'So long', N'https://www.facebook.com/le.long.1995', N'hinhao123@gmail.com', N'Kích thức phù hợp cho trẻ con', 1, CAST(N'2025-05-16T12:39:55.640' AS DateTime))
INSERT [dbo].[Contact] ([Id], [Name], [Website], [Email], [Message], [Read], [CreatedDate]) VALUES (12, N'Phạm Hịu', N'https://www.facebook.com/hieu.lpham.1020', N'Phamhiuhiu01@gmail.com', N'Giày gì cho người có màu da tối', 1, CAST(N'2025-05-16T12:40:52.793' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[New] ON 

INSERT [dbo].[New] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (4, N'Dệt may vẫn xuất khẩu tốt, một doanh nghiệp báo lãi tăng gần 50 lần', N'det-may-van-xuat-khau-tot-mot-doanh-nghiep-bao-lai-tang-gan-50-lan', N'Một doanh nghiệp Việt Nam chuyên sản xuất sợi, là đối tác của Nike, Adidas, Fast Retailing (Uniqlo)…ghi nhận lãi ròng trong quý đầu năm nay tăng hơn 4.900% so với cùng kỳ năm ngoái.', NULL, N'/uploads/new/tải xuống.jpg', CAST(N'2025-05-13T11:46:36.180' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[New] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (5, N'Quả bóng thông minh giúp xác định cầu thủ việt vị tại Euro 2024', N'qua-bong-thong-minh-giup-xac-dinh-cau-thu-viet-vi-tai-euro-2024', N'Adidas và UEFA đã tạo ra quả bóng thông minh sử dụng ở Euro 2024 giúp xác định xem một cầu thủ có việt vị hay không.', NULL, N'/uploads/new/Quả bóng thông minh.jpg', CAST(N'2025-05-13T11:49:40.990' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[New] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (6, N'Trụ sở Adidas bị khám xét 2 ngày liên tiếp trong cuộc điều tra trốn thuế 1 tỉ euro', N'tru-so-adidas-bi-kham-xet-2-ngay-lien-tiep-trong-cuoc-dieu-tra-tron-thue-1-ti-euro', N'Adidas cho biết cuộc điều tra có thể sẽ không gây “bất kỳ ảnh hưởng tài chính đáng kể nào” đến công ty.', N'<h1>Trụ sở Adidas bị kh&aacute;m x&eacute;t 2 ng&agrave;y li&ecirc;n tiếp trong cuộc điều tra trốn thuế 1 tỉ euro</h1>

<div class="detail-info" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: flex; margin-bottom: 24px; align-items: center; justify-content: space-between; padding-bottom: 24px; border-bottom: 1px solid rgb(226, 226, 226); font-family: Roboto; font-size: 14px;">
<div class="detail-author oneauthor" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; position: relative; cursor: pointer; display: flex; width: 290px; align-items: center;">
<div class="groupavtauthor" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; position: relative; display: flex; align-items: center; height: 32px;"><a class="avata" href="https://tuoitre.vn/tac-gia/thanh-hien-42217.htm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(102, 102, 102); outline: 0px; position: absolute; left: 0px; width: 32px; height: 32px; margin-right: 8px; border-radius: 50%; overflow: hidden;" title="THANH HIỀN"><img alt="tác giả" class="avt isauthor" src="https://static-tuoitre.tuoitre.vn/tuoitre/web_images/author_default.png" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:block; height:32px; image-rendering:-webkit-optimize-contrast; max-width:100%; object-fit:cover; text-rendering:geometricprecision; width:32px" /></a></div>

<div class="author-info" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; position: relative; left: 40px; display: flex; align-items: center; width: calc(100% - 45px);"><a class="name" href="https://tuoitre.vn/tac-gia/thanh-hien-42217.htm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 34, 34); outline: 0px; font-weight: 700; font-size: 13px; line-height: 16px; margin-right: 2px;" title="THANH HIỀN">THANH HIỀN</a></div>

<div class="swiper detail-author-list-sw" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; margin-right: auto; margin-left: auto; list-style: none; padding: 0px; position: absolute; overflow: hidden; z-index: 9; width: 202px; top: 34px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid rgb(242, 242, 242); box-shadow: rgba(0, 0, 0, 0.8) 2px 4px 8px; border-radius: 4px; opacity: 0; max-height: 0px;">
<div class="swiper-wrapper" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: content-box; outline: 0px; transition-property: transform; position: relative; width: 200.4px; height: 0px; z-index: 1; display: flex; transform: translate3d(0px, 0px, 0px); flex-direction: column;">&nbsp;</div>

<div class="swiper-scrollbar detail-author-list-sw-scrollbar" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; position: absolute; border-radius: 10px; background: 0px 0px; right: 3px; top: 0px; z-index: 50; width: 1px; height: 0px;">&nbsp;</div>
</div>
</div>

<div class="detail-info-action" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: flex; align-items: center;">
<div class="detail-player" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; width: 250px;">
<div class="embed-tts" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: flex; max-width: 100%; align-items: center;">
<div class="audioplayer" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; width: 250px; background-color: transparent !important;">
<div class="videoNewsPlayer streamid_20241212095309349-dimensions audioSwitchVoicePlayer-pc AudioSwitchVoice audioSwitchVoicePlayer default-skin player-user-inactive" id="streamid_20241212095309349" lang="vi" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; width: 250px; height: 35px; overflow: visible; z-index: 9999; vertical-align: top; color: rgb(255, 255, 255); background-color: black; position: relative; font-size: 10px; line-height: 1; font-family: Arial, Helvetica, sans-serif; padding: 0px !important; margin: 0px !important; background-image: initial !important; background-position: 0px 0px !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;">
<div class="audioSwitchVoicePlayer-area-control" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; position: absolute; top: 0px; left: 0px; width: 250px; height: 35px;">
<div class="paused user-inactive" id="context-stats" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; height: 35px; width: 250px;">
<div class="audioSwitchVoicePlayer-overlay clear" id="streamid_20241212095309349-overlay" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; user-select: none; -webkit-tap-highlight-color: transparent; padding: 0px; position: absolute; inset: 0px; height: 35px; cursor: pointer;">
<div class="overlay-shadow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin-left: 0px; margin-right: 0px; margin-top: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 250px; position: absolute; height: 3.5px; bottom: 0px; background: transparent; opacity: 1; margin-bottom: 0px !important; transition: 0.5s !important;">&nbsp;</div>

<div class="overlay-ad" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 250px; height: 35px; background: transparent; transition: 2s; opacity: 0;">&nbsp;</div>
</div>

<div class="AudioSwitchVoice-controlbar" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; background: rgb(241, 243, 244); width: 250px; height: 35px; display: flex; position: absolute; align-items: center; border-radius: 6px; justify-content: space-between; user-select: none; -webkit-tap-highlight-color: transparent;">
<div class="overlay1" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; position: relative; height: 35px; width: calc(100% - 95px);">
<div class="btnToggle" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px 0px 0px 5px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 30px; height: 30px; display: flex; align-items: center; justify-content: center; cursor: pointer;">&nbsp;</div>

<div class="progress" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; color: rgb(102, 102, 102); font-size: 13px; user-select: none; -webkit-tap-highlight-color: transparent; height: 35px; display: flex; align-items: center; justify-content: center; text-wrap-mode: nowrap; width: 85px;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; color: rgb(85, 85, 85); font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; font-weight: 600;">Nghe đọc b&agrave;i</div>
</div>

<div class="duration" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; color: rgb(102, 102, 102); font-size: 14px; user-select: none; -webkit-tap-highlight-color: transparent; width: 45px; height: 35px; display: flex; align-items: center; justify-content: center;">2:52</div>
</div>

<div class="overlay2" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; display: flex; align-items: center; position: relative; height: 35px;">
<div class="overlaySpeedRead" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: 11px; user-select: none; -webkit-tap-highlight-color: transparent; width: 50px; height: 35px; display: flex; cursor: pointer; position: relative; align-items: center;">
<div class="displaySpeedRead" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: 12px; user-select: none; -webkit-tap-highlight-color: transparent; width: 55px; height: 25px; display: flex; justify-content: space-around; align-items: center; position: relative;">
<div class="divider" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 1px; height: 15px; border-left: 1px solid rgba(85, 85, 85, 0.33);">&nbsp;</div>

<div class="speedRead" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; color: rgb(102, 102, 102); font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; border: 1px solid rgba(102, 102, 102, 0.44); border-radius: 5px; display: flex; align-items: center; justify-content: center; width: 35px; height: 20px; cursor: pointer;">1x</div>

<div class="divider" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 1px; height: 15px; border-left: 1px solid rgba(85, 85, 85, 0.33);">&nbsp;</div>
</div>
</div>

<div class="overlayAccentRead" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: 13px; user-select: none; -webkit-tap-highlight-color: transparent; width: 45px; height: 35px; display: flex; cursor: pointer; position: relative;">
<div class="overlayVoice" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 45px; display: flex; align-items: center; justify-content: center;">
<div class="iconAccentRead" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 18px; height: 18px;">&nbsp;</div>

<div class="iconAccentRead" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: inherit; outline: 0px; margin: 0px 10px 0px 0px; font-size: inherit; user-select: none; -webkit-tap-highlight-color: transparent; width: 18px; height: 18px;">&nbsp;</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="detail-follow-gg" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; margin-left: 8px; width: 182px;"><a href="https://news.google.com/publications/CAAqBwgKMKXAxAswyNvbAw?hl=vi&amp;gl=VN&amp;ceid=VN:vi" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(102, 102, 102); outline: 0px;" target="_blank" title="news google"><img alt="news google" src="https://static-tuoitre.tuoitre.vn/tuoitre/web_images/banner_gg_news_v2.png" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:block; height:34px; image-rendering:-webkit-optimize-contrast; max-width:100%; text-rendering:geometricprecision; width:182px" /></a></div>
</div>
</div>

<h2>Adidas cho biết cuộc điều tra c&oacute; thể sẽ kh&ocirc;ng g&acirc;y &ldquo;bất kỳ ảnh hưởng t&agrave;i ch&iacute;nh đ&aacute;ng kể n&agrave;o&rdquo; đến c&ocirc;ng ty.</h2>

<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; font-family: Roboto; font-size: 14px;">&nbsp;</div>

<div class="detail-cmain clearfix" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; clear: both; padding-bottom: 24px; border-bottom: 1px solid rgb(242, 242, 242); margin-bottom: 24px; font-family: Roboto; font-size: 14px;">
<div class="detail-content afcbc-body" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; font-size: 17px; line-height: 30px; color: rgb(34, 34, 34); max-width: 100%;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;"><a href="https://cdn2.tuoitre.vn/471584752817336320/2024/12/12/2024-11-23t090609z1924470700rc2q5bad7e8artrmadp3travel-cm-berlin-1733971738891934727417.jpg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px !important;" target="_blank"><img alt="Trụ sở Adidas bị khám xét 2 ngày liên tiếp trong cuộc điều tra trốn thuế 1 tỉ euro - Ảnh 1." class="lightbox-content" id="img_791497644959973376" src="https://cdn2.tuoitre.vn/thumb_w/730/471584752817336320/2024/12/12/2024-11-23t090609z1924470700rc2q5bad7e8artrmadp3travel-cm-berlin-1733971738891934727417.jpg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; height:auto; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Trụ sở Adidas bị khám xét 2 ngày liên tiếp trong cuộc điều tra trốn thuế 1 tỉ euro - Ảnh 1." /></a>

<div id="wrapper-inimage-pos-sponsor-0" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="in-images" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="zone-joqxux31" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="share-joqxuxkg" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">&nbsp;</div>
</div>
</div>
</div>
</div>

<p style="margin-left:0px; margin-right:0px">Cửa h&agrave;ng của Adidas tại Berlin, Đức - Ảnh: REUTERS</p>

<p>Theo tờ&nbsp;<em>Financial Times</em>, ng&agrave;y 11-12 l&agrave; ng&agrave;y thứ hai li&ecirc;n tiếp c&aacute;c c&ocirc;ng tố vi&ecirc;n h&igrave;nh sự v&agrave; điều tra vi&ecirc;n hải quan kh&aacute;m x&eacute;t trụ sở của g&atilde; khổng lồ đồ thể thao&nbsp;<a class="link-inline-content" href="https://tuoitre.vn/adidas.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px;" title="Adidas">Adidas</a>&nbsp;tại Đức.</p>

<p>Động th&aacute;i cho thấy mức độ nghi&ecirc;m trọng của cuộc điều tra k&eacute;o d&agrave;i nhiều năm về nghi vấn&nbsp;<a class="link-inline-content" href="https://tuoitre.vn/eu-tinh-mo-rong-danh-sach-cac-thien-duong-tron-thue-20191207144341016.htm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px;" title="trốn thuế">trốn thuế</a>&nbsp;của thương hiệu thể thao n&agrave;y, với số tiền c&oacute; thể l&ecirc;n tới hơn 1,1 tỉ euro.</p>

<p>Văn ph&ograve;ng C&ocirc;ng tố vi&ecirc;n ch&acirc;u &Acirc;u (EPPO), c&oacute; trụ sở tại Luxembourg, tuy&ecirc;n bố đang tiến h&agrave;nh &quot;điều tra h&igrave;nh sự&rdquo; đối với &quot;một tập đo&agrave;n của Đức hoạt động trong lĩnh vực kinh doanh đồ thể thao&rdquo; về &quot;nghi ngờ trốn thuế li&ecirc;n quan đến thuế hải quan v&agrave; thuế b&aacute;n h&agrave;ng nhập khẩu&rdquo;.</p>

<p>EPPO cho biết c&aacute;c vi phạm c&oacute; thể xảy ra tại Đức v&agrave; &Aacute;o, g&acirc;y &ldquo;tổn thất cho ng&acirc;n s&aacute;ch Li&ecirc;n minh ch&acirc;u &Acirc;u&rdquo;. Tuy nhi&ecirc;n EPPO kh&ocirc;ng n&ecirc;u đ&iacute;ch danh Adidas.</p>

<p>Adidas x&aacute;c nhận đ&atilde; bị kh&aacute;m x&eacute;t v&agrave; cho biết c&ocirc;ng ty đang &ldquo;hợp t&aacute;c với c&aacute;c&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/co-quan-chuc-nang.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px;" target="_blank" title="cơ quan chức năng">cơ quan chức năng</a>, cung cấp c&aacute;c t&agrave;i liệu v&agrave; th&ocirc;ng tin cần thiết&rdquo;.</p>

<p>Một số nguồn thạo tin cho biết ngo&agrave;i&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/tru-so-chinh.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px;" target="_blank" title="trụ sở chính">trụ sở ch&iacute;nh</a>&nbsp;của Adidas ở Herzogenaurach (Đức), nhiều địa điểm kinh doanh v&agrave; nh&agrave; ri&ecirc;ng của nh&acirc;n vi&ecirc;n c&ocirc;ng ty cũng bị kh&aacute;m x&eacute;t.</p>

<p>Một nguồn tin tiết lộ với&nbsp;<em>Financial Times&nbsp;</em>rằng lệnh kh&aacute;m x&eacute;t đưa ra con số thiệt hại thuế t&iacute;ch lũy ước t&iacute;nh vượt qu&aacute; 1,1 tỉ euro. EPPO, cơ quan hải quan Đức v&agrave; Adidas từ chối b&igrave;nh luận về số tiền cũng như số lượng c&aacute; nh&acirc;n li&ecirc;n quan.</p>

<div class="VCSortableInPreviewMode  alignRight" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; display: inline-block; flex-direction: column; margin: 0px auto 15px 15px; position: relative; transition: 0.3s ease-in-out; width: 328.5px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; float: right;">
<div class="kbwscwl-relatedbox type-2 tuoitre" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; float: right; margin-bottom: 0px; border-top: 3px solid rgb(237, 28, 36); border-bottom: 3px solid rgb(237, 28, 36); width: 328.5px;">
<ul>
	<li>
	<h4><a class="title link-callout" href="https://tuoitre.vn/eu-dieu-tra-duong-day-tron-328-trieu-usd-thue-cua-cac-nha-xuat-khau-trung-quoc-20230329070957315.htm" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(51, 51, 51); outline: 0px; font-size: 16px; margin-bottom: 5px; display: block; line-height: 19px;" target="_blank">EU điều tra đường d&acirc;y trốn 328 triệu USD thuế của c&aacute;c nh&agrave; xuất khẩu Trung Quốc</a></h4>
	</li>
</ul>
</div>
</div>

<p>Adidas kh&ocirc;ng mong đợi &ldquo;bất kỳ t&aacute;c động t&agrave;i ch&iacute;nh đ&aacute;ng kể n&agrave;o&rdquo; từ cuộc điều tra, đồng thời cũng đ&atilde; biết về cuộc điều tra &ldquo;trong nhiều năm&rdquo;.</p>

<div id="InreadPc" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="zone-jnvk0c1v" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="share-jnvk0cro" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="placement-l6g5xam8" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="banner-jnvk0c1v-l6g5xbac" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; min-height: 0px; min-width: 0px;">
<div id="slot-1-jnvk0c1v-l6g5xbac" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">
<div id="bg_1036166879" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px;">&nbsp;</div>

<div class="bg-ssp-6879" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; margin-left: auto; margin-right: auto; width: 600px; height: 450px; position: relative !important;">
<div id="aswift_1_host" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; outline: 0px; border: none; height: 360px; width: 640px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-block;"><ins><iframe frameborder="0" height="360" id="aswift_1" name="aswift_1" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?gdpr=0&amp;client=ca-pub-4438672779115530&amp;output=html&amp;h=360&amp;slotname=1721124552&amp;adk=2479238369&amp;adf=476394285&amp;pi=t.ma~as.1721124552&amp;w=640&amp;abgtt=6&amp;lmt=1747114474&amp;format=640x360&amp;url=https%3A%2F%2Ftuoitre.vn%2Ftru-so-adidas-bi-kham-xet-2-ngay-lien-tiep-trong-cuoc-dieu-tra-tron-thue-1-ti-euro-20241212095309349.htm&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTM2LjAuNzEwMy45MyIsbnVsbCwwLG51bGwsIjY0IixbWyJDaHJvbWl1bSIsIjEzNi4wLjcxMDMuOTMiXSxbIkdvb2dsZSBDaHJvbWUiLCIxMzYuMC43MTAzLjkzIl0sWyJOb3QuQS9CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1747114474234&amp;bpp=2&amp;bdt=1625&amp;idt=152&amp;shv=r20250508&amp;mjsv=m202505070101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D472d71d7039b4177%3AT%3D1747110650%3ART%3D1747113339%3AS%3DALNI_MarkMhLQ8NjT55QzhE-4hZhETiGoA&amp;eo_id_str=ID%3D7d1793969fa3ca98%3AT%3D1747110650%3ART%3D1747113339%3AS%3DAA-Afjaz6qPUl4ApLenOaTJse3z8&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=2857205778949&amp;frm=20&amp;pv=1&amp;u_tz=420&amp;u_his=6&amp;u_h=864&amp;u_w=1536&amp;u_ah=864&amp;u_aw=1536&amp;u_cd=24&amp;u_sd=1.25&amp;dmc=8&amp;adx=294&amp;ady=1962&amp;biw=1521&amp;bih=776&amp;scr_x=0&amp;scr_y=0&amp;eid=95358863%2C95358865%2C31092113%2C31092193%2C31092201%2C42533293%2C31091873%2C95360294&amp;oid=2&amp;pvsid=2216461694059073&amp;tmod=1315358695&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Ftuoitre.vn%2Fadidas.html&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1536%2C0%2C1536%2C864%2C1536%2C776&amp;vis=1&amp;rsz=%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=0&amp;bc=31&amp;bz=1&amp;td=1&amp;tdf=2&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;dtd=186" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; left: 0px; position: absolute; top: 0px; border-width: 0px; border-style: initial; width: 640px; height: 360px;" title="Advertisement" width="640"></iframe></ins></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<p>C&ocirc;ng ty cho biết c&aacute;c h&agrave;nh vi bị điều tra diễn ra trong giai đoạn 5 năm, từ th&aacute;ng 10-2019 đến th&aacute;ng 8-2024.</p>

<p>G&atilde; khổng lồ đồ thể thao n&oacute;i rằng vấn đề ph&aacute;t sinh do &ldquo;sự kh&aacute;c biệt trong c&aacute;ch giải th&iacute;ch luật ph&aacute;p của Đức v&agrave; ch&acirc;u &Acirc;u&rdquo;, đồng thời khẳng định &ldquo;tiếp tục l&agrave;m việc chặt chẽ với c&aacute;c cơ quan hải quan&rdquo;.</p>

<p>Năm 2022, Adidas tiết lộ đ&atilde; tăng c&aacute;c khoản tr&iacute;ch lập dự ph&ograve;ng cho &ldquo;rủi ro li&ecirc;n quan đến hải quan&rdquo;, nhưng kh&ocirc;ng n&ecirc;u cụ thể con số.</p>

<p>Khi đ&oacute;, Adidas cho biết c&aacute;c khoản tr&iacute;ch lập đ&atilde; được gộp v&agrave;o khoản lỗ hoạt động một lần trị gi&aacute; 350 triệu euro, bao gồm cả chi ph&iacute; r&uacute;t hoạt động tại Nga, giải quyết tranh chấp ph&aacute;p l&yacute; v&agrave; c&aacute;c chi ph&iacute; t&aacute;i cấu tr&uacute;c.</p>

<p>C&aacute;c nguồn tin cũng tiết lộ ngo&agrave;i c&aacute;c khoản dự ph&ograve;ng, Adidas đ&atilde; chi trả một số khoản thuế v&agrave; thuế quan.</p>

<p>Một phần lớn trong số tiền thuế đang bị điều tra li&ecirc;n quan đến&nbsp;<a class="VCCTagItemInNews" href="https://tuoitre.vn/thue-gia-tri-gia-tang.html" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px;" target="_blank" title="thuế giá trị gia tăng">thuế gi&aacute; trị gia tăng</a>&nbsp;(VAT) h&agrave;ng nhập khẩu chưa được Adidas khai b&aacute;o v&agrave; nộp.</p>

<p>V&agrave; v&igrave; c&ocirc;ng ty sẽ nhận được khoản ho&agrave;n thuế tương đương n&ecirc;n điều n&agrave;y sẽ kh&ocirc;ng ảnh hưởng đến lợi nhuận của Adidas.</p>

<p>Cuộc điều tra thuế l&agrave; vụ b&ecirc; bối mới nhất xảy ra với Adidas sau cuộc chia tay thảm hại với nam rapper Kanye West do những b&igrave;nh luận ti&ecirc;u cực của nghệ sĩ n&agrave;y.</p>
</div>
</div>
', N'/uploads/new/Trụ sở Adidas bị khám xét 2 ngày liên tiếp trong cuộc điều tra trốn thuế 1 tỉ euro.jpg', CAST(N'2025-05-13T12:35:24.003' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[New] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (7, N'Adidas cam kết mở rộng đầu tư tại Việt Nam', N'adidas-cam-ket-mo-rong-dau-tu-tai-viet-nam', N'TTO - Chiều 31-10, tại Trụ sở Chính phủ, Thủ tướng Phạm Minh Chính tiếp Tổng giám đốc Tập đoàn Adidas Kasper Rorsted sau hai lần điện đàm trước đó vào tháng 9-2021 và tháng 3-2022.', N'<h1>Adidas cam kết mở rộng đầu tư tại Việt Nam</h1>

<div class="detail-info" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; display: flex; margin-bottom: 24px; align-items: center; justify-content: space-between; padding-bottom: 24px; border-bottom: 1px solid rgb(226, 226, 226); font-family: Roboto; font-size: 14px;">
<div class="detail-author oneauthor" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; position: relative; cursor: pointer; display: flex; width: 290px; align-items: center;">
<div class="groupavtauthor" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; position: relative; display: flex; align-items: center; height: 32px;"><span><img alt="TTXVN" src="https://static-tuoitre.tuoitre.vn/tuoitre/web_images/author_default.png" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:block; height:32px; image-rendering:-webkit-optimize-contrast; max-width:100%; object-fit:cover; text-rendering:geometricprecision; width:32px" /></span></div>

<div class="author-info" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; position: relative; left: 40px; display: flex; align-items: center; width: calc(100% - 45px);"><strong>TTXVN</strong></div>
</div>

<div class="detail-info-action" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; display: flex; align-items: center;">
<div class="detail-player" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; width: 250px;">&nbsp;</div>

<div class="detail-follow-gg" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin-left: 8px; width: 182px;"><a href="https://news.google.com/publications/CAAqBwgKMKXAxAswyNvbAw?hl=vi&amp;gl=VN&amp;ceid=VN:vi" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(102, 102, 102); outline: 0px;" target="_blank" title="news google"><img alt="news google" src="https://static-tuoitre.tuoitre.vn/tuoitre/web_images/banner_gg_news_v2.png" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:block; height:34px; image-rendering:-webkit-optimize-contrast; max-width:100%; text-rendering:geometricprecision; width:182px" /></a></div>
</div>
</div>

<h2>TTO - Chiều 31-10, tại Trụ sở Ch&iacute;nh phủ, Thủ tướng Phạm Minh Ch&iacute;nh tiếp Tổng gi&aacute;m đốc Tập đo&agrave;n Adidas Kasper Rorsted sau hai lần điện đ&agrave;m trước đ&oacute; v&agrave;o th&aacute;ng 9-2021 v&agrave; th&aacute;ng 3-2022.</h2>

<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; font-family: Roboto; font-size: 14px;">&nbsp;</div>

<div class="detail-cmain clearfix" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; clear: both; padding-bottom: 24px; border-bottom: 1px solid rgb(242, 242, 242); margin-bottom: 24px; font-family: Roboto; font-size: 14px;">
<div class="detail-content afcbc-body" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; font-size: 17px; line-height: 30px; color: rgb(34, 34, 34); max-width: 100%;">
<div class="VCSortableInPreviewMode" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; display: inline-block; flex-direction: column; margin: 0px auto 15px; position: relative; transition: 0.3s ease-in-out; width: 730px; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%;">
<div style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;"><a href="https://cdn2.tuoitre.vn/2022/10/31/tap-doan-adidas-31102022-1667221747902187689419.jpeg" rel="nofollow" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; text-decoration-line: none; color: rgb(34, 106, 197); outline: 0px !important;" target="_blank"><img alt="Adidas cam kết mở rộng đầu tư tại Việt Nam - Ảnh 1." class="lightbox-content" id="img_342ef650-591d-11ed-8773-7d1eb3cda8b8" src="https://cdn2.tuoitre.vn/thumb_w/730/2022/10/31/tap-doan-adidas-31102022-1667221747902187689419.jpeg" style="-webkit-font-smoothing:antialiased; box-sizing:border-box; color:transparent; display:inline-block; height:auto; image-rendering:-webkit-optimize-contrast; margin:0px auto; max-width:100%; text-rendering:geometricprecision; vertical-align:top; width:730px" title="Adidas cam kết mở rộng đầu tư tại Việt Nam - Ảnh 1." /></a>

<div id="wrapper-inimage-pos-sponsor-0" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="in-images" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="zone-joqxux31" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="share-joqxuxkg" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">&nbsp;</div>
</div>
</div>
</div>
</div>

<div class="PhotoCMS_Caption" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; max-width: 100%; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-bottom: 1px solid rgb(242, 242, 242); padding: 8px 0px;">
<p style="margin-left:0px; margin-right:0px">Thủ tướng Phạm Minh Ch&iacute;nh (thứ năm từ phải sang) v&agrave; &ocirc;ng Kasper Rorsted, tổng gi&aacute;m đốc Tập đo&agrave;n Adidas, c&ugrave;ng c&aacute;c th&agrave;nh vi&ecirc;n đo&agrave;n - Ảnh: TTXVN</p>
</div>
</div>

<p>Thủ tướng Phạm Minh Ch&iacute;nh ch&uacute;c mừng Tập đo&agrave;n Adidas đ&atilde; c&oacute; những kết quả kinh doanh hết sức t&iacute;ch cực trong năm 2022 v&agrave; Việt Nam tiếp tục l&agrave; địa b&agrave;n chiến lược của Adidas. Việt Nam l&agrave; nguồn cung ứng quan trọng nhất cho Adidas.</p>

<p>Thủ tướng Phạm Minh Ch&iacute;nh cho biết Việt Nam đang x&acirc;y dựng nền kinh tế độc lập, tự chủ gắn với chủ động, t&iacute;ch cực hội nhập quốc tế s&acirc;u rộng, thực chất, hiệu quả. Ch&iacute;nh phủ Việt Nam v&agrave; c&aacute; nh&acirc;n Thủ tướng lu&ocirc;n quan t&acirc;m, tạo điều kiện thuận lợi để Adidas duy tr&igrave;, mở rộng v&agrave; ph&aacute;t triển tại Việt Nam, tr&ecirc;n tinh thần &ldquo;lợi &iacute;ch h&agrave;i h&ograve;a, rủi ro chia sẻ&rdquo;.&nbsp;</p>

<p>Qua đ&oacute; g&oacute;p phần v&agrave;o kết quả hoạt động chung của tập đo&agrave;n cũng như đ&oacute;ng g&oacute;p v&agrave;o ph&aacute;t triển kinh tế - x&atilde; hội của Việt Nam, quan hệ hợp t&aacute;c giữa Việt Nam v&agrave; Đức.</p>

<p>Trước mắt, Việt Nam đang chuẩn bị để đ&oacute;n Thủ tướng Cộng h&ograve;a li&ecirc;n bang Đức thăm Việt Nam trong thời gian tới.</p>

<p>Tổng gi&aacute;m đốc Tập đo&agrave;n Adidas Kasper Rorsted ch&uacute;c mừng, b&agrave;y tỏ kh&acirc;m phục trước th&agrave;nh tựu của Việt Nam trong ph&ograve;ng, chống dịch COVID-19 v&agrave; kh&ocirc;i phục, ph&aacute;t triển kinh tế - x&atilde; hội, nhất l&agrave; trong kiềm chế lạm ph&aacute;t, c&oacute; mức tăng trưởng kinh tế ấn tượng.</p>

<p>&Ocirc;ng cho biết, trong thời gian tới, Adidas sẽ tiếp tục mở rộng sản xuất, kinh doanh, n&acirc;ng quy m&ocirc;, tạo việc l&agrave;m th&ecirc;m cho nhiều lao động để Việt Nam l&agrave; trung t&acirc;m sản xuất lớn của Adidas. &Ocirc;ng cũng đề nghị Ch&iacute;nh phủ Việt Nam tạo điều kiện để Adidas tham gia nhiều hơn trong đ&agrave;o tạo nguồn nh&acirc;n lực cho Việt Nam.</p>

<p>Thủ tướng Phạm Minh Ch&iacute;nh đồng &yacute; với kế hoạch mở rộng sản xuất, kinh doanh của Adidas cũng như tham gia v&agrave;o đ&agrave;o tạo nguồn nh&acirc;n lực, nhất l&agrave; kỹ năng nghề cho lao động Việt Nam.</p>

<p>Thủ tướng đề nghị tập đo&agrave;n tiếp tục mở rộng sản xuất kinh doanh l&acirc;u d&agrave;i, bền vững tại Việt Nam, đồng thời hỗ trợ, tạo điều kiện cho ng&agrave;y c&agrave;ng nhiều doanh nghiệp Việt Nam được tham gia v&agrave;o c&aacute;c c&ocirc;ng đoạn mang lại gi&aacute; trị cao trong chuỗi cung ứng to&agrave;n cầu của Adidas.</p>

<div id="InreadPc" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="zone-jnvk0c1v" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="share-jnvk0cro" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="placement-l6g5xam8" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="banner-jnvk0c1v-l6g5xbac" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; min-height: 0px; min-width: 0px;">
<div id="slot-1-jnvk0c1v-l6g5xbac" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">
<div id="bg_1036166879" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box;">&nbsp;</div>

<div class="bg-ssp-6879" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; margin-left: auto; margin-right: auto; width: 600px; height: 450px; position: relative !important;">
<div id="aswift_2_host" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; border: none; height: 360px; width: 640px; margin: 0px; padding: 0px; position: relative; visibility: visible; background-color: transparent; display: inline-block;"><ins><iframe frameborder="0" height="360" id="aswift_2" name="aswift_2" scrolling="no" src="https://googleads.g.doubleclick.net/pagead/ads?gdpr=0&amp;client=ca-pub-4438672779115530&amp;output=html&amp;h=360&amp;slotname=1721124552&amp;adk=2479238369&amp;adf=476394285&amp;pi=t.ma~as.1721124552&amp;w=640&amp;abgtt=6&amp;lmt=1747114669&amp;format=640x360&amp;url=https%3A%2F%2Ftuoitre.vn%2Fadidas-cam-ket-mo-rong-dau-tu-tai-viet-nam-20221031201504801.htm&amp;wgl=1&amp;uach=WyJXaW5kb3dzIiwiMTAuMC4wIiwieDg2IiwiIiwiMTM2LjAuNzEwMy45MyIsbnVsbCwwLG51bGwsIjY0IixbWyJDaHJvbWl1bSIsIjEzNi4wLjcxMDMuOTMiXSxbIkdvb2dsZSBDaHJvbWUiLCIxMzYuMC43MTAzLjkzIl0sWyJOb3QuQS9CcmFuZCIsIjk5LjAuMC4wIl1dLDBd&amp;dt=1747114669212&amp;bpp=1&amp;bdt=3242&amp;idt=1&amp;shv=r20250508&amp;mjsv=m202505070101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3D472d71d7039b4177%3AT%3D1747110650%3ART%3D1747114474%3AS%3DALNI_MarkMhLQ8NjT55QzhE-4hZhETiGoA&amp;eo_id_str=ID%3D7d1793969fa3ca98%3AT%3D1747110650%3ART%3D1747114474%3AS%3DAA-Afjaz6qPUl4ApLenOaTJse3z8&amp;prev_fmts=0x0%2C300x600&amp;nras=1&amp;correlator=7600756748317&amp;frm=20&amp;pv=1&amp;u_tz=420&amp;u_his=6&amp;u_h=864&amp;u_w=1536&amp;u_ah=864&amp;u_aw=1536&amp;u_cd=24&amp;u_sd=1.25&amp;dmc=8&amp;adx=294&amp;ady=2037&amp;biw=1521&amp;bih=776&amp;scr_x=0&amp;scr_y=284&amp;eid=95358863%2C95358865%2C31092113%2C31092196%2C31092201%2C95354562%2C31091873%2C95360294&amp;oid=2&amp;pvsid=545205740335437&amp;tmod=1315358695&amp;uas=0&amp;nvt=1&amp;ref=https%3A%2F%2Ftuoitre.vn%2Fadidas.html&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1536%2C0%2C1536%2C864%2C1536%2C776&amp;vis=1&amp;rsz=%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=0&amp;bc=31&amp;bz=1&amp;td=1&amp;tdf=2&amp;psd=W251bGwsbnVsbCxudWxsLDNd&amp;nt=1&amp;ifi=3&amp;uci=a!3&amp;btvi=1&amp;fsb=1&amp;dtd=7" style="-webkit-font-smoothing: antialiased; text-rendering: geometricprecision; box-sizing: border-box; left: 0px; position: absolute; top: 0px; border-width: 0px; border-style: initial; width: 640px; height: 360px;" title="Advertisement" width="640"></iframe></ins></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<p>Tổng gi&aacute;m đốc Tập đo&agrave;n Adidas b&agrave;y tỏ tin tưởng v&agrave;o quan hệ hợp t&aacute;c tốt đẹp giữa Việt Nam - Cộng h&ograve;a li&ecirc;n bang Đức n&oacute;i chung, trong đ&oacute; c&oacute; Tập đo&agrave;n Adidas. C&aacute; nh&acirc;n &ocirc;ng sẽ nỗ lực thực hiện v&agrave; vận động, t&aacute;c động c&aacute;c b&ecirc;n li&ecirc;n quan thực hiện c&aacute;c đề nghị của Thủ tướng Phạm Minh Ch&iacute;nh.</p>

<p>Tại buổi l&agrave;m việc,&nbsp;<span>Thủ tướng Ch&iacute;nh phủ vui mừng th&ocirc;ng b&aacute;o, hiện nay t&igrave;nh h&igrave;nh dịch COVID-19 ở Việt Nam đ&atilde; được kiểm so&aacute;t, tạo điều kiện để kinh tế hồi phục, tăng trưởng nhanh. Kinh tế vĩ m&ocirc; cơ bản ổn định, lạm ph&aacute;t được kiểm so&aacute;t, tăng trưởng kinh tế 9 th&aacute;ng của năm 2022 thuộc nh&oacute;m cao nhất trong khu vực, c&aacute;c c&acirc;n đối lớn của nền kinh tế được đảm bảo.</span></p>

<p>Thủ tướng cảm ơn sự hỗ trợ qu&yacute; b&aacute;u của Ch&iacute;nh phủ v&agrave; nh&acirc;n d&acirc;n Cộng h&ograve;a li&ecirc;n bang Đức, cũng như Tập đo&agrave;n Adidas trong c&ocirc;ng cuộc ph&ograve;ng, chống COVID-19, g&oacute;p phần gi&uacute;p Việt Nam vượt qua c&aacute;c giai đoạn kh&oacute; khăn nhất của đại dịch COVID-19 v&agrave; đạt được những kết quả như kể tr&ecirc;n.</p>

<p>Hiện Cộng h&ograve;a li&ecirc;n bang Đức l&agrave; thị trường lớn nhất của Việt Nam tại ch&acirc;u &Acirc;u, thị trường xuất khẩu lớn thứ 7 tr&ecirc;n thế giới của Việt Nam, l&agrave; cửa ng&otilde; quan trọng của h&agrave;ng h&oacute;a Việt Nam sang c&aacute;c thị trường kh&aacute;c ở ch&acirc;u &Acirc;u.</p>

<p>Việt Nam cũng l&agrave; đối t&aacute;c thương mại lớn nhất của Đức tại Đ&ocirc;ng Nam &Aacute;. Những kết quả tr&ecirc;n c&oacute; sự đ&oacute;ng g&oacute;p hết sức t&iacute;ch cực của Tập đo&agrave;n Adidas, g&oacute;p phần l&agrave;m s&acirc;u sắc hơn mối quan hệ hai nước Việt Nam - Đức.</p>
</div>
</div>
', N'/uploads/new/Adidas cam kết mở rộng đầu tư tại Việt Nam.jpg', CAST(N'2025-05-13T12:38:06.390' AS DateTime), NULL, CAST(N'2025-05-13T15:33:09.613' AS DateTime), NULL, 1)
INSERT [dbo].[New] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (8, N'World Cup và cuộc chiến của các thương hiệu', N'world-cup-va-cuoc-chien-cua-cac-thuong-hieu', N'TTCT - Để quảng bá cho chiến dịch World Cup, hãng đồ thể thao Nike đã phát hành một đoạn phim sử dụng thực tế ảo để so sánh Kylian Mbappe, Cristiano Ronaldo, Ronaldinho và Ronaldo "béo", qua các thời đại khác nhau, tạo ra từ trí tuệ nhân tạo.', N'<div class="block-cover-style" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-variant-emoji: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Roboto, sans-serif; font-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; background: url(&quot;&quot;) center center / cover no-repeat; color: rgb(0, 0, 0);">
<div class="box-top-style" style="box-sizing: border-box; margin: 0px; padding: 50px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; position: relative;">
<div class="block-cover-style" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-variant-emoji: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: Roboto, sans-serif; font-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; background: url(&quot;&quot;) center center / cover no-repeat; color: rgb(0, 0, 0);">
<div class="box-top-style" style="box-sizing: border-box; margin: 0px; padding: 50px 0px 0px; border: 0px; font: inherit; vertical-align: baseline; position: relative;">
<h1>World Cup v&agrave; cuộc chiến của c&aacute;c thương hiệu</h1>

<p>TTCT - Để quảng b&aacute; cho chiến dịch World Cup, h&atilde;ng đồ thể thao Nike đ&atilde; ph&aacute;t h&agrave;nh một đoạn phim sử dụng thực tế ảo để so s&aacute;nh Kylian Mbappe, Cristiano Ronaldo, Ronaldinho v&agrave; Ronaldo &quot;b&eacute;o&quot;, qua c&aacute;c thời đại kh&aacute;c nhau, tạo ra từ tr&iacute; tuệ nh&acirc;n tạo.</p>

<p><span>Ban đầu, Adidas chọn chủ đề &quot;Đo&agrave;n tụ gia đ&igrave;nh&quot; trong chiến dịch quảng b&aacute;, nhưng nhanh ch&oacute;ng &quot;quay xe&quot; sau đoạn phim của Nike: họ l&agrave;m ngay một clip kh&aacute;c cũng sử dụng thực tế ảo, quay Lionel Messi chơi b&oacute;ng với c&aacute;c phi&ecirc;n bản trẻ hơn của anh.</span></p>

<div class="VCSortableInPreviewMode" style="box-sizing: border-box; margin: 1.3em auto 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 11px; line-height: 1.45; font-family: Roboto; vertical-align: baseline; display: table; flex-direction: column; position: relative; transition: 0.3s ease-in-out; width: 699.2px; z-index: 2; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34);">
<div style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;"><img alt="World Cup và cuộc chiến của các thương hiệu - Ảnh 1." id="img_f9b59ce0-769f-11ed-9144-577026c5324c" src="https://cdn2.tuoitre.vn/thumb_w/730/2022/12/8/messi-bitget-read-only-1670466460978440451442.jpg" style="border:0px; box-sizing:border-box; color:transparent; display:inline-block; font:inherit; height:auto; margin:0px auto; max-width:100%; padding:0px; vertical-align:top; width:699.2px" title="World Cup và cuộc chiến của các thương hiệu - Ảnh 1." />
<div id="wrapper-inimage-pos-sponsor-0" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">
<div id="in-images" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">
<div id="zone-joqxux31" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">
<div id="share-joqxuxkg" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;">&nbsp;</div>
</div>
</div>
</div>
</div>

<div class="PhotoCMS_Caption" style="box-sizing: border-box; margin: -5px 0px 24px; padding: 5px 8px; border: 0px; font: inherit; vertical-align: baseline; background: rgb(233, 233, 233);">
<p>Messi v&agrave; Bitget: tiền số sẽ l&agrave; xu hướng t&agrave;i trợ ch&iacute;nh của b&oacute;ng đ&aacute; tương lai? Ảnh: bitget.com</p>
</div>
</div>

<h3 style="color:rgb(35, 31, 32); font-style:inherit; text-align:center"><span style="color:rgb(255, 0, 0)">Cạnh tranh tr&ecirc;n từng milimet</span></h3>

<p>Chuyện k&eacute;m miếng kh&oacute; chịu đến nỗi phải bắt chước đối thủ kiểu n&agrave;y c&oacute; lẽ l&agrave; điều chưa từng thấy trong lịch sử. Nhưng nh&igrave;n v&agrave;o thị trường trang phục v&agrave; thiết bị thể thao cực kỳ b&eacute;o bở, bạn hiểu được &yacute; ch&iacute; cạnh tranh của họ.</p>

<p>Thu nhập của Nike trong 12 th&aacute;ng, t&iacute;nh đến th&aacute;ng 8-2022, l&agrave; hơn 47 tỉ USD, với lợi nhuận r&ograve;ng 6 tỉ USD. Con số đ&oacute; của Adidas l&agrave; 22 tỉ v&agrave; 2,4 tỉ.&nbsp;</p>

<p>Cuối thập ni&ecirc;n n&agrave;y, người ta ước t&iacute;nh thị trường gi&agrave;y b&oacute;ng đ&aacute; sẽ c&oacute; quy m&ocirc; hơn 30 tỉ USD. Thị trường lớn đến mức chỉ tăng thị phần l&ecirc;n một phần trăm so với đối thủ cũng l&agrave; con số cực lớn.</p>

<p>Nike đ&atilde; t&agrave;i trợ trang phục v&agrave; dụng cụ thi đấu cho 13 trong 32 đội tuyển ở World Cup năm nay, bao gồm Anh, Ph&aacute;p v&agrave; Brazil.</p>

<p>Adidas, c&ocirc;ng ty đ&atilde; thay đổi nhận diện thương hiệu bằng c&aacute;ch đơn giản h&oacute;a logo v&agrave;o đầu năm nay, sản xuất trang phục cho bảy quốc gia, trong đ&oacute; Đức v&agrave; Argentina l&agrave; c&aacute;c đội tuyển ti&ecirc;u biểu.</p>

<p>Những giải đấu tầm cỡ World Cup, nh&igrave;n từ g&oacute;c độ thương hiệu, đều c&oacute; ảnh hưởng định h&igrave;nh sở th&iacute;ch của cả một thế hệ người ti&ecirc;u d&ugrave;ng.&nbsp;</p>

<p>N&oacute;i một c&aacute;ch dễ hiểu, ch&uacute;ng khiến c&aacute;c CĐV b&oacute;ng đ&aacute; c&oacute; cảm gi&aacute;c trung th&agrave;nh với một nh&agrave; sản xuất nhất định, l&yacute; tưởng nhất l&agrave; biến họ th&agrave;nh kh&aacute;ch h&agrave;ng trọn đời.</p>

<p>V&agrave; đối tượng để tranh gi&agrave;nh thị phần ch&iacute;nh l&agrave; th&ocirc;ng qua c&aacute;c ng&ocirc;i sao h&agrave;ng đầu. V&iacute; dụ như Messi: anh c&oacute; hợp đồng sử dụng gi&agrave;y của Adidas, nhưng CLB của anh, PSG, lại mặc trang phục của Nike.</p>

<p>&nbsp;Adidas kh&ocirc;ng thể sản xuất &aacute;o đấu hay mở c&aacute;c chiến dịch c&oacute; sự hiện diện của Messi trong m&agrave;u &aacute;o PSG. Cristiano Ronaldo cũng thế.&nbsp;</p>

<p>Anh đi gi&agrave;y Nike, nhưng &aacute;o đấu của Man United (giờ đ&atilde; l&agrave; CLB cũ) lại l&agrave; Adidas. Tuy nhi&ecirc;n ở World Cup, Argentina lại hợp t&aacute;c với Adidas, c&ograve;n Bồ Đ&agrave;o Nha được Nike t&agrave;i trợ.</p>

<p>Nỗ lực của Nike h&ograve;ng nuốt chửng những miếng b&aacute;nh lớn nhất thể hiện r&otilde; nhất qua việc mua lại quyền sản xuất trang phục thi đấu của đội tuyển Anh, một thỏa thuận k&eacute;o d&agrave;i đến năm 2030 với chi ph&iacute; l&ecirc;n đến hơn 400 triệu bảng Anh (488 triệu USD).&nbsp;</p>

<p>&Aacute;o đấu của tuyển Anh, trong nhiều năm, được Umbro cung cấp. Đấy l&agrave; nh&agrave; sản xuất c&oacute; truyền thống ở Anh, v&agrave; Li&ecirc;n đo&agrave;n B&oacute;ng đ&aacute; Anh bảo vệ Umbro đến c&ugrave;ng v&igrave; cho rằng đ&oacute; l&agrave; thương hiệu quốc gia. Nike l&agrave;m g&igrave;? Họ mua lu&ocirc;n Umbro!</p>

<div class="VCSortableInPreviewMode" style="box-sizing: border-box; margin: 1.3em auto 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 11px; line-height: 1.45; font-family: Roboto; vertical-align: baseline; display: table; flex-direction: column; position: relative; transition: 0.3s ease-in-out; width: 699.2px; z-index: 2; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34);">
<div style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;"><img alt="World Cup và cuộc chiến của các thương hiệu - Ảnh 2." id="img_1602a9c0-776c-11ed-b177-3fef378d453f" src="https://cdn2.tuoitre.vn/thumb_w/730/2022/12/9/maxresdefault-nike-da-1670554160851891353943.jpg" style="border:0px; box-sizing:border-box; color:transparent; display:inline-block; font:inherit; height:auto; margin:0px auto; max-width:100%; padding:0px; vertical-align:top; width:699.2px" title="World Cup và cuộc chiến của các thương hiệu - Ảnh 2." /></div>

<div class="PhotoCMS_Caption" style="box-sizing: border-box; margin: -5px 0px 24px; padding: 5px 8px; border: 0px; font: inherit; vertical-align: baseline; background: rgb(233, 233, 233);">
<p>Ảnh: YouTube</p>
</div>
</div>

<h3 style="color:rgb(35, 31, 32); font-style:inherit; text-align:center">B&aacute;o hiệu những tr&agrave;o lưu&nbsp;<span>ti&ecirc;u d&ugrave;ng mới</span></h3>

<p>T&agrave;i trợ cho một đội tuyển hay c&acirc;u lạc bộ b&oacute;ng đ&aacute; kh&ocirc;ng đơn thuần l&agrave; chuyện quảng c&aacute;o. Đ&oacute; c&ograve;n l&agrave; biểu tượng của địa vị.</p>

<p>Thậm ch&iacute;, n&oacute; khẳng định địa vị tối thượng cho những tập đo&agrave;n h&agrave;ng đầu sẵn s&agrave;ng chi trả c&aacute;i gi&aacute; rất đắt đỏ, v&agrave; đ&ocirc;i khi kh&ocirc;ng cầu mong thu lại ngay điều g&igrave; cả.&nbsp;</p>

<p>Đấy kh&ocirc;ng chỉ l&agrave; một giao dịch kinh doanh: đưa logo của c&ocirc;ng ty l&ecirc;n &aacute;o đấu đội tuyển Brazil, Argentina hay c&aacute;c CLB như Real Madrid, Liverpool c&oacute; nghĩa l&agrave; gắn thương hiệu của bạn với một biểu tượng to&agrave;n cầu.&nbsp;</p>

<p>Trong nhiều thập ni&ecirc;n, đ&oacute; l&agrave; con đường ngắn nhất để mua sự nhận diện của c&aacute;c tập đo&agrave;n sẵn tiền để đốt.</p>

<p>Theo d&otilde;i c&aacute;c khoản t&agrave;i trợ n&agrave;y trong nhiều thập ni&ecirc;n, c&oacute; thể nhận ra lịch sử ph&aacute;t triển của c&aacute;c m&ocirc; h&igrave;nh kinh doanh v&agrave; c&ocirc;ng nghệ.&nbsp;</p>

<p>Thay v&igrave; c&aacute;c c&ocirc;ng ty ri&ecirc;ng lẻ, thường th&igrave; to&agrave;n bộ c&aacute;c doanh nghiệp của một ng&agrave;nh đang gặp thời - từ &ocirc; t&ocirc;, c&ocirc;ng nghệ, b&aacute;n lẻ cho đến c&aacute;c trang web c&aacute; cược - đồng loạt nhảy v&agrave;o m&ocirc;n thể thao n&agrave;y ngay lập tức, với mong muốn thống trị thị trường to&agrave;n cầu trong b&oacute;ng đ&aacute;, cũng l&agrave; một phần của đời sống hằng ng&agrave;y, ngay lập tức.</p>

<p>Kh&ocirc;ng phải ngẫu nhi&ecirc;n m&agrave; c&aacute;c c&ocirc;ng ty điện thoại di động đ&atilde; chuyển sang t&agrave;i trợ cho c&aacute;c CLB b&oacute;ng đ&aacute; v&agrave;o đầu thi&ecirc;n ni&ecirc;n kỷ mới: với việc điện thoại cầm tay c&agrave;ng ng&agrave;y phổ biến v&agrave; c&ocirc;ng nghệ 3G được triển khai, c&aacute;c c&ocirc;ng ty như Samsung v&agrave; Vodafone kh&ocirc;ng qu&aacute; đắn đo khi quyết định trả số tiền kỷ lục cho c&aacute;c CLB th&agrave;nh c&ocirc;ng bậc nhất nước Anh.</p>

<p>Samsung chỉ l&agrave; một c&ocirc;ng ty nhỏ trong thế giới c&aacute;c c&aacute; mập sản xuất điện thoại di động khi bắt đầu thỏa thuận t&agrave;i trợ Chelsea v&agrave;o năm 2005. Khi hợp đồng n&agrave;y kết th&uacute;c năm 2015, Samsung đ&atilde; trở th&agrave;nh nh&agrave; sản xuất smartphone lớn nhất thế giới, c&ugrave;ng với th&agrave;nh c&ocirc;ng của Chelsea tr&ecirc;n s&acirc;n cỏ.</p>

<p>Trước đ&oacute;, c&aacute;c thương hiệu điện tử ti&ecirc;u d&ugrave;ng Nhật Bản l&agrave; những c&ocirc;ng ty c&ocirc;ng nghệ đầu ti&ecirc;n tham gia t&agrave;i trợ &aacute;o đấu.&nbsp;</p>

<p>Logo của họ tr&agrave;n ngập tr&ecirc;n &aacute;o đấu của c&aacute;c CLB từ Anh đến &Yacute; trong suốt hai thập ni&ecirc;n 1980 v&agrave; 1990, phản &aacute;nh sự ph&aacute;t triển mạnh mẽ của họ tr&ecirc;n to&agrave;n cầu. Đ&acirc;y l&agrave; những thập ni&ecirc;n thế giới bị thống trị bởi m&aacute;y Walkman v&agrave; tr&ograve; chơi điện tử Nhật Bản.</p>

<p>Những năm 2010, c&aacute;c c&ocirc;ng ty c&aacute; cược trực tuyến l&ecirc;n ng&ocirc;i. V&agrave;o cuối thập ni&ecirc;n, một nửa trong 20 CLB của Giải ngoại hạng Anh c&oacute; logo một h&atilde;ng c&aacute; cược ở mặt trước &aacute;o đấu, rất nhiều trong số đ&oacute; l&agrave; c&aacute;c c&ocirc;ng ty nhắm mục ti&ecirc;u đến kh&aacute;n giả ở ch&acirc;u &Aacute;.</p>

<p>Vậy lĩnh vực n&agrave;o sẽ thống trị thập ni&ecirc;n 2020? C&aacute;c nền tảng c&ocirc;ng nghệ gi&aacute;o dục đang bắt đầu nhảy v&agrave;o thị trường: Platzi (Colombia) t&agrave;i trợ cho CLB T&acirc;y Ban Nha Granada, c&ograve;n kỳ l&acirc;n Byju (Ấn Độ) t&agrave;i trợ cho Kerala Blasters.&nbsp;</p>

<div class="VCSortableInPreviewMode" style="box-sizing: border-box; margin: 1.3em auto 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 11px; line-height: 1.45; font-family: Roboto; vertical-align: baseline; display: table; flex-direction: column; position: relative; transition: 0.3s ease-in-out; width: 699.2px; z-index: 2; visibility: visible; overflow-wrap: break-word; cursor: default; max-width: 100%; color: rgb(34, 34, 34);">
<div style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;"><img alt="World Cup và cuộc chiến của các thương hiệu - Ảnh 3." id="img_47c130d0-776c-11ed-ba39-e3bf37b82439" src="https://cdn2.tuoitre.vn/thumb_w/730/2022/12/9/ss-lazio-v-acf-fiorentina-serie-a-16705542442421351041655.jpg" style="border:0px; box-sizing:border-box; color:transparent; display:inline-block; font:inherit; height:auto; margin:0px auto; max-width:100%; padding:0px; vertical-align:top; width:699.2px" title="World Cup và cuộc chiến của các thương hiệu - Ảnh 3." /></div>

<div class="PhotoCMS_Caption" style="box-sizing: border-box; margin: -5px 0px 24px; padding: 5px 8px; border: 0px; font: inherit; vertical-align: baseline; background: rgb(233, 233, 233);">
<p>Binance xuất hiện tr&ecirc;n &aacute;o đấu của Lazio. Ảnh: Calcio e Finanza</p>
</div>
</div>

<p>Một l&agrave;n s&oacute;ng khổng lồ kh&aacute;c đang ập đến: crypto (tiền điện tử). Từ giải b&oacute;ng rổ nh&agrave; nghề Mỹ NBA cho đến đua xe C&ocirc;ng thức I, logo tiền điện tử xuất hiện khắp nơi v&agrave; b&oacute;ng đ&aacute; kh&ocirc;ng phải ngoại lệ.&nbsp;</p>

<p>Logo của s&agrave;n giao dịch tiền điện tử lớn nhất thế giới Binance xuất hiện tr&ecirc;n &aacute;o đấu của Lazio, trong khi Inter Milan đ&atilde; c&oacute; nh&agrave; t&agrave;i trợ &aacute;o đấu thứ hai dựa tr&ecirc;n c&ocirc;ng nghệ blockchain.</p>

<p>Crypto.com, s&agrave;n giao dịch ph&aacute;t triển nhanh bậc nhất thế giới với hơn 10 triệu kh&aacute;ch h&agrave;ng v&agrave; hơn 4.000 nh&acirc;n vi&ecirc;n tr&ecirc;n to&agrave;n thế giới, đ&atilde; trở th&agrave;nh nh&agrave; t&agrave;i trợ ch&iacute;nh thức của World Cup 2022.&nbsp;</p>

<p>Th&aacute;ng 11-2021, s&agrave;n giao dịch n&agrave;y mua lại quyền sở hữu t&ecirc;n s&acirc;n Staples Center tại Los Angeles (Mỹ) v&agrave; đổi n&oacute; th&agrave;nh Crypto.com Arena với chi ph&iacute; 700 triệu USD.</p>

<p>Ngo&agrave;i Crypto.com, hai s&agrave;n giao dịch tiền điện tử kh&aacute;c l&agrave; Bitget v&agrave; OKX cũng sử dụng World Cup như một b&agrave;n đạp để quảng b&aacute;.&nbsp;</p>

<p>Ngo&agrave;i việc t&agrave;i trợ cho giải đấu, họ c&ograve;n tổ chức những phi&ecirc;n bản web 3 của World Cup, đầu tư v&agrave;o c&aacute;c token đội tuyển quốc gia, cũng như triển khai c&aacute;c chiến dịch tiếp thị đắt đỏ.</p>

<p>Messi, huyền thoại người Argentina từng bảy lần gi&agrave;nh Quả b&oacute;ng v&agrave;ng, đ&atilde; c&ocirc;ng bố hợp t&aacute;c với s&agrave;n Bitget trước khi World Cup khởi tranh.&nbsp;</p>

<p>S&agrave;n tiền điện tử n&agrave;y ngay sau đ&oacute; tung ra bộ phim với sự tham gia của Messi v&agrave; một loạt hoạt động quảng b&aacute; kh&aacute;c tr&ecirc;n mọi k&ecirc;nh truyền th&ocirc;ng x&atilde; hội của họ.&nbsp;</p>

<p>Bitget, th&agrave;nh lập năm 2018, l&agrave; s&agrave;n giao dịch tiền điện tử nằm trong top 5 to&agrave;n cầu, hiện phục vụ hơn 8 triệu người d&ugrave;ng tại hơn 100 quốc gia tr&ecirc;n to&agrave;n thế giới.</p>

<p>Theo d&otilde;i c&acirc;u chuyện t&agrave;i trợ ở World Cup n&oacute;i ri&ecirc;ng v&agrave; b&oacute;ng đ&aacute; n&oacute;i chung gi&uacute;p ch&uacute;ng ta nhận ra những tr&agrave;o lưu mới n&agrave;y, những thứ sẽ nhanh ch&oacute;ng vươn tầm ảnh hưởng ra khỏi địa hạt b&oacute;ng đ&aacute; đơn thuần, đi v&agrave;o thế giới đại ch&uacute;ng v&agrave; định h&igrave;nh ti&ecirc;u d&ugrave;ng những năm tiếp theo.■</p>
</div>
</div>
</div>
</div>
', N'/uploads/new/World Cup và cuộc chiến của các thương hiệu.jpg', CAST(N'2025-05-13T15:32:00.000' AS DateTime), NULL, CAST(N'2025-05-13T15:33:03.963' AS DateTime), NULL, 1)
INSERT [dbo].[New] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (9, N'Exercises For Ankle Strength', N'exercises-for-ankle-strength', N'Give some love to your ankles—your powerhouse joints for balance and stability. Learn five ankle stability exercises with physical therapist Josh Davis.', N'<h1>Exercises For Ankle Strength</h1>

<p>Give some love to your ankles&mdash;your powerhouse joints for balance and stability. Learn five ankle stability exercises with physical therapist Josh Davis.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<h2>Why Is Ankle Strengthening Important?</h2>

<div style="box-sizing: border-box;">We all know strength exercises are beneficial, but have you ever thought to strengthen your ankles? This often-forgotten joint is crucial for a well-balanced, strong body for all. &ldquo;Everybody can benefit from ankle strengthening,&rdquo; said Josh Davis, a physical therapist in Portland, Oregon. Davis sees many youth to professional athletes for ankle injuries&mdash;especially those who encounter repetitive movements like dancers and runners. But he also sees older people who may have lost some muscle mass over time. By working to strengthen your ankles with exercises like the ones below, you&rsquo;re improving your physical health and longevity overall.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Similar to&nbsp;<a href="https://www.adidas.com.vn/vi/blog/889654-8-exercises-for-strong-knees" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">exercises for stronger knees</a>, Davis&rsquo;s methods for stabilizing ankles involve working your entire lower leg and foot. &ldquo;The muscles around the lower leg and ankle are going to help support, improve your balance and proprioception, prevent any falls, improve your stability and allow you to absorb impact,&rdquo; said Davis.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Here are five ankle stability exercises provided by Davis for you to try. Mix them into your usual workout, or give them a go while watching TV.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>Five Exercises For Ankle Strength</h2>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Exercises-for-Ankle-Strength-Blog-Image-01" src="https://brand.assets.adidas.com/capi/viVN/Images/exercises-for-ankle-strength-blog-image-01_337-985461.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Exercises-for-Ankle-Strength-Blog-Image-01" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Resistance Band Tug</h3>

<div style="box-sizing: border-box;"><strong>Equipment:</strong>&nbsp;Resistance band and a towel</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Instructions:</strong></div>

<ol>
	<li>Sit with your left leg straight in front of you and your right knee bent. Loop the band over your left foot, holding it with your right arm.</li>
	<li>Smoothly move your foot left and right, holding the band taught in the opposite direction to add resistance. Repeat the motion to the left and then downward, holding the band in the opposite direction for resistance.</li>
</ol>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Exercises-for-Ankle-Strength-Blog-Image-02" src="https://brand.assets.adidas.com/capi/viVN/Images/exercises-for-ankle-strength-blog-image-02_337-985460.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Exercises-for-Ankle-Strength-Blog-Image-02" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Toe Raise</h3>

<div style="box-sizing: border-box;"><strong>Equipment:</strong>&nbsp;A chair for balance if needed</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Instructions:</strong></div>

<ol>
	<li>Stand tall with feet hip-width apart. Keep your back straight, shoulders back and down, and core engaged.</li>
	<li>Raise your toes slowly, keeping your knees straight but not locked. Pause for one second. Lower your toes back to the ground, returning to the starting position. Repeat movement for 30 seconds.</li>
</ol>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Exercises-for-Ankle-Strength-Blog-Image-03" src="https://brand.assets.adidas.com/capi/viVN/Images/exercises-for-ankle-strength-blog-image-03_337-985459.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Exercises-for-Ankle-Strength-Blog-Image-03" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Calf Raise</h3>

<div style="box-sizing: border-box;"><strong>Equipment:</strong>&nbsp;A chair for balance if needed</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Instructions:</strong></div>

<ol>
	<li>Stand tall with feet hip-width apart. Keep your back straight, shoulders back and down, and core engaged.</li>
	<li>Raise your heels off the ground, hold for a second, then slowly lower your heels to the ground. Avoid rolling your ankles outward with each raise.</li>
</ol>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Exercises-for-Ankle-Strength-Blog-Image-04" src="https://brand.assets.adidas.com/capi/viVN/Images/exercises-for-ankle-strength-blog-image-04_337-985450.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Exercises-for-Ankle-Strength-Blog-Image-04" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Four Square Drill</h3>

<div style="box-sizing: border-box;"><strong>Equipment:</strong>&nbsp;Tape on the floor or cones. If you don&rsquo;t have props, visualize a large plus sign about one foot across in width and height.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Instructions:</strong></div>

<ol>
	<li>Mark the ground with four quadrants.</li>
	<li>Stand in the lower left quadrant and hop forward, backward and side to side, hitting each square.</li>
	<li>For an added challenge, hop on one leg.</li>
</ol>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Exercises-for-Ankle-Strength-Blog-Image-05" src="https://brand.assets.adidas.com/capi/viVN/Images/exercises-for-ankle-strength-blog-image-05_337-985458.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Exercises-for-Ankle-Strength-Blog-Image-05" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Single-Leg Deadlift</h3>

<div style="box-sizing: border-box;"><strong>Equipment:</strong>&nbsp;Dumbbell or kettlebell</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Instructions:</strong></div>

<ol>
	<li>Start standing with your feet hip-width apart. Hold a dumbbell in your left hand.</li>
	<li>Shift your weight onto your right foot with your knee slightly bent. Maintain a neutral spine as you hinge your hips forward to bring your torso parallel to the floor as you lift your left leg.</li>
	<li>Come back up to standing and lower your left leg back to the floor. Between reps, try not to touch your left foot to the ground to test your balance.</li>
</ol>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Exercises-for-Ankle-Strength-Blog-Image-06" src="https://brand.assets.adidas.com/capi/viVN/Images/exercises-for-ankle-strength-blog-image-06_337-985451.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Exercises-for-Ankle-Strength-Blog-Image-06" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">These ankle stability exercises are some quick and easy ways to get stronger every day. You can slip them in as a warmup or a cooldown to your usual workout&mdash;or try moves like calf and toe raises while brushing your teeth. Whichever way you decide, Davis suggests doing exercises for ankle strength at least two to three days a week.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">You can also use your usual strength workouts as opportunities to strengthen ankles and balance. &ldquo;Any time that you take a strength movement such as a squat, deadlift, or a lunge and you do it in a single-leg capacity, you are also strengthening all the muscles of the foot, ankle, calf, and your balance and proprioception. So that&#39;s why as a trainer and physical therapist, I always recommend that you have a good variety of single-leg training,&rdquo; said Davis. The single-leg deadlift is a great place to start but see where in your training you can work in some more ankle exercises to become stronger and balanced overall.</div>
</div>
</div>
', N'/uploads/new/tải xuống (9).jpg', CAST(N'2025-05-14T11:49:54.763' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[New] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (8, 2, N'OD638824029958346254', N'Phạm Quốc Hiệu', N'Phamhiuhiu01', N'0969670959', N'HaNoi', CAST(2500000 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (13, 2, N'OD638829983416890159', N'Phạm Quốc Hiệu', N'Phamhiuhiu01@gmail.com', N'0969670959', N'HaNoi', CAST(8500000 AS Decimal(18, 0)), 3, 2, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (14, 3, N'OD638829985090272154', N'Quốc Hịu', N'hiu@gmail.com', N'0973939739', N'Nhị khê Thường Tín Hà nội', CAST(3600000 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (15, 3, N'OD638829985327963660', N'Quốc Hịu', N'hiu@gmail.com', N'0973939739', N'Nhị khê Thường Tín Hà nội', CAST(2000000 AS Decimal(18, 0)), 1, 1, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (16, 5, N'OD638829987419424798', N'Nguyên Hu Tao', N'susikimchi12@gmail.com', N'0937481828', N'Đại Áng Hà nội', CAST(13700000 AS Decimal(18, 0)), 4, 1, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (17, 5, N'OD638829988501472141', N'Nguyên Hu Tao', N'susikimchi12@gmail.com', N'0937481828', N'Đại Áng Hà nội', CAST(3000000 AS Decimal(18, 0)), 1, 2, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (18, 2, N'OD638835071201067578', N'Phạm Hiệu', N'Phamhiuhiu01@gmail.com', N'0969670959', N'HaNoi', CAST(2000000 AS Decimal(18, 0)), 1, 1, CAST(N'2025-05-22T10:38:40.107' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (20, 2, N'OD638835163551836757', N'Tuệ', N'Phamhiuhiu01@gmail.com', N'0969670959', N'HaNoi', CAST(2000000 AS Decimal(18, 0)), 1, 1, CAST(N'2025-05-22T13:12:35.183' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (21, 2, N'OD638835292027046165', N'Tuệ', N'Phamhiuhiu01@gmail.com', N'0969670959', N'HaNoi', CAST(2000000 AS Decimal(18, 0)), 1, 1, CAST(N'2025-05-22T16:46:42.703' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (28, 2, N'OD638838976477965154', N'phamhiuhiu', N'Phamhiuhiu01@gmail.com', N'0969670959', N'HaNoi', CAST(3600000 AS Decimal(18, 0)), 1, 1, CAST(N'2025-05-26T23:07:27.797' AS DateTime))
INSERT [dbo].[Order] ([Id], [UserId], [OrderCode], [CustomerName], [Email], [Phone], [Address], [TotalAmount], [Quantity], [Payment], [CreateDate]) VALUES (29, 2, N'OD638838978060440563', N'phamhiuhiu', N'Phamhiuhiu01@gmail.com', N'0969670959', N'HaNoi', CAST(7200000 AS Decimal(18, 0)), 2, 1, CAST(N'2025-05-26T23:10:06.043' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (9, 8, 44, CAST(2500000 AS Decimal(18, 0)), CAST(2500000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (18, 13, 72, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (19, 13, 70, CAST(3600000 AS Decimal(18, 0)), CAST(3600000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (20, 13, 69, CAST(2900000 AS Decimal(18, 0)), CAST(2900000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (21, 14, 66, CAST(3600000 AS Decimal(18, 0)), CAST(3600000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (22, 15, 72, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (23, 16, 65, CAST(3600000 AS Decimal(18, 0)), CAST(3600000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (24, 16, 69, CAST(2900000 AS Decimal(18, 0)), CAST(2900000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (25, 16, 70, CAST(3600000 AS Decimal(18, 0)), CAST(7200000 AS Decimal(18, 0)), NULL, 2)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (26, 17, 57, CAST(3000000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (27, 18, 72, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (29, 20, 72, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (30, 21, 72, CAST(2000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), NULL, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (35, 28, 61, CAST(3600000 AS Decimal(18, 0)), CAST(3600000 AS Decimal(18, 0)), N'38', 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Price], [TotalPrice], [Size], [Quantity]) VALUES (36, 29, 61, CAST(3600000 AS Decimal(18, 0)), CAST(7200000 AS Decimal(18, 0)), N'36', 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (3, N'ADIDAS STAN SMITH ÔM CHÂN NHƯ THẾ NÀO? KÍCH CỠ STAN SMITH PHÙ HỢP VỚI TẤT CẢ MỌI NGƯỜI', N'adidas-stan-smith-om-chan-nhu-the-nao-kich-co-stan-smith-phu-hop-voi-tat-ca-moi-nguoi', N'Đôi giày sneaker thoải mái này hướng tới phong cách đơn giản mà hiệu quả cho tất cả mọi người — nhưng adidas Stan Smith vừa vặn với chân như thế nào? Tìm hiểu qua hướng dẫn chọn kích cỡ adidas Stan Smith chính thức của chúng tôi.', N'<h1>ADIDAS STAN SMITH &Ocirc;M CH&Acirc;N NHƯ THẾ N&Agrave;O? K&Iacute;CH CỠ STAN SMITH PH&Ugrave; HỢP VỚI TẤT CẢ MỌI NGƯỜI</h1>

<p>Đ&ocirc;i gi&agrave;y sneaker thoải m&aacute;i n&agrave;y hướng tới phong c&aacute;ch đơn giản m&agrave; hiệu quả cho tất cả mọi người &mdash; nhưng adidas Stan Smith vừa vặn với ch&acirc;n như thế n&agrave;o? T&igrave;m hiểu qua hướng dẫn chọn k&iacute;ch cỡ adidas Stan Smith ch&iacute;nh thức của ch&uacute;ng t&ocirc;i.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<h2>Stan Smith: Lịch sử ra đời</h2>

<div style="box-sizing: border-box;">L&agrave; một tay vợt v&ocirc; địch thế giới, Stan Smith đ&atilde; ghi t&ecirc;n m&igrave;nh v&agrave;o lịch sử bộ m&ocirc;n tennis khi gi&agrave;nh được 2 danh hiệu Grand Slam đơn v&agrave; 5 chiếc c&uacute;p Grand Slam đ&ocirc;i. Được biết đến với h&igrave;nh ảnh điềm tĩnh, c&aacute; t&iacute;nh v&agrave; lạnh l&ugrave;ng tr&ecirc;n s&acirc;n, r&otilde; r&agrave;ng đ&ocirc;i gi&agrave;y mang t&ecirc;n của &ocirc;ng cũng c&oacute; những phẩm chất tương tự.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Kiểu d&aacute;ng chuy&ecirc;n d&agrave;nh cho s&acirc;n tennis v&agrave;o thập ni&ecirc;n 1970 đ&atilde; được chuyển h&oacute;a th&agrave;nh đ&ocirc;i gi&agrave;y sneaker hiện đại ph&ugrave; hợp để đi thường ng&agrave;y. Với phong c&aacute;ch tinh tế v&agrave; c&aacute;c chi tiết mới mẻ, đ&ocirc;i gi&agrave;y adidas Stan Smith đ&atilde; len lỏi v&agrave;o tr&aacute;i tim của nhiều thế hệ, mang đến cho mọi outfit casual hay thanh lịch sự kết hợp ho&agrave;n hảo nhất.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Việc t&igrave;m ra đ&ocirc;i gi&agrave;y Stan Smith ưng &yacute; l&agrave; do bạn tự quyết định, c&ograve;n để t&igrave;m kiếm k&iacute;ch cỡ ho&agrave;n hảo th&igrave; h&atilde;y để ch&uacute;ng t&ocirc;i gi&uacute;p bạn một tay. Đọc tiếp để t&igrave;m hiểu th&ecirc;m về c&aacute;c k&iacute;ch cỡ của adidas Stan Smith &ocirc;m ch&acirc;n như thế n&agrave;o.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Stan-Smith-Size-Guide-Blog-Image-01" src="https://brand.assets.adidas.com/capi/viVN/Images/stan-smith-size-guide-blog-image-01_337-1029783.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Stan-Smith-Size-Guide-Blog-Image-01" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>adidas Stan Smith c&oacute; vừa đ&uacute;ng k&iacute;ch cỡ kh&ocirc;ng?</h3>

<div style="box-sizing: border-box;">Tất cả c&aacute;c mẫu gi&agrave;y adidas Stan Smith d&agrave;nh cho người lớn v&agrave; thanh thiếu ni&ecirc;n đều ph&ugrave; hợp với cả nam lẫn nữ v&agrave; vừa đ&uacute;ng k&iacute;ch cỡ. Mặc d&ugrave; chất liệu th&acirc;n gi&agrave;y kh&aacute;c nhau c&oacute; thể ảnh hưởng đến cảm gi&aacute;c &ocirc;m ch&acirc;n, nhưng c&aacute;c nh&agrave; thiết kế adidas vẫn khuy&ecirc;n bạn n&ecirc;n mua theo k&iacute;ch cỡ b&igrave;nh thường.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Gi&agrave;y Stan Smith c&oacute; to hơn khi sử dụng kh&ocirc;ng?</h3>

<div style="box-sizing: border-box;">V&igrave; gi&agrave;y Stan Smith kh&ocirc;ng gi&atilde;n nở khi sử dụng, bạn sẽ muốn chọn k&iacute;ch cỡ thật.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Stan-Smith-Size-Guide-Blog-Image-02" src="https://brand.assets.adidas.com/capi/viVN/Images/stan-smith-size-guide-blog-image-02_337-1029787.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Stan-Smith-Size-Guide-Blog-Image-02" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>GI&Agrave;Y STAN SMITH</h2>

<div style="box-sizing: border-box; text-align:center;"><img alt="Stan-Smith-Size-Guide-Blog-Image-03" src="https://brand.assets.adidas.com/capi/viVN/Images/stan-smith-size-guide-blog-image-03_337-1029785.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Stan-Smith-Size-Guide-Blog-Image-03" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Mang phong c&aacute;ch kinh điển vượt thời gian, kiểu d&aacute;ng n&agrave;y vẫn trung th&agrave;nh với thiết kế nguy&ecirc;n bản trong suốt hơn 50 năm qua &mdash; giờ đ&acirc;y hướng tới h&agrave;nh tinh xanh. L&agrave;m từ 50% th&agrave;nh phần t&aacute;i chế, th&acirc;n gi&agrave;y l&agrave;m từ thực vật mượt m&agrave; với ba sọc đục lỗ, c&ugrave;ng c&aacute;c gam m&agrave;u tươi tắn t&ocirc; điểm viền g&oacute;t gi&agrave;y. Bất kể chọn th&acirc;n gi&agrave;y m&agrave;u trắng đa năng hay phối đồ với c&aacute;c phi&ecirc;n bản nhuộm m&agrave;u, đ&ocirc;i gi&agrave;y thoải m&aacute;i n&agrave;y sẽ lu&ocirc;n l&agrave; lựa chọn đ&uacute;ng đắn.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Độ &ocirc;m ph&ugrave; hợp:</strong>&nbsp;K&iacute;ch cỡ chuẩn.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>C&aacute;ch chọn k&iacute;ch cỡ:</strong>&nbsp;Để t&igrave;m k&iacute;ch cỡ Stan Smith vừa với bạn, h&atilde;y đo k&iacute;ch cỡ b&agrave;n ch&acirc;n theo hướng dẫn chọn k&iacute;ch cỡ ch&iacute;nh thức của ch&uacute;ng t&ocirc;i.&nbsp;<a href="https://www.adidas.com/us/help/size_charts" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">official size guide</a>K&iacute;ch cỡ bạn đo sẽ &ocirc;m ch&acirc;n vừa vặn với đ&ocirc;i gi&agrave;y adidas Stan Smith.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>Gi&agrave;y Stan Smith theo m&ugrave;a</h2>

<div style="box-sizing: border-box;">Với thời tiết thay đổi thất thường, gi&agrave;y adidas Stan Smith sẽ được ph&aacute;t h&agrave;nh với một v&agrave;i phi&ecirc;n bản mới theo m&ugrave;a dựa tr&ecirc;n thiết kế của đ&ocirc;i gi&agrave;y n&agrave;y. Dưới đ&acirc;y l&agrave; chi tiết về độ &ocirc;m ph&ugrave; hợp nếu c&oacute; c&aacute;c bản ph&aacute;t h&agrave;nh theo m&ugrave;a n&agrave;y.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Gi&agrave;y Stan Smith l&agrave;m từ chất liệu cao cấp</h3>

<div style="box-sizing: border-box; text-align:center;"><img alt="Stan-Smith-Size-Guide-Blog-Image-04" src="https://brand.assets.adidas.com/capi/viVN/Images/stan-smith-size-guide-blog-image-04_337-1029786.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Stan-Smith-Size-Guide-Blog-Image-04" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">N&acirc;ng tầm phong c&aacute;ch h&agrave;ng ng&agrave;y bằng c&aacute;c chất liệu cao cấp như da thật, da lộn, vải nhung, &aacute;nh kim, v.v. Tựa như đang đi tr&ecirc;n thảm đỏ với gi&agrave;y Stan Smith Lux lộng lẫy, sẵn s&agrave;ng l&agrave;m n&ecirc;n chuyện với phong c&aacute;ch thanh lịch ngay trong tức khắc. Đ&ocirc;i gi&agrave;y Stan Smith l&agrave;m từ chất liệu cao cấp sẽ c&oacute; độ &ocirc;m giống như phi&ecirc;n bản kinh điển, vậy n&ecirc;n h&atilde;y chọn theo đ&uacute;ng cỡ thật của bạn.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Gi&agrave;y Stan Smith l&agrave;m từ vải canvas hoặc Primeknit</h3>

<div style="box-sizing: border-box; text-align:center;"><img alt="Stan-Smith-Size-Guide-Blog-Image-05" src="https://brand.assets.adidas.com/capi/viVN/Images/stan-smith-size-guide-blog-image-05_337-1029784.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Stan-Smith-Size-Guide-Blog-Image-05" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">B&ecirc;n cạnh giữ được vẻ ngo&agrave;i gọn g&agrave;ng, sắc sảo, đ&ocirc;i gi&agrave;y Stan Smith l&agrave;m từ chất liệu như vải canvas hoặc Primeknit sẽ c&oacute; bản n&acirc;ng cấp th&iacute;ch ứng với th&acirc;n gi&agrave;y tho&aacute;ng kh&iacute;. D&ugrave; c&aacute;c chất liệu nhẹ hơn như vải canvas v&agrave; Primeknit c&oacute; cảm gi&aacute;c kh&aacute;c so với th&acirc;n gi&agrave;y l&agrave;m từ thực vật của phi&ecirc;n bản gốc, nhưng ch&uacute;ng vẫn &ocirc;m ch&acirc;n theo đ&uacute;ng k&iacute;ch cỡ thật.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>Phong c&aacute;ch m&ugrave;a h&egrave; với Stan Smith</h3>

<div style="box-sizing: border-box; text-align:center;"><img alt="Stan-Smith-Size-Guide-Blog-Image-06" src="https://brand.assets.adidas.com/capi/viVN/Images/stan-smith-size-guide-blog-image-06_337-1029788.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Stan-Smith-Size-Guide-Blog-Image-06" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">V&agrave;o m&ugrave;a h&egrave;, đ&ocirc;i khi gi&agrave;y sneaker Stan Smith h&ograve;a c&ugrave;ng tiết trời n&oacute;ng nực với thiết kế kh&ocirc;ng g&oacute;t sau. Phong c&aacute;ch tennis sắc n&eacute;t n&agrave;y giờ đ&acirc;y dễ xỏ hơn v&agrave; đưa bạn thẳng tiến tới hồ bơi &mdash; bất kể tr&ecirc;n b&atilde;i biển hay trong s&acirc;n sau, đ&ocirc;i gi&agrave;y sục n&agrave;y sẽ gi&uacute;p t&acirc;m tr&iacute; bạn mường tượng ra kỳ nghỉ trọn vẹn. Chọn k&iacute;ch cỡ th&ocirc;ng thường v&agrave; tận hưởng ng&agrave;y h&egrave;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Bất kể bạn chọn đ&ocirc;i gi&agrave;y Stan Smith n&agrave;o, lu&ocirc;n c&oacute; được phong c&aacute;ch đơn giản nhưng hiệu quả với mọi outfit. D&ugrave; đ&oacute; l&agrave; thanh lịch v&agrave; thời thượng hay giản dị v&agrave; casual, bạn sẽ lu&ocirc;n cảm thấy chỉn chu.</div>
</div>
</div>
', N'/uploads/post/tải xuống (1).jpg', CAST(N'2025-05-14T10:27:00.000' AS DateTime), NULL, CAST(N'2025-05-14T10:27:35.063' AS DateTime), NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (4, N'Chạy biến tốc cho người mới bắt đầu: Bắt đầu từ đâu', N'chay-bien-toc-cho-nguoi-moi-bat-dau-bat-dau-tu-dau', N'Với người mới bắt đầu, chạy biến tốc có thể là một cách tuyệt vời để thúc đẩy động lực và tăng cường tập luyện. Nhận lời khuyên từ các chuyên gia, cùng với kế hoạch chạy biến tốc.', N'<h1>Chạy biến tốc cho người mới bắt đầu: Bắt đầu từ đ&acirc;u</h1>

<p>Với người mới bắt đầu, chạy biến tốc c&oacute; thể l&agrave; một c&aacute;ch tuyệt vời để th&uacute;c đẩy động lực v&agrave; tăng cường tập luyện. Nhận lời khuy&ecirc;n từ c&aacute;c chuy&ecirc;n gia, c&ugrave;ng với kế hoạch chạy biến tốc.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<div style="box-sizing: border-box;">
<h2>Chạy biến tốc l&agrave; g&igrave;? C&oacute; lợi &iacute;ch g&igrave;?</h2>
</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Bạn đang muốn th&uacute;c đẩy buổi chạy hơn nữa? Với chạy biến tốc, người chạy ở mọi cấp độ sẽ c&oacute; được 0,5 giờ chạy với động lực mới mẻ v&agrave; một số lợi &iacute;ch về thể h&igrave;nh kh&aacute;c.</div>

<div style="box-sizing: border-box;">
<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&quot;Chạy biến tốc&quot; m&ocirc; tả việc cố t&igrave;nh thay đổi tốc độ chạy, kết hợp xen kẽ c&aacute;c đoạn chạy ngắn cường độ cao với những khoảng thời gian chủ động nghỉ hồi sức. L&agrave; huấn luyện vi&ecirc;n của Golden Coast Track Club, Terrence Mahon v&agrave; Jen Rhines đều th&iacute;ch th&ecirc;m c&aacute;c đoạn chạy ngắn v&agrave;o th&oacute;i quen của họ.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&quot;Tập luyện biến tốc thực sự l&agrave; c&aacute;ch tốt nhất để r&egrave;n luyện h&igrave;nh thể, tr&aacute;i ngược với c&aacute;ch chạy dễ d&agrave;ng mỗi ng&agrave;y&quot;, Mahon, người đ&atilde; huấn luyện nhiều vận động vi&ecirc;n đạt danh hiệu quốc gia v&agrave; thi đấu thế giới từ thể thức 800 m đến marathon. L&agrave; huấn luyện vi&ecirc;n cho một số vận động vi&ecirc;n chạy đường d&agrave;i h&agrave;ng đầu h&agrave;nh tinh, Mahon đ&atilde; chứng kiến c&aacute;c đoạn chạy nhanh gi&uacute;p n&acirc;ng cao thể h&igrave;nh của người chạy v&agrave; vận động vi&ecirc;n ở mọi cấp độ, từ người mới đến d&acirc;n chuy&ecirc;n. &Ocirc;ng n&oacute;i đ&oacute; l&agrave; v&igrave; c&aacute;c đoạn chạy nhanh tạo ra &quot;đỉnh v&agrave; đ&aacute;y trong qu&aacute; tr&igrave;nh điều tiết nhịp tim cũng như nỗ lực tổng thể&quot;. Những đoạn chạy cự ly ngắn b&ugrave;ng nổ với cường độ cao n&agrave;y &quot;k&iacute;ch hoạt c&aacute;c cơ chế trong cơ thể gi&uacute;p đốt ch&aacute;y mỡ, tạo cơ bắp v&agrave; cải thiện hệ thống tim mạch &mdash; được giới huấn luyện gọi l&agrave; đạt tới&nbsp;<a href="https://www.adidas.com/us/blog/599657-how-to-increase-vo2-max-tips-from-a-training-expert" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">Vo2 cực đại</a>&mdash; nhanh hơn so với khi chạy 30 ph&uacute;t với nhịp tim vừa phải&quot;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Jennifer &quot;Jen&quot; Rhines l&agrave; vận động vi&ecirc;n chạy đường d&agrave;i đ&atilde; 15 lần đồng h&agrave;nh c&ugrave;ng Tuyển Mỹ v&agrave; thi đấu ở c&aacute;c hạng mục điền kinh, chạy băng đồng v&agrave; chạy đường trường. L&agrave; một vận động vi&ecirc;n chạy bộ gắn b&oacute; cả đời với đường chạy to&agrave;n cầu, Rhines rất th&iacute;ch c&aacute;c b&agrave;i chạy biến tốc để nhanh ch&oacute;ng đạt được c&uacute; h&iacute;ch thể h&igrave;nh v&agrave; duy tr&igrave; động lực. &quot;Đối với t&ocirc;i, chạy biến tốc khiến chạy bộ trở n&ecirc;n th&uacute; vị hơn. Bạn c&oacute; thể theo d&otilde;i tiến độ v&agrave; xem tốc độ trung b&igrave;nh của m&igrave;nh được cải thiện, điều m&agrave; t&ocirc;i nghĩ bất cứ ai cũng cảm thấy h&aacute;o hức&quot;, c&ocirc; chia sẻ.</div>
</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>Kế Hoạch Tập Luyện: Ba B&agrave;i Chạy Biến Tốc Cho Người Mới Bắt Đầu</h2>
</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="1877636-SEO-Interval-Running-For-Beginners-Body-Image-1" src="https://brand.assets.adidas.com/capi/viVN/Images/1877636-seo-interval-running-for-beginners-body-image-1_337-692015.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="1877636-SEO-Interval-Running-For-Beginners-Body-Image-1" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Để điều chỉnh tốc độ trong khi chạy, h&atilde;y ch&uacute; &yacute; đến &quot;tỷ lệ cố gắng theo cảm nhận (RPE)&quot; của bạn. Mahon giải th&iacute;ch: &quot;Với b&agrave;i chạy dễ, bạn c&oacute; thể h&iacute;t thở bằng mũi v&agrave; c&oacute; đủ oxy. Với cường độ cao hơn, bạn c&agrave;ng bắt đầu thở nhiều hơn qua cả mũi lẫn miệng&quot;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>RPE của bạn l&agrave; g&igrave;?</h2>
</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>ĐỎ:</strong>&nbsp;Nỗ lực tối đa; bạn c&oacute; thể nỗ lực khoảng 85-90% sức lực. Cấp độ n&agrave;y căng tới độ khiến bạn hụt hơi sau v&agrave;i ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>V&Agrave;NG:</strong>&nbsp;Nỗ lực vừa phải đến cao; thở bằng mũi v&agrave; miệng. Bạn n&ecirc;n nỗ lực cho tới khi cảm thấy kh&oacute; n&oacute;i.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>XANH L&Aacute;:</strong>&nbsp;Nỗ lực &iacute;t. Hướng tới tốc độ nhanh, dễ d&agrave;ng m&agrave; bạn c&oacute; thể duy tr&igrave; ngay cả khi đang n&oacute;i.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>1. TĂNG TỐC: B&Agrave;I CHẠY BIẾN TỐC ĐƠN GIẢN CHO NGƯỜI MỚI TẬP</h2>
</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Bạn muốn thử th&ecirc;m c&aacute;c đoạn chạy ngắt qu&atilde;ng v&agrave;o b&agrave;i chạy của m&igrave;nh? H&atilde;y bắt đầu với một kế hoạch đơn giản như sau.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Khởi động:</strong>&nbsp;Chạy nhẹ hoặc đi bộ nhanh ở cấp XANH L&Aacute; trong 5-10 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Chạy nhanh:</strong>&nbsp;Chạy ở cấp V&Agrave;NG hoặc ĐỎ trong 1 ph&uacute;t, sau đ&oacute; chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 2 ph&uacute;t. Lặp lại đoạn chạy nhanh d&agrave;i 3 ph&uacute;t n&agrave;y bốn lần nữa, tổng cộng l&agrave; năm lần.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Hạ nhiệt:</strong>&nbsp;Chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 5-7 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Mẹo từ huấn luyện vi&ecirc;n:</strong>&nbsp;&quot;Những g&igrave; m&agrave; nhiều người mới bắt đầu chạy biến tốc hay l&agrave;m l&agrave; chạy qu&aacute; nhanh trong 2 đoạn ngắt qu&atilde;ng đầu ti&ecirc;n, rồi 3 đoạn sau đ&oacute; chậm hơn rất nhiều&quot;, Mahon n&oacute;i. Đối với người mới bắt đầu, một mục ti&ecirc;u tốt l&agrave; đạt được tốc độ c&oacute; thể duy tr&igrave; trong cả năm đoạn chạy bứt tốc.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>2. TĂNG CƯỜNG: B&Agrave;I CHẠY BIẾN TỐC 30 PH&Uacute;T KINH ĐIỂN</h2>
</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Khởi động:</strong>&nbsp;Chạy nhẹ hoặc đi bộ nhanh ở cấp XANH L&Aacute; trong 5 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Chạy nhanh:</strong>&nbsp;Chạy ở cấp V&Agrave;NG trong 3 ph&uacute;t, sau đ&oacute; chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 1 ph&uacute;t. Lặp lại đoạn chạy nhanh d&agrave;i 4 ph&uacute;t n&agrave;y ba lần nữa, tổng cộng l&agrave; bốn lần.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Hạ nhiệt:</strong>&nbsp;Chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 5 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Mẹo từ huấn luyện vi&ecirc;n:</strong>&nbsp;Rhines gợi &yacute; c&aacute;c đoạn chạy nhanh n&agrave;y cho những người chạy muốn r&uacute;t ngắn tốc độ tổng thể: &quot;Chạy biến tốc kh&oacute; hơn chạy nhẹ với tốc độ ổn định, v&igrave; vậy c&aacute;c b&agrave;i chạy ngắt qu&atilde;ng c&oacute; thể kh&oacute; nhằn, nhưng sau đ&oacute; bạn sẽ cảm thấy tốc độ chạy trung b&igrave;nh của m&igrave;nh &mdash; đột nhi&ecirc;n tốt hơn nhiều&quot;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>3. N&Acirc;NG CAO: B&Agrave;I CHẠY BIẾN TỐC CƯỜNG ĐỘ CAO</h2>
</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Khởi động:</strong>&nbsp;Chạy nhẹ hoặc đi bộ nhanh ở cấp XANH L&Aacute; trong 5-10 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Chạy nhanh:</strong>&nbsp;Chạy ở cấp ĐỎ trong 30 gi&acirc;y, sau đ&oacute; chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 30 gi&acirc;y. Lặp lại đoạn chạy nhanh d&agrave;i 1 ph&uacute;t n&agrave;y ba lần nữa.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Nghỉ ngơi:</strong>&nbsp;Chạy nhẹ hoặc đi bộ nhanh ở cấp XANH L&Aacute; trong 2 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Chạy nhanh:</strong>&nbsp;Chạy ở cấp ĐỎ trong 1 ph&uacute;t, sau đ&oacute; chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 1 ph&uacute;t. Lặp lại đoạn chạy nhanh d&agrave;i 2 ph&uacute;t n&agrave;y hai lần nữa.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Hạ nhiệt:</strong>&nbsp;Chạy nhẹ hoặc đi bộ ở cấp XANH L&Aacute; trong 5-7 ph&uacute;t.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;"><strong>Mẹo từ huấn luyện vi&ecirc;n:</strong>&nbsp;&quot;Điều tuyệt vời về tập luyện ngắt qu&atilde;ng l&agrave; bạn c&oacute; rất nhiều lựa chọn để điều chỉnh b&agrave;i tập theo đ&uacute;ng nhu cầu v&agrave; mục ti&ecirc;u bạn đang cố gắng hết sức để đạt được&quot;, Mahon n&oacute;i. &Ocirc;ng n&oacute;i rằng chạy HIIT c&oacute; thể cực kỳ hữu &iacute;ch đối với c&aacute;c vận động vi&ecirc;n muốn x&acirc;y dựng sức mạnh tổng thể.</div>

<div style="box-sizing: border-box;">&quot;Chạy c&agrave;ng nhanh trong những đoạn ngắn b&ugrave;ng nổ ấy, sức mạnh của cơ bắp c&agrave;ng được r&egrave;n luyện th&ecirc;m. V&iacute; dụ: một người th&iacute;ch tập thể lực c&oacute; thể thực sự hưởng lợi từ c&aacute;c b&agrave;i tập ngắt qu&atilde;ng tăng cường trong th&oacute;i quen tập cardio của họ&quot;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>Săn Chắc Hơn, Nhanh Hơn V&agrave; Vui Hơn: Chạy Biến Tốc C&oacute; Thể Th&uacute;c Đẩy Động Lực</h2>
</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="1877637-SEO-Interval-Running-For-Beginners-Body-Image-2" src="https://brand.assets.adidas.com/capi/viVN/Images/1877637-seo-interval-running-for-beginners-body-image-2_337-692013.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="1877637-SEO-Interval-Running-For-Beginners-Body-Image-2" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Cả Rhines v&agrave; Mahon đều nhấn mạnh tầm quan trọng của bước hồi sức cho bất cứ ai đang đưa b&agrave;i tập ngắt qu&atilde;ng v&agrave;o th&oacute;i quen tập luyện của họ. Để c&oacute; thời gian hồi phục, Mahon khuy&ecirc;n bạn n&ecirc;n tập chạy ngắt qu&atilde;ng 2 hoặc 3 lần mỗi tuần, xen kẽ với c&aacute;c b&agrave;i chạy nhẹ hơn với tốc độ ổn định. Lợi &iacute;ch bổ sung của phương ph&aacute;p n&agrave;y l&agrave; lịch tr&igrave;nh tập luyện của bạn sẽ c&oacute; nhiều b&agrave;i tập đa dạng hơn. Mahon n&oacute;i: &quot;Chạy biến tốc tạo ra sự đa dạng v&agrave; c&agrave;ng nhiều b&agrave;i tập th&igrave; c&agrave;ng tốt&quot;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Dựa tr&ecirc;n kinh nghiệm của ch&iacute;nh m&igrave;nh, Rhines đồng &yacute; rằng &quot;Tập th&ecirc;m chạy biến tốc giữ được cảm gi&aacute;c th&uacute; vị v&igrave; bạn c&oacute; th&ecirc;m thứ g&igrave; đ&oacute; để tập trung v&agrave;o. Tất nhi&ecirc;n l&agrave; thử th&aacute;ch gia tăng, nhưng t&ocirc;i vẫn thấy mới mẻ v&agrave; gi&uacute;p t&ocirc;i nhanh hơn, sung sức hơn&quot;.</div>
</div>
</div>
', N'/uploads/post/tải xuống.jpg', CAST(N'2025-05-14T10:27:00.000' AS DateTime), NULL, CAST(N'2025-05-14T10:27:46.637' AS DateTime), NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (5, N'BA ĐIỀU HOANG ĐƯỜNG NHẤT VỀ GIÃN CƠ', N'ba-dieu-hoang-duong-nhat-ve-gian-co', N'Giải mã một số điều hoang đường nhất về giãn cơ và tìm hiểu sự thật về cách có được thói quen giãn cơ có lợi cho sức khỏe của bạn!', N'<h1>BA ĐIỀU HOANG ĐƯỜNG NHẤT VỀ GI&Atilde;N CƠ</h1>

<p>Giải m&atilde; một số điều hoang đường nhất về gi&atilde;n cơ v&agrave; t&igrave;m hiểu sự thật về c&aacute;ch c&oacute; được th&oacute;i quen gi&atilde;n cơ c&oacute; lợi cho sức khỏe của bạn!</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<h2>1. &quot;NẾU KH&Ocirc;NG GI&Atilde;N CƠ THƯỜNG XUY&Ecirc;N TH&Igrave; CƠ BẮP SẼ BỊ CO LẠI&quot;</h2>

<p>Cơ bắp bị co lại thường được cho l&agrave; do cơ thể k&eacute;m linh hoạt, nhưng c&aacute;ch d&ugrave;ng từ &quot;co lại&quot; sẽ g&acirc;y hiểu nhầm. C&aacute;c tế b&agrave;o cảm thụ (thụ thể biến đổi lực cơ học th&agrave;nh xung thần kinh) gửi t&iacute;n hiệu đến n&atilde;o của ch&uacute;ng ta mỗi khi khớp đạt đến g&oacute;c uốn hoặc duỗi tối đa. Khi to&agrave;n bộ phạm vi chuyển động kh&ocirc;ng được sử dụng thường xuy&ecirc;n, c&aacute;c thụ thể n&agrave;y bắt đầu mất khả năng chịu đựng được sự căng thẳng kh&oacute; chịu khi gi&atilde;n cơ. Ch&iacute;nh điều n&agrave;y l&agrave;m giảm t&iacute;nh linh hoạt. Cơ bắp thực sự co lại chỉ khi cấu tr&uacute;c của tơ cơ (m&ocirc; cơ nhỏ nhất của cơ bắp) co lại, b&ecirc;n cạnh c&aacute;c trường hợp gặp t&igrave;nh trạng bệnh l&yacute;, sau nhiều tuần nghỉ ngơi ở tư thế bị co lại.</p>

<p style="text-align:center"><img alt="image1" src="https://brand.assets.adidas.com/capi/viVN/Images/image1_337-533137.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="image1" /></p>

<h2>2. &quot;GI&Atilde;N CƠ GI&Uacute;P GIẢM ĐAU CƠ&quot;</h2>

<p>Bạn kh&ocirc;ng bao giờ n&ecirc;n gi&atilde;n cơ nếu bị đau cơ cấp t&iacute;nh. Gi&atilde;n cơ mạnh c&oacute; thể l&agrave;m to th&ecirc;m những vết r&aacute;ch nhỏ trong sợi cơ (chấn thương vi m&ocirc;).<br />
Khả năng bị đau cơ l&agrave; kh&aacute; cao sau những nỗ lực hết sức hoặc động t&aacute;c kh&ocirc;ng quen thuộc. Đ&acirc;y l&agrave; l&yacute; do tại sao bạn n&ecirc;n gi&atilde;n cơ nhẹ nh&agrave;ng sau khi tập nặng. Về nguy&ecirc;n tắc, cường độ tập luyện c&agrave;ng cao v&agrave; dồn dập, bạn c&agrave;ng cần cẩn thận hơn trong l&uacute;c gi&atilde;n cơ sau đ&oacute;.</p>

<p>Nhấp để tweet: Bạn kh&ocirc;ng bao giờ n&ecirc;n gi&atilde;n cơ nếu bị đau cơ cấp t&iacute;nh.</p>

<p>Ngo&agrave;i ra, gi&atilde;n cơ tĩnh k&eacute;o d&agrave;i v&agrave; cường độ cao sẽ cản trở lưu lượng m&aacute;u đến mao mạch. Điều n&agrave;y c&oacute; thể l&agrave;m chậm qu&aacute; tr&igrave;nh hồi phục sau khi tập.</p>

<h2>3. &quot;GI&Atilde;N CƠ L&Agrave;M GIẢM NGUY CƠ CHẤN THƯƠNG&quot;</h2>

<p>Kh&ocirc;ng c&oacute; bằng chứng khoa học n&agrave;o cho thấy cơ bắp được k&eacute;o gi&atilde;n sẽ &iacute;t bị chấn thương hơn. Đồng thời, c&oacute; những động t&aacute;c gi&atilde;n cơ cụ thể c&oacute; thể thực hiện trước khi tập luyện để giảm nguy cơ chấn thương. Sự kh&aacute;c biệt l&agrave; những động t&aacute;c gi&atilde;n cơ n&agrave;y kh&ocirc;ng tập trung v&agrave;o việc k&eacute;o căng cơ bắp: gi&atilde;n cơ động gi&uacute;p cơ bắp v&agrave; c&aacute;c cấu tr&uacute;c hỗ trợ thụ động của cơ thể (g&acirc;n, d&acirc;y chằng, sụn, v.v.) chuẩn bị trước nhu cầu của buổi tập sắp tới. Gi&atilde;n cơ động cũng cải thiện khả năng phối hợp b&ecirc;n trong cơ v&agrave; giữa c&aacute;c nh&oacute;m cơ với nhau, đồng thời tăng lưu lượng m&aacute;u đến cơ bắp. Lưu lượng m&aacute;u tăng l&ecirc;n n&agrave;y l&agrave;m tăng nhiệt độ cơ bắp, đ&acirc;y l&agrave; một trong những yếu tố quan trọng nhất trong qu&aacute; tr&igrave;nh khởi động.</p>

<p><strong>C&aacute;ch gi&atilde;n cơ đ&uacute;ng:</strong></p>

<ul>
	<li>Trước khi tập, bạn kh&ocirc;ng được bỏ c&aacute;c động t&aacute;c Gi&atilde;n Cơ Động trong l&uacute;c khởi động. Ch&uacute;ng cực kỳ quan trọng trước khi tập luyện cường độ cao cũng như chuẩn bị cho c&aacute;c động t&aacute;c nhanh b&ugrave;ng nổ, đ&ograve;i hỏi nhiều sự linh hoạt. Ưu điểm lớn của gi&atilde;n cơ động l&agrave; nhẹ nh&agrave;ng k&iacute;ch hoạt cơ bắp vận động tới phạm vi tối đa, thay v&igrave; giữ nguy&ecirc;n phạm vi k&eacute;o căng tối đa trong thời gian d&agrave;i như gi&atilde;n cơ tĩnh. Một nguy&ecirc;n tắc chung l&agrave; bạn chỉ n&ecirc;n gi&atilde;n cơ đến khi cảm thấy bị k&eacute;o căng nhẹ. Gi&atilde;n cơ kh&ocirc;ng bao giờ g&acirc;y ra đau đớn.</li>
	<li>Sau buổi tập, c&aacute;c động t&aacute;c Gi&atilde;n Cơ Tĩnh l&agrave; ph&ugrave; hợp nhất. Ch&uacute;ng c&oacute; thể gi&uacute;p giải ph&oacute;ng c&aacute;c m&ocirc; cơ căng cứng. K&eacute;o gi&atilde;n cơ cho tới khi cảm thấy bị k&eacute;o căng nhẹ rồi giữ nguy&ecirc;n tư thế trong 20-90 gi&acirc;y. Lặp lại nhiều lần cho đến khi bạn thấy cơ bắp kh&ocirc;ng c&ograve;n bị căng nữa.</li>
</ul>

<p>Sự linh hoạt lu&ocirc;n l&agrave; sự kết hợp giữa khả năng vận động, co gi&atilde;n v&agrave; sức bền của cơ bắp. Bản th&acirc;n gi&atilde;n cơ c&oacute; lợi cho sức khỏe, nhưng kh&ocirc;ng bao giờ c&oacute; thể mang lại những t&aacute;c động t&iacute;ch cực như khi kết hợp cả ba yếu tố tr&ecirc;n.<br />
Tập luyện to&agrave;n th&acirc;n th&ocirc;ng qua tập thể h&igrave;nh kết hợp với gi&atilde;n cơ thường xuy&ecirc;n l&agrave; một trong những c&aacute;ch tốt nhất để cải thiện sự linh hoạt của cơ thể.</p>

<p style="text-align:center"><a href="https://rbt.runtastic.com/v1/referral/?key=c7140144f14e3ecec56c6dd57e7d458f&amp;target=runtastic&amp;target_link=https%3A%2F%2Fwww.runtastic.com%2Fapps%2Fruntastic&amp;utm_source=adidas&amp;utm_medium=blog&amp;utm_campaign=blog_download_adidas&amp;utm_content=banner_image" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(255, 255, 255); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(255, 255, 255); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgb(0, 0, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;" title="https://rbt.runtastic.com/v1/referral/?key=c7140144f14e3ecec56c6dd57e7d458f&amp;target=runtastic&amp;target_link=https%3A%2F%2Fwww.runtastic.com%2Fapps%2Fruntastic&amp;utm_source=adidas&amp;utm_medium=blog&amp;utm_campaign=blog_download_adidas&amp;utm_content=banner_image"><img alt="adidas_training_app" src="https://brand.assets.adidas.com/capi/viVN/Images/adidas-training-app_337-531408.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="adidas_training_app" /></a></p>
</div>
</div>
', N'/uploads/post/tải xuống (2).jpg', CAST(N'2025-05-14T10:49:52.047' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (6, N'Áo bra thể thao có kích cỡ như thế nào?', N'ao-bra-the-thao-co-kich-co-nhu-the-nao', N'Hơn 90% phụ nữ mặc sai cỡ áo bra thể thao. Chúng tôi sẵn sàng thay đổi thực trạng đó bằng hướng dẫn chọn kích cỡ áo bra thể thao đơn giản giúp bạn tìm được kích cỡ hoàn hảo.', N'<h1>&Aacute;o bra thể thao c&oacute; k&iacute;ch cỡ như thế n&agrave;o?</h1>

<p>Hơn 90% phụ nữ mặc sai cỡ &aacute;o bra thể thao. Ch&uacute;ng t&ocirc;i sẵn s&agrave;ng thay đổi thực trạng đ&oacute; bằng hướng dẫn chọn k&iacute;ch cỡ &aacute;o bra thể thao đơn giản gi&uacute;p bạn t&igrave;m được k&iacute;ch cỡ ho&agrave;n hảo.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<h3>C&Aacute;CH T&Igrave;M K&Iacute;CH CỠ &Aacute;O BRA PH&Ugrave; HỢP VỚI BẠN</h3>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><iframe frameborder="0" height="315" src="https://www.youtube.com/embed/MEE7wyxGRpE" style="box-sizing: border-box; margin-top: 15px; width: 712.525px; min-height: 360px; height: unset; aspect-ratio: 16 / 9;" width="560"></iframe></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Một chiếc &aacute;o bra thể thao sai k&iacute;ch cỡ kh&ocirc;ng chỉ v&ocirc; dụng m&agrave; c&ograve;n rất kh&oacute; chịu. Để t&igrave;m được chiếc &aacute;o bra thể thao c&oacute; khả năng hỗ trợ vận động ph&ugrave; hợp, trước ti&ecirc;n bạn phải biết ch&iacute;nh x&aacute;c về k&iacute;ch cỡ &aacute;o bra thường ng&agrave;y của m&igrave;nh.</div>

<div style="box-sizing: border-box;">C&aacute;c nghi&ecirc;n cứu ph&aacute;t hiện thấy 90% phụ nữ kh&ocirc;ng mặc đ&uacute;ng k&iacute;ch cỡ &aacute;o bra. May mắn thay, bạn kh&ocirc;ng cần phải d&ugrave;ng thước đo để t&igrave;m ra k&iacute;ch cỡ ph&ugrave; hợp nhất. Mọi thứ bạn cần l&agrave; chiếc &aacute;o bra thường ng&agrave;y, rồi đứng trước gương để kiểm tra xem c&uacute;p ngực v&agrave; v&ograve;ng băng c&oacute; vừa vặn hay kh&ocirc;ng. Dưới đ&acirc;y l&agrave; c&aacute;ch kiểm tra xem &aacute;o bra thể thao c&oacute; vừa vặn hay kh&ocirc;ng.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Sports-Bra-Fit-Guide-Band-Body-Image-01" src="https://brand.assets.adidas.com/capi/viVN/Images/sports-bra-fit-guide-band-body-image-01_337-840704.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Sports-Bra-Fit-Guide-Band-Body-Image-01" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h4>Đầu ti&ecirc;n, h&atilde;y xem v&ograve;ng băng c&oacute; vừa hay kh&ocirc;ng.</h4>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">V&ograve;ng băng chịu tr&aacute;ch nhiệm về hầu hết độ n&acirc;ng đỡ của chiếc &aacute;o bra thể thao. Nếu cảm thấy &ocirc;m vừa kh&iacute;t nhưng kh&ocirc;ng qu&aacute; chật v&agrave; nằm phẳng phiu tr&ecirc;n người th&igrave; bạn đang mặc đ&uacute;ng cỡ v&ograve;ng băng.</div>

<div style="box-sizing: border-box;">Nếu đ&egrave; l&ecirc;n lưng th&igrave; v&ograve;ng băng qu&aacute; chật v&agrave; c&oacute; thể để lại vết hằn. Nếu bị x&ocirc; l&ecirc;n tr&ecirc;n lưng th&igrave; v&ograve;ng băng qu&aacute; rộng v&agrave; kh&ocirc;ng đủ để hỗ trợ vận động.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Sports-Bra-Fit-Guide-Band-Body-Image-02" src="https://brand.assets.adidas.com/capi/viVN/Images/sports-bra-fit-guide-band-body-image-02_337-840705.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Sports-Bra-Fit-Guide-Band-Body-Image-02" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h4>Tiếp theo, h&atilde;y kiểm tra d&acirc;y &aacute;o.</h4>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">D&acirc;y &aacute;o n&ecirc;n &ocirc;m thoải m&aacute;i tr&ecirc;n vai m&agrave; kh&ocirc;ng bị trượt hoặc hằn s&acirc;u. Khi cần hỗ trợ vận động, v&ograve;ng băng sẽ chịu tr&aacute;ch nhiệm ch&iacute;nh, c&ograve;n d&acirc;y &aacute;o n&ecirc;n cố định c&uacute;p &aacute;o, s&aacute;t với cơ thể.</div>

<div style="box-sizing: border-box;">Nếu d&acirc;y &aacute;o qu&aacute; chật, ch&uacute;ng sẽ hằn l&ecirc;n da v&agrave; c&oacute; thể để lại vết hằn. Với một ch&uacute;t cố gắng, bạn c&oacute; thể đặt hai ng&oacute;n tay giữa d&acirc;y &aacute;o v&agrave; vai để t&igrave;m độ &ocirc;m vừa &yacute;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Sports-Bra-Fit-Guide-Band-Body-Image-03" src="https://brand.assets.adidas.com/capi/viVN/Images/sports-bra-fit-guide-band-body-image-03_337-840707.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Sports-Bra-Fit-Guide-Band-Body-Image-03" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h4>Sau đ&oacute; kiểm tra độ &ocirc;m của c&uacute;p ngực.</h4>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Nếu c&uacute;p ngực vừa ho&agrave;n hảo quanh ngực v&agrave; kh&ocirc;ng bị tr&agrave;n hay hở, bạn đang mặc đ&uacute;ng cỡ c&uacute;p ngực.</div>

<div style="box-sizing: border-box;">Tr&agrave;n ở tr&ecirc;n đỉnh hay hai b&ecirc;n cho thấy k&iacute;ch cỡ c&uacute;p ngực qu&aacute; nhỏ. Nếu ngực bạn vẫn c&ograve;n rộng b&ecirc;n trong c&uacute;p ngực, k&iacute;ch cỡ c&uacute;p ngực qu&aacute; lớn.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h3>ĐỘ N&Acirc;NG ĐỠ PH&Ugrave; HỢP CHO BỘ M&Ocirc;N CỦA BẠN</h3>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Kh&ocirc;ng dễ để t&igrave;m thấy chiếc &aacute;o bra thể thao kh&ocirc;ng chỉ vừa vặn v&agrave; thoải m&aacute;i, m&agrave; c&ograve;n đủ để hỗ trợ bạn tập luyện. Khi chọn &aacute;o bra thể thao mới, bạn cần c&acirc;n nhắc k&iacute;ch cỡ, b&agrave;i tập v&agrave; cường độ tập luyện để t&igrave;m được khả năng hỗ trợ ho&agrave;n hảo. Chiếc &aacute;o bra thể thao adidas mới hỗ trợ vận&nbsp;<a href="https://www.adidas.com/us/blog/444811-light-support-sports-sports_bras" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">động nhẹ</a>&nbsp;,&nbsp;<a href="https://www.adidas.com/us/blog/444858-medium-support-sports-sports_bras" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">trung b&igrave;nh</a>&nbsp;&nbsp;and&nbsp;<a href="https://www.adidas.com/us/blog/444190-high-support-sports-sports_bras" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">v&agrave; mạnh</a>&nbsp;], với thiết kế đa dạng ph&ugrave; hợp với nhiều mức độ t&aacute;c động trong c&aacute;c hoạt động tại studio, tập luyện v&agrave; chạy bộ. T&igrave;m hiểu th&ecirc;m về từng thiết kế &aacute;o bra cũng như mức độ hỗ trợ n&agrave;o ph&ugrave; hợp với nhu cầu của bạn bằng c&aacute;ch đọc hướng dẫn về mức độ hỗ trợ của ch&uacute;ng t&ocirc;i.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Sports-Bra-Fit-Guide-Body-Image-4" src="https://brand.assets.adidas.com/capi/viVN/Images/sports-bra-fit-guide-body-image-4_337-846070.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Sports-Bra-Fit-Guide-Body-Image-4" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h4>T&igrave;m k&iacute;ch cỡ ph&ugrave; hợp với bạn</h4>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Để thấy tự tin hơn khi chọn đ&uacute;ng k&iacute;ch cỡ, bạn cũng c&oacute; thể đo k&iacute;ch cỡ cơ thể bằng c&aacute;ch d&ugrave;ng thước d&acirc;y mềm. Tốt nhất l&agrave; đo c&agrave;ng gần s&aacute;t da c&agrave;ng tốt v&agrave; đo khi kh&ocirc;ng mặc &aacute;o bra.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Sports-Bra-Fit-Guide-Band-Body-Image-5" src="https://brand.assets.adidas.com/capi/viVN/Images/sports-bra-fit-guide-band-body-image-5_337-844893.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Sports-Bra-Fit-Guide-Band-Body-Image-5" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">1. Đo k&iacute;ch cỡ c&uacute;p ngực bằng c&aacute;ch quấn thước d&acirc;y quanh lưng qua phần rộng nhất của ngực &mdash; thường nằm ngay giữa n&uacute;m v&uacute;. Đảm bảo thước d&acirc;y nằm phẳng tr&ecirc;n cơ thể. Thước d&acirc;y phải &ocirc;m vừa kh&iacute;t v&agrave; bạn vẫn cảm thấy dễ chịu khi h&iacute;t thở s&acirc;u. Ghi lại số đo n&agrave;y.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Sports-Bra-Fit-Guide-Band-Body-Image-6" src="https://brand.assets.adidas.com/capi/viVN/Images/sports-bra-fit-guide-band-body-image-6_337-844894.gif" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Sports-Bra-Fit-Guide-Band-Body-Image-6" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">2. Đo k&iacute;ch cỡ v&ograve;ng băng bằng c&aacute;ch quấn thước đo quanh lưng v&agrave; dưới ngực. Thước d&acirc;y n&ecirc;n nằm phẳng tr&ecirc;n cơ thể, chứ kh&ocirc;ng phải tr&ecirc;n m&ocirc; ngực. C&oacute; lẽ bạn cần n&acirc;ng ngực l&ecirc;n th&igrave; mới đo được. Một lần nữa, thước d&acirc;y phải &ocirc;m vừa kh&iacute;t v&agrave; bạn vẫn cảm thấy dễ chịu khi h&iacute;t thở s&acirc;u. Ghi lại số đo n&agrave;y.</div>

<div style="box-sizing: border-box;">3. Cuối c&ugrave;ng, h&atilde;y kiểm tra hai số đo dựa tr&ecirc;n hướng dẫn chọn k&iacute;ch cỡ của ch&uacute;ng t&ocirc;i&nbsp;<a href="https://www.adidas.com/us/help/size_charts/women-sports_bras" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">v&agrave; bạn sẽ c&oacute;</a>&nbsp;&nbsp; thể t&iacute;nh được k&iacute;ch cỡ &aacute;o bra thể thao ch&iacute;nh x&aacute;c của m&igrave;nh. Bạn cũng c&oacute; thể sử dụng c&ocirc;ng cụ t&igrave;m &aacute;o ngực của ch&uacute;ng t&ocirc;i&nbsp;<a href="https://www.adidas.com/us/sports_bras_finder" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">c&aacute;c lựa chọn &aacute;o</a>&nbsp;&aacute;o ngực t&ugrave;y chỉnh ri&ecirc;ng cho bạn.</div>

<div style="box-sizing: border-box;">Cơ thể của bạn l&agrave; độc nhất v&ocirc; nhị, v&igrave; vậy c&aacute;c mẹo v&agrave; hướng dẫn của ch&uacute;ng t&ocirc;i sẽ gi&uacute;p bạn hiểu được k&iacute;ch cỡ v&agrave; mức độ hỗ trợ cần thiết cho m&ocirc;n thể thao bạn th&iacute;ch. Với hơn 40 mẫu &aacute;o bra thể thao mới, bộ sưu tập &aacute;o bra thể thao d&agrave;nh cho mọi người của ch&uacute;ng t&ocirc;i được thiết kế cho mọi d&aacute;ng người v&agrave; k&iacute;ch cỡ. Khi t&igrave;m thấy chiếc &aacute;o bra ho&agrave;n hảo, bạn sẽ kh&aacute;m ph&aacute; hết tiềm năng của m&igrave;nh.</div>
</div>
</div>
', N'/uploads/post/tải xuống (3).jpg', CAST(N'2025-05-14T10:53:51.777' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (7, N'CÁCH PHỐI ĐỒ VỚI GIÀY TRAINER TRẮNG: THOẢI MÁI VÀ PHONG CÁCH', N'cach-phoi-do-voi-giay-trainer-trang-thoai-mai-va-phong-cach', N'Bạn có thể mang giày trainer trắng mỗi ngày nhưng vẫn luôn thời thượng. Bất kể mùa nào, dịp nào hay outfit của bạn ra sao – đôi giày trainer trắng luôn là một lựa chọn tuyệt vời.', N'<h1>C&Aacute;CH PHỐI ĐỒ VỚI GI&Agrave;Y TRAINER TRẮNG: THOẢI M&Aacute;I V&Agrave; PHONG C&Aacute;CH</h1>

<p>Bạn c&oacute; thể mang gi&agrave;y trainer trắng mỗi ng&agrave;y nhưng vẫn lu&ocirc;n thời thượng. Bất kể m&ugrave;a n&agrave;o, dịp n&agrave;o hay outfit của bạn ra sao &ndash; đ&ocirc;i gi&agrave;y trainer trắng lu&ocirc;n l&agrave; một lựa chọn tuyệt vời.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<h2><span style="font-size:11px">C&Aacute;CH PHỐI ĐỒ VỚI GI&Agrave;Y TRAINER TRẮNG: THOẢI M&Aacute;I V&Agrave; PHONG C&Aacute;CH</span></h2>

<p>Mặc đẹp cũng cần phải thoải m&aacute;i. Khi thấy thoải m&aacute;i, bạn thấy tự tin, v&agrave; khi c&oacute; được tự tin th&igrave; phong c&aacute;ch của bạn sẽ tỏa s&aacute;ng nhất. Đ&ocirc;i gi&agrave;y trainer trắng mang đến cảm gi&aacute;c ấy cho mọi outfit v&igrave; ch&uacute;ng qu&aacute; đỗi đa năng.</p>

<p>Một đ&ocirc;i gi&agrave;y trainer trắng giống như trang giấy trắng gi&uacute;p bạn vẽ n&ecirc;n trang phục của m&igrave;nh. Đ&acirc;y ch&iacute;nh l&agrave; đ&ocirc;i gi&agrave;y bền chắc d&ugrave;ng để đi h&agrave;ng ng&agrave;y v&agrave; c&ocirc;ng cụ để phối đồ cho mọi dịp bạn muốn. Bất kể sở th&iacute;ch c&aacute; nh&acirc;n hay gu thẩm mỹ ri&ecirc;ng, tất cả mọi người đều n&ecirc;n c&oacute; một đ&ocirc;i gi&agrave;y trainer trắng v&ocirc; c&ugrave;ng uy t&iacute;n để phối với mọi trang phục.</p>

<p>Kh&ocirc;ng c&oacute; g&igrave; hơn được đ&ocirc;i gi&agrave;y trainer trắng n&agrave;y &mdash; ch&uacute;ng thật sự rất đa năng v&agrave; mặc được với mọi trang phục, bất kể bạn muốn mặc v&aacute;y hay chỉ muốn mặc &aacute;o thun với quần jean.</p>

<p>Nhưng đ&acirc;u l&agrave; c&aacute;ch tuyệt vời nhất để đi đ&ocirc;i gi&agrave;y n&agrave;y? H&atilde;y c&ugrave;ng đi t&igrave;m với lời khuy&ecirc;n từ Ph&oacute; Gi&aacute;m Đốc Thiết Kế Trang Phục Josefine Aberg.</p>

<p>&quot;C&oacute; thể n&oacute;i l&agrave; t&ocirc;i đ&atilde; đi bộ qu&aacute; nhiều trong đ&ocirc;i gi&agrave;y trainer trắng mỗi khi du lịch, xuống phố hay thậm ch&iacute; l&agrave; diện đồ đẹp hơn.&quot; &ndash; Josefine Aberg</p>

<p style="text-align:center"><img alt="sportswear-FW22-chapter2-global-mainphase-sportswear-blogpost-image1-d" src="https://brand.assets.adidas.com/capi/viVN/Images/sportswear-fw22-chapter2-global-mainphase-sportswear-blogpost-image1-d_337-922257.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="sportswear-FW22-chapter2-global-mainphase-sportswear-blogpost-image1-d" /></p>

<h2>TẠO ĐIỂM NHẤN SẶC SỠ &ndash; HOẶC KH&Ocirc;NG CẦN TỚI!</h2>

<p>Mặc d&ugrave; sự thoải m&aacute;i chắc chắn l&agrave; lợi điểm của gi&agrave;y trainer, nhưng gi&agrave;y trainer trắng mới mang đến nhiều lựa chọn phối đồ da dạng v&agrave; biến h&oacute;a nhất. Thật dễ d&agrave;ng để trả lời c&acirc;u hỏi &quot;m&agrave;u n&agrave;o hợp với gi&agrave;y trainer trắng?&quot;, v&igrave; m&agrave;u n&agrave;o cũng hợp cả.</p>

<p>Nếu muốn mặc một ch&uacute;t m&agrave;u hoặc họa tiết tương phản nhằm ph&aacute; vỡ bảng m&agrave;u đơn sắc, bạn c&oacute; thể phối với gi&agrave;y trainer trắng, thế l&agrave; đ&atilde; sẵn s&agrave;ng bước ra khỏi nh&agrave;. Nếu bộ đồ của bạn đ&atilde; c&oacute; phụ kiện hoặc họa tiết t&aacute;o bạo l&agrave;m điểm nhấn ch&iacute;nh, đ&ocirc;i gi&agrave;y trainer trắng sẽ giữ n&eacute;t trung t&iacute;nh cho vẻ ngo&agrave;i tổng thể để họa tiết sặc sỡ hoặc nổi bật nhất thu h&uacute;t sự ch&uacute; &yacute;.</p>

<h2>PHỐI CẦU KỲ HAY ĐƠN GIẢN</h2>

<p>C&oacute; thể c&oacute; l&uacute;c bạn tự hỏi &quot;c&oacute; thể mặc v&aacute;y với gi&agrave;y trainer trắng kh&ocirc;ng?&quot; C&acirc;u trả lời tất nhi&ecirc;n l&agrave; c&oacute; rồi. H&atilde;y thử đi, đảm bảo bạn kh&ocirc;ng muốn đi gi&agrave;y cao g&oacute;t hay gi&agrave;y chiến binh nữa đ&acirc;u. Phối gi&agrave;y trainer trắng với quần jean hoặc quần t&acirc;y v&agrave; &aacute;o blazer để c&oacute; phong c&aacute;ch chuy&ecirc;n nghiệp hơn, hoặc v&aacute;y đi nắng v&agrave; quần short cho vẻ ngo&agrave;i nhẹ nh&agrave;ng hơn.</p>

<p>&quot;Đối với t&ocirc;i, kh&ocirc;ng c&oacute; giới hạn về số lượng m&oacute;n đồ c&oacute; thể đi với gi&agrave;y sneaker trắng. Chỉ cần lướt nhanh qua tủ đồ th&ocirc;i l&agrave; bạn sẽ thấy chẳng c&oacute; m&oacute;n đồ n&agrave;o lại kh&ocirc;ng hợp với gi&agrave;y trắng cả.&quot; &ndash; Josefine Aberg</p>

<h2>BẠN C&Oacute; MANG TẤT VỚI GI&Agrave;Y TRAINER TRẮNG KH&Ocirc;NG?</h2>

<p>C&oacute; chứ. Tr&ecirc;n thực tế, chỉ một đ&ocirc;i tất cũng c&oacute; thể l&agrave; điểm nhấn cho phong c&aacute;ch tổng thể. Trước ti&ecirc;n, bạn cần biết bạn đang mặc cho dịp g&igrave;. Điều n&agrave;y để thay đổi m&agrave;u tất bạn n&ecirc;n mang, cũng như loại tất bạn n&ecirc;n d&ugrave;ng.</p>

<p>Tất trắng thường hợp với ph&ograve;ng gym nếu ngắn, nhưng cũng dễ d&agrave;ng trở th&agrave;nh t&acirc;m điểm cho outfit nếu d&agrave;i hơn. H&atilde;y thử bộ tất ống trắng với gi&agrave;y trainer m&agrave;u trắng bẩn để th&ecirc;m điểm nhấn vintage cho trang phục.</p>

<p>Với đ&ocirc;i tất cao hơn, bạn sẽ c&oacute; nhiều c&aacute;ch biến tấu hơn. H&atilde;y thử phong c&aacute;ch t&aacute;o bạo hơn v&agrave; thu h&uacute;t sự ch&uacute; &yacute; với tất đầu gối s&aacute;ng m&agrave;u sặc sỡ đối lập với gi&agrave;y trainer trắng thoải m&aacute;i. Đ&acirc;y hẳn l&agrave; một c&aacute;ch đơn giản để tạo n&eacute;t nổi bật cho bộ trang phục m&agrave;u trung t&iacute;nh.</p>

<h2>C&Aacute;CH PHỐI QUẦN JEAN VỚI GI&Agrave;Y TRAINER TRẮNG?</h2>

<p>Mặc d&ugrave; ch&uacute;ng ta thường th&iacute;ch đi gi&agrave;y trainer với đồ thể thao, nhưng c&ograve;n g&igrave; kinh điển hơn mặc quần jean xanh với &aacute;o thun trắng? Đơn giản v&agrave; thoải m&aacute;i đ&uacute;ng nghĩa, c&acirc;n được hết mọi phong c&aacute;ch. V&iacute; dụ như quần skinny jean v&agrave; &aacute;o thun oversize đ&oacute;ng th&ugrave;ng, hay quần jean baggy v&agrave; &aacute;o crop top lửng, hoặc &aacute;o thun kinh điển - tất cả đều cho vẻ ngo&agrave;i đồng điệu.</p>

<p style="text-align:center"><img alt="sportswear-FW22-chapter2-global-mainphase-sportswear-blogpost-image2-d" src="https://brand.assets.adidas.com/capi/viVN/Images/sportswear-fw22-chapter2-global-mainphase-sportswear-blogpost-image2-d_337-922249.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="sportswear-FW22-chapter2-global-mainphase-sportswear-blogpost-image2-d" /></p>

<p>&nbsp;</p>

<h2>THỜI ĐIỂM TỐT NHẤT TRONG NĂM ĐỂ ĐI GI&Agrave;Y TRAINER TRẮNG?</h2>

<p>&quot;Đối với t&ocirc;i, gi&agrave;y trainer trắng ph&ugrave; hợp với xu&acirc;n h&egrave;, c&ograve;n gi&agrave;y boot sẽ v&agrave;o thu đ&ocirc;ng: cả hai đ&ocirc;i gi&agrave;y đều l&agrave; những m&oacute;n đồ chủ đạo c&oacute; thể phối với mọi thứ v&agrave; hợp với phong c&aacute;ch đặc trưng tổng thể của từng m&ugrave;a.&quot; &ndash; Josefine Aberg</p>

<p>Gi&agrave;y trainer trắng sẽ đưa bạn từ ban ng&agrave;y bận rộn n&oacute;ng nực tới đ&ecirc;m tối ăn chơi ch&aacute;y phố, cũng như đi khắp mọi nơi trong ng&agrave;y. Bất kể dự định v&agrave;o m&ugrave;a xu&acirc;n h&egrave; của bạn l&agrave; g&igrave;, đ&ocirc;i gi&agrave;y trainer trắng sẽ lu&ocirc;n gi&uacute;p bạn đạt được kế hoạch đặt ra.</p>

<h2>LỰA CHỌN MỚI SỐ 1 TRONG ĐẦU BẠN</h2>

<p>Bất kể phong c&aacute;ch ri&ecirc;ng của bạn l&agrave; g&igrave;, đ&ocirc;i gi&agrave;y trainer trắng lu&ocirc;n được xem l&agrave; m&oacute;n đồ phải c&oacute; trong tủ đồ. Cho d&ugrave; bạn muốn c&oacute; phong c&aacute;ch sneaker kinh điển hay vẻ ngo&agrave;i hiện đại hơn, đ&ocirc;i gi&agrave;y trainer trắng l&agrave; c&aacute;ch dễ nhất để n&acirc;ng tầm gu thẩm mỹ của bạn.</p>

<p>C&oacute; thể đ&oacute; l&agrave; mặc chung với quần jean v&agrave; &aacute;o thun graphic, phối với &aacute;o bra v&agrave; quần legging thể thao đồng điệu, quần short, quần nỉ hoặc v&aacute;y. Lu&ocirc;n c&oacute; rất nhiều c&aacute;ch để tr&ocirc;ng đẹp mắt với gi&agrave;y trainer trắng m&agrave; vẫn thể hiện được chất ri&ecirc;ng.</p>

<p>Vậy n&ecirc;n giờ đ&acirc;y khi ai đ&oacute; hỏi &quot;phối gi&agrave;y trainer trắng như thế n&agrave;o?&quot; th&igrave; cứ n&oacute;i l&agrave; &quot;sao cũng đẹp cả&quot;.</p>

<p style="text-align:center"><img alt="sportswear-FW22-chapter2-global-mainphase-sportswear-blogpost-image3-d" src="https://brand.assets.adidas.com/capi/viVN/Images/sportswear-fw22-chapter2-global-mainphase-sportswear-blogpost-image3-d_337-922250.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="sportswear-FW22-chapter2-global-mainphase-sportswear-blogpost-image3-d" /></p>
</div>
</div>
', N'/uploads/post/tải xuống (4).jpg', CAST(N'2025-05-14T10:57:35.370' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (8, N'CÁCH VỆ SINH GIÀY CHẠY BỘ ADIDAS 4DFWD', N'cach-ve-sinh-giay-chay-bo-adidas-4dfwd', N'Đôi giày adidas 4DFWD được thiết kế để phát huy hết tiềm năng hệt như bạn — và sẽ bền bỉ hơn nếu được chăm sóc cẩn thận. Dưới đây là cách vệ sinh giày 4DFWD bằng máy giặt, bằng tay và nhiều cách khác.', N'<h1>C&Aacute;CH VỆ SINH GI&Agrave;Y CHẠY BỘ ADIDAS 4DFWD</h1>

<p>Đ&ocirc;i gi&agrave;y adidas 4DFWD được thiết kế để ph&aacute;t huy hết tiềm năng hệt như bạn &mdash; v&agrave; sẽ bền bỉ hơn nếu được chăm s&oacute;c cẩn thận. Dưới đ&acirc;y l&agrave; c&aacute;ch vệ sinh gi&agrave;y 4DFWD bằng m&aacute;y giặt, bằng tay v&agrave; nhiều c&aacute;ch kh&aacute;c.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<div style="box-sizing: border-box;">Giống như adidas Ultraboost v&agrave; c&aacute;c đ&ocirc;i gi&agrave;y chạy bộ kh&aacute;c, gi&agrave;y 4DFWD cũng được thiết kế để ph&aacute;t huy hết tiềm năng hệt như bạn. Đế giữa cấu tr&uacute;c lưới in 3D độc đ&aacute;o chống chịu được thời tiết, gi&uacute;p bạn bứt ph&aacute; khỏi giới hạn tr&ecirc;n mỗi đường chạy, v&agrave; c&oacute; thiết kế th&iacute;ch ứng theo đường n&eacute;t b&agrave;n ch&acirc;n cho sải bước mượt m&agrave;.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Đồng thời, việc thường xuy&ecirc;n vệ sinh v&agrave; chăm s&oacute;c đ&ocirc;i gi&agrave;y adidas 4DFWD sẽ gi&uacute;p giảm m&ograve;n r&aacute;ch &mdash; để đ&ocirc;i gi&agrave;y lu&ocirc;n tươi mới như trong buổi chạy đầu ti&ecirc;n. May mắn thay, bạn c&oacute; thể vệ sinh chất liệu của 4DFWD bằng nhiều phương ph&aacute;p kh&aacute;c nhau. Dưới đ&acirc;y l&agrave; một số c&aacute;ch đ&atilde; được chứng minh để vệ sinh đ&ocirc;i gi&agrave;y chạy bộ của bạn.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="how-to-clean-4d-bodyimage-1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-clean-4d-bodyimage-1_337-737908.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-clean-4d-bodyimage-1" />&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>M&Aacute;Y GIẶT:</h2>
</div>

<div style="box-sizing: border-box;">N&oacute;i chung, phương ph&aacute;p to&agrave;n diện nhất &mdash; vệ sinh gi&agrave;y 4DFWD trong m&aacute;y giặt sẽ l&agrave;m sạch ho&agrave;n to&agrave;n th&acirc;n gi&agrave;y cũng như loại bỏ bụi bẩn khỏi đế giữa cấu tr&uacute;c lưới.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Trước khi bắt đầu, h&atilde;y nhớ th&aacute;o l&oacute;t gi&agrave;y v&agrave; d&acirc;y gi&agrave;y ra; c&aacute;c bộ phận n&agrave;y c&oacute; thể được vệ sinh ri&ecirc;ng v&agrave; th&aacute;o d&acirc;y gi&agrave;y sẽ gi&uacute;p giảm bớt nguy cơ vướng v&agrave;o vật kh&aacute;c. Sau đ&oacute;, đựng từng chiếc gi&agrave;y v&agrave;o t&uacute;i gối nhỏ hoặc t&uacute;i lưới giặt. Đặt chế độ giặt m&aacute;y th&agrave;nh đồ mỏng v&agrave; khối lượng đồ giặt &iacute;t nếu được. Sử dụng nước lạnh v&agrave; chất tẩy rửa ưa th&iacute;ch, rồi để gi&agrave;y kh&ocirc; ngo&agrave;i kh&ocirc;ng kh&iacute; để c&oacute; được vẻ ngo&agrave;i tốt như mới.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="how-to-clean-4d-bodyimage-2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-clean-4d-bodyimage-2_337-737909.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-clean-4d-bodyimage-2" />&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>B&Agrave;N CHẢI:</h2>
</div>

<div style="box-sizing: border-box;">L&ocirc;ng d&agrave;i của b&agrave;n chải đ&aacute;nh gi&agrave;y l&agrave; lựa chọn ho&agrave;n hảo để tiếp cận bụi bẩn ở đế giữa cấu tr&uacute;c lưới, c&ograve;n b&agrave;n chải đ&aacute;nh răng sẽ hiệu quả để vệ sinh th&acirc;n gi&agrave;y 4DFWD chuẩn x&aacute;c hơn. Bất kể chọn dụng cụ n&agrave;o, bạn cũng n&ecirc;n d&ugrave;ng nước ấm với x&agrave; ph&ograve;ng hoặc chất tẩy rửa th&acirc;n thiện với m&ocirc;i trường để vệ sinh tốt hơn.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="how-to-clean-4d-bodyimage-3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-clean-4d-bodyimage-3_337-737906.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-clean-4d-bodyimage-3" />&nbsp;</div>

<div style="box-sizing: border-box;">
<h2>V&Ograve;I NƯỚC:</h2>
</div>

<div style="box-sizing: border-box;">Giữ đế giữa của 4DFWD dưới v&ograve;i điều &aacute;p c&oacute; thể đ&aacute;nh bật bụi bẩn; nước sẽ thấm qua lưới, cuốn tr&ocirc;i v&agrave; ph&aacute; tan mọi chất bẩn. Sau khi gi&agrave;y ướt, h&atilde;y lắc kỹ gi&agrave;y ở ngo&agrave;i trời hoặc tr&ecirc;n bồn rửa để chất bẩn c&ograve;n s&oacute;t trong lưới rơi ra.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box;">Thoải m&aacute;i kết hợp c&aacute;c c&aacute;ch n&agrave;y để đạt được kết quả mong muốn. Trong mỗi c&aacute;ch,&nbsp;<a href="https://www.adidas.com/us/how-to-clean-shoes" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">here</a>đừng bao giờ đặt gi&agrave;y v&agrave;o m&aacute;y sấy v&igrave; nhiệt độ c&oacute; thể l&agrave;m cong đế.</div>
</div>
</div>
', N'/uploads/post/tải xuống (5).jpg', CAST(N'2025-05-14T11:00:52.180' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (9, N'ADIZERO - ĐÔI GIÀY CHẠY PHÁ VỠ CÁC KỶ LỤC', N'adizero-doi-giay-chay-pha-vo-cac-ky-luc', N'Tìm hiểu cách thức mà đôi giày adizero giúp mọi người làm chủ tốc độ, phá vỡ các kỷ lục thế giới cũng như hỗ trợ cho những người có thói quen chạy bộ hàng ngày.', N'<h1>ADIZERO - Đ&Ocirc;I GI&Agrave;Y CHẠY PH&Aacute; VỠ C&Aacute;C KỶ LỤC</h1>

<p>T&igrave;m hiểu c&aacute;ch thức m&agrave; đ&ocirc;i gi&agrave;y adizero gi&uacute;p mọi người l&agrave;m chủ tốc độ, ph&aacute; vỡ c&aacute;c kỷ lục thế giới cũng như hỗ trợ cho những người c&oacute; th&oacute;i quen chạy bộ h&agrave;ng ng&agrave;y.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;"><strong>C&Acirc;U CHUYỆN XUẤT XỨ CỦA ADIZERO - MỘT NGƯỜI H&Ugrave;NG ĐƯỢC SINH RA THẾ N&Agrave;O</strong>

<p>Năm 2004, sau nhiều thập kỷ tạo ra những đ&ocirc;i gi&agrave;y gi&uacute;p c&aacute;c vận động vi&ecirc;n chiến thắng giải chạy v&agrave; ph&aacute; vỡ c&aacute;c kỷ lục, adidas muốn bứt ph&aacute; giới hạn v&agrave; ph&aacute;t triển một đ&ocirc;i gi&agrave;y c&oacute; thể thực sự định nghĩa lại kh&aacute;i niệm về tốc độ.<br />
<br />
Kh&ocirc;ng ai ph&ugrave; hợp hơn nh&agrave; thiết kế gi&agrave;y huyền thoại người Nhật, &ocirc;ng Toshiaki Omori, người đ&atilde; hỗ trợ adidas tạo ra những đ&ocirc;i gi&agrave;y chạy đẳng cấp thế giới từ năm 1999. D&agrave;nh cả đời tạo dựng triết l&yacute; thiết kế &quot;tỉ mỉ&quot;, Omori tin rằng cấu tạo của b&agrave;n ch&acirc;n lu&ocirc;n l&agrave; yếu tố quan trọng h&agrave;ng đầu trong kh&acirc;u chế tạo. Sử dụng khu&ocirc;n gi&agrave;y từ b&agrave;n ch&acirc;n thật, Omori nỗ lực mang lại cảm gi&aacute;c vừa vặn ho&agrave;n hảo nhất c&oacute; thể - được &ocirc;ng gọi l&agrave; &quot;microfit&quot;.<br />
&nbsp;</p>

<p style="text-align:center"><img alt="running-ss20-adizero-story-omori-desktop" src="https://brand.assets.adidas.com/capi/viVN/Images/2021/12/running-ss20-adizero-story-omori-desktop_337-436109.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; text-align:center; width:712.525px" title="running-ss20-adizero-story-omori-desktop" /></p>
<br />
Để đạt được sự h&ograve;a hợp giữa ch&acirc;n v&agrave; gi&agrave;y, sự đơn giản l&agrave; điều cốt yếu. Từ lựa chọn chất liệu v&agrave; vải dệt, đến trọng lượng v&agrave; phần đệm đế, mọi yếu tố đều được c&acirc;n nhắc kỹ c&agrave;ng. Đ&ocirc;i gi&agrave;y cần c&oacute; cảm gi&aacute;c nhẹ nh&agrave;ng để đạt được tốc độ tối đa m&agrave; kh&ocirc;ng hề thấy kh&oacute; chịu. Đ&ocirc;i gi&agrave;y cần phải thanh lịch, vừa vặn như đi tất v&agrave; sẵn s&agrave;ng để bứt tốc. Hơn nữa, như mọi vận động vi&ecirc;n đều biết, đ&ocirc;i gi&agrave;y vừa phải c&oacute; vẻ ngo&agrave;i thanh tho&aacute;t, vừa phải mang lại cảm gi&aacute;c nhanh nhẹn.<br />
<br />
Qua mỗi bước tr&ecirc;n h&agrave;nh tr&igrave;nh, đội thiết kế lu&ocirc;n phải vượt qua một thử th&aacute;ch mới. Đ&ocirc;i gi&agrave;y phải linh hoạt v&agrave; c&oacute; thể th&iacute;ch nghi với mọi điều kiện - chạy đường d&agrave;i, chạy nhịp độ nhanh 10 km, chạy cường độ cao tr&ecirc;n m&aacute;y chạy, hay chạy si&ecirc;u marathon.<br />
<br />
R&otilde; r&agrave;ng, nh&oacute;m thiết kế v&agrave; nh&oacute;m ph&aacute;t triển đứng trước một nhiệm vụ thực sự kh&oacute; khăn.<br />
<br />
Cuối c&ugrave;ng, sau nhiều năm ph&aacute;t triển kỹ lưỡng, đ&atilde; đến l&uacute;c giới thiệu adizero cho cả thế giới.<br />
<br />
Th&aacute;ng 9/2008, đ&ecirc;m trước cuộc thi marathon Berlin. Trong ph&ograve;ng kh&aacute;ch sạn, vận động vi&ecirc;n chạy đường d&agrave;i người Ethiopia, Haile Gebrselassie, buộc d&acirc;y đ&ocirc;i gi&agrave;y adizero Adios nguy&ecirc;n mẫu đầu ti&ecirc;n. Anh chạy dọc h&agrave;nh lang kh&aacute;ch sạn để thử nghiệm đ&ocirc;i gi&agrave;y v&agrave; cảm nhận độ đ&agrave;n hồi của đế gi&agrave;y mỗi khi b&agrave;n ch&acirc;n chạm đất. Qu&aacute; ấn tượng, anh quyết định mang đ&ocirc;i gi&agrave;y adizero cho cuộc thi marathon.<br />
<br />
Ng&agrave;y h&ocirc;m sau, anh xuất sắc ph&aacute; kỷ lục thế giới 29 gi&acirc;y bằng đ&ocirc;i gi&agrave;y adizero với tổng thời gian chạy 2:03:59. Chiến thắng thứ ba li&ecirc;n tiếp của anh.<br />
&nbsp;
<p style="text-align:center"><img alt="running-ss20-adizero-story-neftanga-desktop" src="https://brand.assets.adidas.com/capi/viVN/Images/2021/12/running-ss20-adizero-story-neftanga-desktop_337-436107.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; text-align:center; width:712.525px" title="running-ss20-adizero-story-neftanga-desktop" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
<br />
<br />
<strong>L&Agrave;N S&Oacute;NG ADIZERO G&Acirc;Y CHẤN ĐỘNG THẾ GIỚI</strong>

<p>Từ đợt ra mắt đ&igrave;nh đ&aacute;m v&agrave;o năm 2008, gi&agrave;y adizero đ&atilde; thu về hơn 150 chức v&ocirc; địch trong c&aacute;c giải chạy h&agrave;ng đầu thế giới. Để c&oacute; được những chiến thắng đ&oacute;, đội ngũ adizero đ&atilde; kh&ocirc;ng ngừng cải thiện đ&ocirc;i gi&agrave;y - &quot;thử nghiệm v&agrave; cải tiến với hỗ trợ từ c&aacute;c vận động vi&ecirc;n l&agrave; yếu tố cơ bản trong quy tr&igrave;nh&quot;, nh&agrave; thiết kế gi&agrave;y chạy của adidas Moritz Hoellmueller ph&aacute;t biểu.<br />
<br />
Dựa tr&ecirc;n phản hồi từ c&aacute;c vận động vi&ecirc;n, c&aacute;c nh&agrave; thiết kế li&ecirc;n tục nỗ lực s&aacute;ng tạo để cho ra những cải tiến mới. Với mỗi cải tiến, c&aacute;c vận động vi&ecirc;n lại được tiếp th&ecirc;m sức mạnh để nỗ lực hơn nữa.<br />
<br />
Lee Ryan, đội trưởng nh&oacute;m adidas Runners Dubai v&agrave; người bố của hai con, đ&atilde; cải thiện th&agrave;nh t&iacute;ch c&ugrave;ng với bước ph&aacute;t triển của đ&ocirc;i gi&agrave;y. Với adizero, anh đ&atilde; ph&aacute; năm kỷ lục thế giới, bao gồm một kỷ lục chạy marathon c&ugrave;ng xe đẩy đ&ocirc;i. &quot;Đ&ocirc;i gi&agrave;y ng&agrave;y c&agrave;ng tốt hơn qua thời gian, giống như t&ocirc;i cũng nhanh hơn qua thời gian&quot;, Ryan n&oacute;i.<br />
&nbsp;</p>

<p style="text-align:center"><img alt="running-ss20-adizero-story-ryan-desktop" src="https://brand.assets.adidas.com/capi/viVN/Images/2021/12/running-ss20-adizero-story-ryan-desktop_337-436110.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; text-align:center; width:712.525px" title="running-ss20-adizero-story-ryan-desktop" /></p>
<br />
Ryan n&oacute;i kh&ocirc;ng thể ch&iacute;nh x&aacute;c hơn; adizero đang li&ecirc;n tục cải thiện c&ugrave;ng c&aacute;c vận động vi&ecirc;n. Chỉ ba năm sau khi Gebrselassie thắng giải marathon Berlin, Patrick Makau mang phi&ecirc;n bản tiếp theo của đ&ocirc;i gi&agrave;y v&agrave; ph&aacute; kỷ lục cũ 21 gi&acirc;y. Năm 2014, một phi&ecirc;n bản kh&aacute;c của adizero lại ph&aacute; kỷ lục khi Dennis Kimetto về đ&iacute;ch sớm hơn kỷ lục của Makau 41 gi&acirc;y bằng đ&ocirc;i gi&agrave;y adizero Adios Boost.<br />
<br />
Khi c&agrave;ng nhiều vận động vi&ecirc;n h&agrave;ng đầu bắt đầu mang đ&ocirc;i gi&agrave;y, sự ch&uacute; &yacute; từ nhiều đối tượng đa dạng cũng ng&agrave;y một tăng cao. adidas đ&atilde; giải quyết vấn đề đ&oacute;. Đến nay, adizero đ&atilde; mở rộng th&agrave;nh một d&ograve;ng gi&agrave;y ph&ugrave; hợp cho mọi tr&igrave;nh độ. Ben Herath, một nh&agrave; thiết kế của đ&ocirc;i gi&agrave;y adizero Adios đầu ti&ecirc;n, tin rằng &quot;gi&agrave;y nhẹ l&agrave; d&agrave;nh cho mọi người v&igrave; ch&uacute;ng ta đều muốn chạy nhanh. Đ&oacute; l&agrave; mục ti&ecirc;u, cải thiện tốc độ cho mọi người.&quot;<br />
<br />
adizero trở th&agrave;nh đ&ocirc;i gi&agrave;y chạy nhanh ph&ugrave; hợp cho số đ&ocirc;ng. Mathilde Have, đội trưởng nh&oacute;m adidas Runners Copenhagen, cảm thấy đ&ocirc;i gi&agrave;y adizero đ&atilde; thay đổi ho&agrave;n to&agrave;n tốc độ của c&ocirc; - &quot;T&ocirc;i cảm thấy nhanh hơn, v&agrave; cảm gi&aacute;c đ&oacute; khiến t&ocirc;i chạy nhanh hơn&quot;. Giống như những người chạy adizero kh&aacute;c, đ&ocirc;i gi&agrave;y khiến c&ocirc; tự tin hơn, gi&uacute;p c&ocirc; t&igrave;m lại đam m&ecirc; chạy nhanh của m&igrave;nh.<br />
&nbsp;
<p style="text-align:center"><img alt="running-ss20-adizero-story-mathide-desktop" src="https://brand.assets.adidas.com/capi/viVN/Images/2021/12/running-ss20-adizero-story-mathide-desktop_337-436105.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; text-align:center; width:712.525px" title="running-ss20-adizero-story-mathide-desktop" /></p>

<p>&nbsp;</p>
<br />
<strong>CHỜ Đ&Oacute;N ĐIỀU G&Igrave; TIẾP THEO Ở ADIZERO?</strong>

<p>Người chạy v&agrave; gi&agrave;y chạy c&oacute; một điểm chung: đều muốn chạy nhanh hơn. D&ugrave; bạn đang đặt mục ti&ecirc;u ph&aacute; kỷ lục marathon hay chỉ l&agrave; người chạy 5 km thường ng&agrave;y, adizero đều c&oacute; thể gi&uacute;p bạn n&acirc;ng cao tr&igrave;nh độ. N&ecirc;n c&acirc;u hỏi thực sự kh&ocirc;ng phải chờ đ&oacute;n điều g&igrave; tiếp theo ở adizero, m&agrave; l&agrave; chờ đ&oacute;n điều g&igrave; tiếp theo ở bạn? Nếu bạn đ&atilde; sẵn s&agrave;ng chạy nhanh hơn, đ&atilde; đến l&uacute;c kh&aacute;m ph&aacute; d&ograve;ng gi&agrave;y adizero.</p>
</div>
</div>
', N'/uploads/post/images.jpg', CAST(N'2025-05-14T11:07:12.347' AS DateTime), NULL, CAST(N'2025-05-14T11:19:21.577' AS DateTime), NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (10, N'The adidas Samba Size Guide', N'the-adidas-samba-size-guide', N'Discover classic adidas heritage through the fit and feel of the one and only Samba.', N'<h1>The adidas Samba Size Guide</h1>

<p>Discover classic adidas heritage through the fit and feel of the one and only Samba.</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<h2>About The adidas Samba</h2>

<div style="box-sizing: border-box;">Born for the world of soccer, the adidas Samba was made for better grip on flat, hard surfaces. The Samba is still a top choice for indoor soccer games, and now different styles of the Samba reign in&nbsp;<a href="https://www.adidas.com/us/samba-cycling-shoes" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">cycling</a>, on the&nbsp;<a href="https://www.adidas.com/us/samba-golf-shoes" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">golf</a>&nbsp;course, and in streetwear. Through its many forms, the Samba is universally recognizable with a suede T-Toe design for that authentic Samba look and a textured rubber cupsole inspired by soccer heritage.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>How Do adidas Sambas Fit?</h2>

<div style="box-sizing: border-box;">adidas Sambas have a regular fit, but some people find them to be slightly narrow. If you have wider feet, go up half a size for a little more room.&nbsp;<a href="https://www.adidas.com/us/blog/968383-how-to-measure-shoe-size" style="box-sizing: border-box; border-radius: 0px; box-shadow: none; color: rgb(0, 0, 0); cursor: pointer; text-decoration-style: solid; text-decoration-color: rgb(0, 0, 0); -webkit-tap-highlight-color: rgba(0, 0, 0, 0); touch-action: manipulation; background-color: rgba(255, 255, 255, 0); display: inline; padding-left: 1px; padding-right: 1px; vertical-align: bottom; line-height: 22px;">Measure your feet</a>&nbsp;and check the adidas Samba size chart to find your size.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Samba-Size-Guide-Blog-Image-01" src="https://brand.assets.adidas.com/capi/viVN/Images/samba-size-guide-blog-image-01_337-982552.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Samba-Size-Guide-Blog-Image-01" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>Samba OG Shoes</h2>

<div style="box-sizing: border-box;">Staying true to their legacy, the Samba OG features a soft leather upper and suede T-Toe. Mix it up with styles that sport a full suede upper in a range of seasonal color combinations. Like all others, the Samba OG has a regular fit that leans narrow for those with wider feet.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Samba-Size-Guide-Blog-Image-02" src="https://brand.assets.adidas.com/capi/viVN/Images/samba-size-guide-blog-image-02_337-982555.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Samba-Size-Guide-Blog-Image-02" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>Samba Vegan Shoes</h2>

<div style="box-sizing: border-box;">That same Samba look and feel&mdash;with the planet in mind. The Samba Vegan Shoes are made with synthetic, non-animal derived materials, and are made with recycled content as part of our ambition to end plastic waste. Samba Vegan Shoes fit just like your other favorites, but if you have wider feet then go up a half size.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Samba-Size-Guide-Blog-Image-03" src="https://brand.assets.adidas.com/capi/viVN/Images/samba-size-guide-blog-image-03_337-982553.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Samba-Size-Guide-Blog-Image-03" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>Samba Classic</h2>

<div style="box-sizing: border-box;">Take over the indoor soccer field with speed and ultimate grip. A classic for a reason, these lightweight shoes have comfort and responsiveness so you can play your game the way you intend. They&rsquo;re easy to break in, and you should choose your regular size or go up half a size for a wider fit.</div>

<div style="box-sizing: border-box;">&nbsp;</div>

<div style="box-sizing: border-box; text-align:center;"><img alt="Samba-Size-Guide-Blog-Image-04" src="https://brand.assets.adidas.com/capi/viVN/Images/samba-size-guide-blog-image-04_337-982551.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="Samba-Size-Guide-Blog-Image-04" /></div>

<div style="box-sizing: border-box;">&nbsp;</div>

<h2>Velosamba Vegan Cycling Shoe</h2>

<div style="box-sizing: border-box;">For the cyclist who craves that classic streetwear style on the go, the Velosamba is the perfect incognito bike shoe. Designed with bike commuting and indoor cycling in mind, the midsole is reinforced for efficient pedaling that still provides comfortable flex while walking. Pick your colors and rep the signature style of the Samba when you hit the pedals. Same as all other models, the Velosamba sports a regular fit, but size up for a wider fit.</div>
</div>
</div>
', N'/uploads/post/tải xuống (6).jpg', CAST(N'2025-05-14T11:10:15.507' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (11, N'6 Creative Ways To Lace Up Your Sneakers With Instructions', N'6-creative-ways-to-lace-up-your-sneakers-with-instructions', N'Take your sneaker game to the next level with our guide on how to lace your new sneakers. From straight lacing to ladder lacing - we cover them all!', N'<h1>6 Creative Ways To Lace Up Your Sneakers With Instructions</h1>

<p>Take your sneaker game to the next level with our guide on how to lace your new sneakers. From straight lacing to ladder lacing - we cover them all!</p>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<p>You gotta know how to lace sneakers by finding a style that fits you and your shoes. Take a moment before bringing those fresh kicks to the street so you&rsquo;re looking good from head-to-toe. Each and every detail matters when you&rsquo;re trying to dominate the streetstyle game. One way to step up your look is to make those laces pop.</p>

<p>Here you&rsquo;ll find six creative ways to lace up your sneakers. Some offer a functional approach, some more stylish. But all of them offer a chance for you to express your individuality and creator spirit. Letting your shoes speak to your style wherever you&rsquo;re headed.</p>

<h1>LACING INSTRUCTIONS</h1>

<p>When you&rsquo;re learning how to lace sneakers, follow these steps:</p>

<p>&nbsp;</p>

<h2>Straight Lacing:</h2>

<p>This style is also called &ldquo;fashion lacing&rdquo; or &ldquo;street lacing&rdquo; since it&rsquo;s casual, clean and cool. The loose lacing style gives your foot room to breathe so you can put swagger in your step.</p>

<p>&nbsp;</p>

<p style="text-align:center"><img alt="how-to-straight-lace-sneakers-step1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-straight-lace-sneakers-step1_337-339558.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-straight-lace-sneakers-step1" /></p>

<h3>Step #1</h3>

<p>Start with an equal amount of lace on each side of the bottom eyelet.</p>

<h3 style="text-align:center"><img alt="how-to-straight-lace-sneakers-step2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-straight-lace-sneakers-step2_337-339559.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-straight-lace-sneakers-step2" /></h3>

<h3>Step #2</h3>

<p>Left lace goes straight up the inside of the shoe to the second eyelet, then straight across.</p>

<h3 style="text-align:center"><img alt="how-to-straight-lace-sneakers-step3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-straight-lace-sneakers-step3_337-339560.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-straight-lace-sneakers-step3" /></h3>

<h3>Step #3</h3>

<p>Right lace goes straight up the inside of the shoe to the third eyelet, then straight across.</p>

<h3 style="text-align:center"><img alt="how-to-straight-lace-sneakers-step4" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-straight-lace-sneakers-step4_337-339561.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-straight-lace-sneakers-step4" /></h3>

<h3>Step #4</h3>

<p>Repeat Steps 2 and 3, alternating between the right and left laces skipping their respective eyelets inside the shoe before running straight across to the next eyelet. Continue this pattern until complete and finish with a regular knot.</p>

<p>&nbsp;</p>

<h2>Ladder Lacing:</h2>

<p>This unmistakable design weaves laces together horizontally across the top of the shoe and vertically around each eyelet to create a &ldquo;ladder.&rdquo; The look always attracts attention for its unique and distinctive style, one originally created for military boots worn by ceremonial guards. As such, when shoes have lots of eyelets like Stan Smith&rsquo;s, then it&rsquo;s highly effective at keeping your shoes tied throughout the entire day.</p>

<p style="text-align:center"><img alt="how-to-ladder-lace-sneakers-step1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-ladder-lace-sneakers-step1_337-339544.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-ladder-lace-sneakers-step1" /></p>

<h3>Step #1</h3>

<p>Lace straight across through the bottom eyelets. Make sure you have an equal amount of lace remaining on the left and right sides.</p>

<h3 style="text-align:center"><img alt="how-to-ladder-lace-sneakers-step2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-ladder-lace-sneakers-step2_337-339545.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-ladder-lace-sneakers-step2" /></h3>

<h3>Step #2</h3>

<p>Run each lace into the second eyelet directly above by going straight up the outside of the shoe.</p>

<h3 style="text-align:center"><img alt="how-to-ladder-lace-sneakers-step3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-ladder-lace-sneakers-step3_337-339546.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-ladder-lace-sneakers-step3" /></h3>

<h3>Step #3</h3>

<p>Now, feed each lace straight across to the opposite side, then wrap it under the lace and the second eyelet (but not through the eyelet), before continuing up to the next eyelet directly above.</p>

<p style="text-align:center"><img alt="how-to-ladder-lace-sneakers-step4" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-ladder-lace-sneakers-step4_337-339543.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-ladder-lace-sneakers-step4" /></p>

<h3>Step #4</h3>

<p>Repeat the same process. Sending the laces straight across, under the adjacent lace and eyelet, before stringing it up to the next open eyelet until you&rsquo;re finished.</p>

<h3>Step #5</h3>

<p>Take the laces back across and under a final time for a consistent look before tying a bow knot.</p>

<p>&nbsp;</p>

<h2>Spider Web Lacing:</h2>

<p>This is the show stopper. The Spider Web is a detailed and intricate lacing technique to stand out on the streets and start turning heads. The impressive style weaves an elaborate web with laces going back and forth across the top of the shoe, so follow the steps closely. It&rsquo;s as complex as it is cool.</p>

<h3 style="text-align:center"><img alt="how-to-spider-web-lace-sneakers-step1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-spider-web-lace-sneakers-step1_337-339554.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-spider-web-lace-sneakers-step1" /></h3>

<h3>Step #1</h3>

<p>Begin by lacing straight across the second-from-the-bottom eyelets and make sure each end is even.</p>

<h3 style="text-align:center"><img alt="how-to-spider-web-lace-sneakers-step2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-spider-web-lace-sneakers-step2_337-339555.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-spider-web-lace-sneakers-step2" /></h3>

<h3>Step #2</h3>

<p>Slip each end down the outside of the shoe to the first, bottom eyelet.</p>

<h3 style="text-align:center"><img alt="how-to-spider-web-lace-sneakers-step3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-spider-web-lace-sneakers-step3_337-339556.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-spider-web-lace-sneakers-step3" /></h3>

<h3>Step #3</h3>

<p>Take each lace diagonally across the shoe, creating an &ldquo;X&rdquo; as the laces move into the third eyelets.</p>

<h3 style="text-align:center"><img alt="how-to-spider-web-lace-sneakers-step4" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-spider-web-lace-sneakers-step4_337-339557.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-spider-web-lace-sneakers-step4" /></h3>

<h3>Step #4</h3>

<p>Now, take each lace straight back down, wrapping under the lace and eyelet directly below (not through the eyelet). Then take the laces up, diagonally crossing into the next open eyelet. In this case, it should be the fourth.</p>

<h3>Step #5</h3>

<p>Repeat Step 4 until you&rsquo;ve reached the top eyelets and tied your preferred knot.</p>

<p><strong>Note:</strong>&nbsp;This style looks best when shoes have many eyelets to create a more intricate weave and when the sides of the shoe are further apart, displaying more of the shoelace web.</p>

<p>&nbsp;</p>

<h2>Bow Tie Lacing:</h2>

<p>If you want to rock a lacing style that&rsquo;s more minimalistic, then Bow Tie lacing is the way to go. It hides the laces by running them up the inside of the shoe vertically before crossing them over on the outside to form a simple &ldquo;bow-ties.&rdquo; Creating a loose fit that&rsquo;s comfortable, casual and stylish. 100%.</p>

<p><strong>Note:</strong>The method changes depending on the number of eyelets your shoes have and you might want shorter shoelaces because Bow Tie lacing doesn&rsquo;t require much.</p>

<p style="text-align:center"><img alt="how-to-bow-tie-lace-sneakers-step1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-bow-tie-lace-sneakers-step1_337-339539.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-bow-tie-lace-sneakers-step1" /></p>

<h3>Step 1 - Even Number of Eyelets</h3>

<p>Take the lace straight across and through the bottom eyelets on the outside of the shoe.</p>

<h3>Step 1 &ndash; Odd Number of Eyelets</h3>

<p>Take the lace straight across and through the bottom eyelets on the outside of the shoe.</p>

<h3 style="text-align:center"><img alt="how-to-bow-tie-lace-sneakers-step2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-bow-tie-lace-sneakers-step2_337-339540.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-bow-tie-lace-sneakers-step2" /></h3>

<h3>Step 2 &ndash; Even Number of Eyelets</h3>

<p>Slide the laces up to the second eyelet on the inside of the shoe, then across diagonally into the third eyelets. Making an &ldquo;X&rdquo; shape.</p>

<h3>Step 2 &ndash; Odd Number of Eyelets</h3>

<p>Thread the right and left laces across each other diagonally into the second eyelets. Creating an &ldquo;X&rdquo; on the top of the shoe.</p>

<h3 style="text-align:center"><img alt="how-to-bow-tie-lace-sneakers-step3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-bow-tie-lace-sneakers-step3_337-339541.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-bow-tie-lace-sneakers-step3" /></h3>

<h3>Step 3</h3>

<p>String the laces through the inside of the shoe to the open eyelet directly above, before crossing the laces diagonally on the outside of the shoe into the next available eyelet.</p>

<h3 style="text-align:center"><img alt="how-to-bow-tie-lace-sneakers-step4" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-bow-tie-lace-sneakers-step4_337-339542.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-bow-tie-lace-sneakers-step4" /></h3>

<h3>Step 4</h3>

<p>Continue the pattern until you&rsquo;ve reached the top of the shoe. Tie knot.</p>

<h2>&nbsp;</h2>

<h2>Loop-Back Lacing:</h2>

<p>When you&rsquo;re rocking Loop-Back Lacing, fancy footwork takes on a whole new meaning. This decorative style loops the laces together straight down the middle of the shoe. It&rsquo;s the opposite approach of traditional crisscross lacing patterns. To really make the style pop, try thick, round and colorful laces that contrast with the color of the shoe (for example: white laces on black shoes).</p>

<p style="text-align:center"><img alt="how-to-loop-back-lace-sneakers-step1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-loop-back-lace-sneakers-step1_337-339548.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-loop-back-lace-sneakers-step1" /></p>

<h3>Step #1</h3>

<p>First thing first, take the lace directly across the bottom eyelets &ndash; leaving the left and right laces equal in length.</p>

<h3 style="text-align:center"><img alt="how-to-loop-back-lace-sneakers-step2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-loop-back-lace-sneakers-step2_337-339549.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-loop-back-lace-sneakers-step2" /></h3>

<h3>Step #2</h3>

<p>Now you&rsquo;re going to take each lace diagonally across the shoe, wrap them around each other in the middle and string them back through the inside of the next open eyelet. Note: Laces should loop in the middle, and the left and right laces should always return to the same side.</p>

<h3 style="text-align:center"><img alt="how-to-loop-back-lace-sneakers-step3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-loop-back-lace-sneakers-step3_337-339550.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-loop-back-lace-sneakers-step3" /></h3>

<h3>Step #3</h3>

<p>Repeat Step 2 for each eyelet by continuing to loop the left and right laces together in the middle of the shoe and back through the next open eyelet.</p>

<h3 style="text-align:center"><img alt="how-to-loop-back-lace-sneakers-step4" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-loop-back-lace-sneakers-step4_337-339547.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-loop-back-lace-sneakers-step4" /></h3>

<h3>Step #4</h3>

<p>Once the laces have reached the top of the shoe, tie your preferred knot.</p>

<h2>&nbsp;</h2>

<h2>Missing Laces:</h2>

<p>Show your true creator spirit with this imaginative and original lacing technique. What makes this one so different? The laces are hidden, taking the shortest path through the eyelets along the inside of the shoe and making it appear as if your shoes are missing laces. The novelty style creates an incredibly loose fit that&rsquo;s perfect for kicking it with your crew. Just don&rsquo;t plan on busting a move on the dance floor.</p>

<p style="text-align:center"><img alt="how-to-missing-lace-sneakers-step1" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-missing-lace-sneakers-step1_337-339552.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-missing-lace-sneakers-step1" /></p>

<h3>Step #1</h3>

<p>Begin by threading the lace straight across the bottom eyelets. Leave an equal amount of lace on the left and right sides.</p>

<h3 style="text-align:center"><img alt="how-to-missing-lace-sneakers-step2" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-missing-lace-sneakers-step2_337-339553.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-missing-lace-sneakers-step2" /></h3>

<h3>Step #2</h3>

<p>Take each lace straight up into the eyelet above and continue stringing the laces through the eyelet above, alternating in and out but never crossing over the middle.</p>

<h3 style="text-align:center"><img alt="how-to-missing-lace-sneakers-step3" src="https://brand.assets.adidas.com/capi/viVN/Images/how-to-missing-lace-sneakers-step3_337-339551.jpg" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="how-to-missing-lace-sneakers-step3" /></h3>

<h3>Step #3</h3>

<p>Once you reach the top of the shoe, tie it in a bow and tuck the bow behind the tongue. Note: Shorter shoelaces are recommended or you&rsquo;ll need to tuck the extra lace material inside the shoe.</p>
</div>
</div>
', N'/uploads/post/tải xuống (7).jpg', CAST(N'2025-05-14T11:14:30.447' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Post] ([Id], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive]) VALUES (12, N'Through The Eyes Of The Fans: Mary Fowler', N'through-the-eyes-of-the-fans-mary-fowler', N'From Queensland to the world’s biggest stage, Mary Fowler is what you get when a creative, free spirit meets the hopes of a nation.', N'<h1>Through The Eyes Of The Fans: Mary Fowler</h1>

<div class="_article-body-wrapper_7b1ci_206" style="box-sizing: border-box; color: rgb(0, 0, 0); font-family: AdihausDIN, Helvetica, Arial, sans-serif; font-size: 16px;">
<div class="_article-body_7b1ci_206" style="box-sizing: border-box; margin-top: 30px;">
<p>From Queensland to the world&rsquo;s biggest stage, Mary Fowler is what you get when a creative, free spirit meets the hopes of a nation.</p>

<p>A true midfield maestro. The kind that can unlock any defence with ease. Mesmerising dribbles, passes and goals that leave your jaw on the floor are all part of the Fowler show. Just 20-years-old, her footballing journey has taken her to all corners of the globe.</p>

<p style="text-align:center">From New South Wales to Manchester via Montpellier. But this summer, she&rsquo;s back Down Under for the FIFA Women&rsquo;s World Cup 2023&trade;<br />
<br />
<img alt="football-fw23-WWC-blog-3-bodyimage-1" src="https://brand.assets.adidas.com/capi/enGB/Images/football-fw23-wwc-blog-3-bodyimage-1_143-1039751.png" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="football-fw23-WWC-blog-3-bodyimage-1" /></p>

<p><em>&quot;Watching Mary Fowler at her best is pure joy. She plays with freedom.&quot;</em></p>

<p><em>- Becky, UK.</em></p>

<p><br />
While she&#39;s a budding artist off the pitch, the green grass is her canvas too. And it&rsquo;s no surprise those talents have taken her right to the very top. Forged in Cairns, tailor-made for international football&rsquo;s lofty heights, her stints through the youth ranks made her one to watch, but at the Olympic Games, she truly took her place centre stage.</p>

<p><em>&quot;It was hard to look past Fowler at the Olympics. Especially in the quarter-final.&quot;</em></p>

<p><em>- Pokuah, Australia</em></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><strong>VOICE OF THE FAN:</strong>&nbsp;<em>&quot;It was hard to look past Fowler at the Olympics, especially in the Quarter Final. Her best performance for the national team&hellip; So far at least. In that moment, it was like seeing the future first-hand. Rubbing shoulders with some of the world&rsquo;s greatest and, at times, looking like the best of the lot.Grabbing a goal too. That touch and turn, that was special.&quot;&nbsp;</em>&nbsp;<strong>- Pokuah, Australia</strong></p>

<p style="text-align:center"><br />
That game might have been played nearly 5000 miles away from Australia, but the&nbsp;shockwaves were certainly felt back home. A young star in the making, stamping both her name and her country&rsquo;s on the footballing map.<br />
<br />
<img alt="football-fw23-WWC-blog-3-bodyimage-3" src="https://brand.assets.adidas.com/capi/enGB/Images/football-fw23-wwc-blog-3-bodyimage-3_143-1039750.png" style="box-sizing:border-box; margin-top:15px; object-fit:cover; width:712.525px" title="football-fw23-WWC-blog-3-bodyimage-3" /></p>

<p><em>&quot;She&rsquo;s an ambassador for not just Australian multiculturalism, but football&rsquo;s too.&quot;</em></p>

<p><em>- Tom, Australia</em></p>

<p><br />
And that&rsquo;s where the beautiful game really works its magic. Seeing one of your own walk out onto that pitch, representing the team you love and doing things with a football you never thought were possible.</p>

<p><em>&quot;Having made her international debut at just 15-years-old, she&rsquo;s racked up a fair chunk of caps ever since. It just illustrates how exciting the future of football here is.&quot;</em></p>

<p><em>- Tom, Australia</em></p>

<p><br />
Now add in a FIFA Women&rsquo;s World Cup 2023&trade; on home soil, and Fowler&rsquo;s level of skill&hellip; The magic is growing.</p>
</div>
</div>
', N'/uploads/post/tải xuống (8).jpg', CAST(N'2025-05-14T11:24:33.590' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (35, N' ADIDAS SAMBA OG', N'adidas-samba-og', 5, N' IH8047', N'Giày rất đẹp và dùng rất thoải mái', N'<ul>
	<li>D&aacute;ng regular fit</li>
	<li>C&oacute; d&acirc;y gi&agrave;y</li>
	<li>Th&acirc;n gi&agrave;y bằng da v&agrave; mũi gi&agrave;y chữ T bằng da lộn</li>
	<li>Lớp l&oacute;t bằng vải dệt</li>
</ul>
', N'/uploads/product/ADIDAS SAMBA OG.jpg', NULL, CAST(1500000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2025-05-26T10:43:32.403' AS DateTime), NULL, 1, 0, 1, 1, 0, 7, 1)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (44, N'Giày Campus 00s', N'giay-campus-00s', 6, N'I74849', N'Giày Campus dành cho cả nam và nữ', NULL, N'/uploads/product/gy0042-giay-adidas-campus-00s-gia-tot-den-king-shoes-1-1732786311.jpg', CAST(2500000.00 AS Decimal(18, 2)), CAST(2000000.00 AS Decimal(18, 2)), NULL, NULL, CAST(N'2025-05-26T10:42:26.647' AS DateTime), NULL, 1, 1, 1, 1, 1, 9, 6)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (51, N'ADIDAS VL COURT 2.0', N'adidas-vl-court-20', 8, N'ID6015', N'Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', NULL, N'/uploads/product/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-1-1743923139.jpg', NULL, CAST(1950000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:12:13.060' AS DateTime), NULL, CAST(N'2025-05-26T10:47:06.183' AS DateTime), NULL, 1, 0, 1, 0, 0, 2, 20)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (52, N' ADIDAS CLIMACOOL BOUNCE', N'adidas-climacool-bounce', 10, N'ID4017', N'Giày adidas Bounce mang lại sự thoải mái và hỗ trợ tối ưu với công nghệ đệm êm, giúp bạn sẵn sàng chinh phục mọi hoạt động với phong cách năng động, tự tin.', N'Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.', N'/uploads/product/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-1.png', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:23:10.090' AS DateTime), NULL, CAST(N'2025-05-26T10:45:43.003' AS DateTime), NULL, 1, 1, 0, 0, 0, 3, 21)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (53, N' ADIDAS SAMBA OG', N'adidas-samba-og', 5, N'IE6522', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ie6522-giay-samba-og-nau-gia-tot-den-king-shoes-1-1730607844.jpg', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:28:44.393' AS DateTime), NULL, CAST(N'2025-05-26T10:43:22.503' AS DateTime), NULL, 1, 0, 1, 1, 0, 9, 1)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (54, N'ADIDAS SAMBA OG', N'adidas-samba-og', 5, N'IE6523', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ie6523-giay-adidas-samba-og-nau-gia-tot-den-king-shoes-1-1730607528.jpg', CAST(1500000.00 AS Decimal(18, 2)), CAST(1200000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:31:31.997' AS DateTime), NULL, CAST(N'2025-05-26T10:43:13.113' AS DateTime), NULL, 1, 0, 0, 0, 1, 10, 1)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (55, N'SAMBA OG', N'samba-og', 5, N'JI2009', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ji2009-giay-adidas-samba-og-gia-tot-den-king-shoes-1-1728301475.jpg', CAST(2500000.00 AS Decimal(18, 2)), CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:33:58.563' AS DateTime), NULL, CAST(N'2025-05-26T10:45:06.300' AS DateTime), NULL, 1, 0, 0, 0, 1, 2, 1)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (56, N' ADIDAS SAMBA INTER MIAMI', N'adidas-samba-inter-miami', 5, N'IH8157', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ih8157-giay-adidas-samba-inter-miami-gia-tot-den-king-shoes-2.jpg', NULL, CAST(3000000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:36:35.793' AS DateTime), NULL, CAST(N'2025-05-26T10:44:54.433' AS DateTime), NULL, 1, 0, 0, 1, 0, 1, 5)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (57, N'ADIDAS SAMBA MESSI MIAMI', N'adidas-samba-messi-miami', 5, N'IH8158', N' ADIDAS VL COURT 2.0 Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ih8158-giay-adidas-samba-messi-miami-gia-tot-den-king-shoes-2.jpg', NULL, CAST(3000000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:39:05.933' AS DateTime), NULL, CAST(N'2025-05-26T10:44:16.307' AS DateTime), NULL, 1, 0, 0, 1, 0, 8, 4)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (58, N'ADIDAS SAMBA CLASSIC', N'adidas-samba-classic', 5, N'034563', N'Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/034563-giay-adidas-samba-classic-black-chinh-hang-gia-tot-den-king-shoes-6.jpg', NULL, CAST(3000000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:48:06.833' AS DateTime), NULL, CAST(N'2025-05-26T10:44:01.547' AS DateTime), NULL, 1, 0, 1, 0, 0, 1, 2)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (59, N'ADIDAS SAMBA CLASSIC', N'adidas-samba-classic', 5, N'772109', N' Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/772109-giay-adidas-samba-classic-chinh-hang-gia-tot-den-king-shoes1.jpg', NULL, CAST(3000000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:53:16.107' AS DateTime), NULL, CAST(N'2025-05-26T10:43:52.180' AS DateTime), NULL, 1, 0, 1, 0, 0, 2, 2)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (60, N'Adidas Samba OG ''Silver Metallic''', N'adidas-samba-og-silver-metallic', 5, N'JI4218', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ji4218-giay-adidas-samba-og-silver-metallic-gia-tot-den-king-shoes-1-1726319060.jpg', CAST(3600000.00 AS Decimal(18, 2)), CAST(3100000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:55:48.747' AS DateTime), NULL, CAST(N'2025-05-26T10:49:27.613' AS DateTime), NULL, 1, 1, 0, 0, 1, 7, 3)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (61, N'ADIDAS SAMBA OG', N'adidas-samba-og', 5, N'IF7004', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/if7004-giay-adias-samba-og-gia-tot-den-king-shoes-1-1730607211.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T16:58:25.510' AS DateTime), NULL, CAST(N'2025-05-26T10:43:00.097' AS DateTime), NULL, 1, 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (62, N' ADIDAS CAMPUS 00S', N'adidas-campus-00s', 6, N' IG8660', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ig8660-giay-adidas-campus-00s-black-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:02:02.967' AS DateTime), NULL, CAST(N'2025-05-26T10:42:17.180' AS DateTime), NULL, 1, 1, 0, 0, 0, 1, 6)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (63, N' ADIDAS VL COURT 3.0', N'adidas-vl-court-30', 8, N'IF4465', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/if4465-giay-adidas-vl-court-3.0-gia-tot-den-king-shoes-8-1737185730.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:05:23.580' AS DateTime), NULL, CAST(N'2025-05-26T10:41:55.997' AS DateTime), NULL, 1, 1, 0, 0, 0, 2, 18)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (64, N'COURT LEGACY CNVS', N'court-legacy-cnvs', 8, N'CZ0294 800', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/cz0294-800-court-legacy-cnvs-giay-nike-chinh-hang-king-shoes-1.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:08:16.007' AS DateTime), NULL, CAST(N'2025-05-26T10:46:50.883' AS DateTime), NULL, 1, 0, 0, 1, 0, 6, 19)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (65, N' ADIDAS NEO VL COURT 2.0 CREAM BROW', N'adidas-neo-vl-court-20-cream-brow', 8, N' ID6016', N'Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', N'<div class="row" style="box-sizing: border-box; margin: 0px -15px; padding: 0px; display: flex; position: relative; flex-wrap: wrap; color: rgb(30, 30, 39); font-family: Poppins, sans-serif; font-size: 14px;">
<div class="col" style="box-sizing: border-box; margin: 0px; padding: 0px 15px; position: relative; width: 1140px; min-height: 1px; flex-basis: 0px; flex-grow: 1; max-width: 100%;">
<div class="tabs_container" style="box-sizing: border-box; margin: 66px 0px; padding: 0px; position: relative;">
<ul>
	<li><span style="color:rgb(254, 76, 80); font-size:16px">Description</span></li>
	<li><span style="font-size:16px">Additional Information</span></li>
	<li><span style="font-size:16px">Reviews (2)</span></li>
</ul>
</div>
</div>
</div>

<div class="row" style="box-sizing: border-box; margin: 0px -15px; padding: 0px; display: flex; position: relative; flex-wrap: wrap; color: rgb(30, 30, 39); font-family: Poppins, sans-serif; font-size: 14px;">
<div class="col" style="box-sizing: border-box; margin: 0px; padding: 0px 15px; position: relative; width: 1140px; min-height: 1px; flex-basis: 0px; flex-grow: 1; max-width: 100%;">
<div class="tab_container active" id="tab_1" style="box-sizing: border-box; margin: 0px; padding: 0px; position: relative; width: 1110px;">
<div class="row" style="box-sizing: border-box; margin: 0px -15px; padding: 0px; display: flex; position: relative; flex-wrap: wrap;"><span style="font-family:poppins,sans-serif">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span></div>
</div>
</div>
</div>
', N'/uploads/product/id6016-giay-adidas-neo-vl-court-2.0-cream-brow-gia-tot-den-king-shoes-2.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:15:29.457' AS DateTime), NULL, CAST(N'2025-05-26T10:41:46.977' AS DateTime), NULL, 1, 1, 1, 0, 0, 6, 17)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (66, N'COURT LEGACY', N'court-legacy', 8, N'DA5380 102', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/da5380-102-giày-nike-court-legacy-chính-hãng-dến-king-shoes-9-1654923061.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:18:04.437' AS DateTime), NULL, CAST(N'2025-05-26T10:41:36.200' AS DateTime), NULL, 1, 0, 1, 1, 0, 2, 16)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (68, N'ADIDAS SUPERSTAR ADIFOM', N'adidas-superstar-adifom', 12, N' HQ8750', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/hq8750-giay-adidas-superstar-adifom-gia-tot-den-king-shoes-1.jpg', CAST(3600000.00 AS Decimal(18, 2)), CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:29:28.263' AS DateTime), NULL, CAST(N'2025-05-26T10:41:03.493' AS DateTime), NULL, 1, 1, 0, 0, 1, 2, 28)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (69, N'ADIDAS SUPERSTAR', N'adidas-superstar', 12, N'ID7964', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/id7964-giay-adidas-superstar-gia-tot-den-king-shoes-1.jpg', CAST(3600000.00 AS Decimal(18, 2)), CAST(2900000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:30:44.003' AS DateTime), NULL, CAST(N'2025-05-26T10:48:16.230' AS DateTime), NULL, 1, 1, 1, 1, 0, 2, 27)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (70, N'ADIDAS SUPERSTAR', N'adidas-superstar', 12, N'IF5416', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/if5416-giay-adidas-superstar-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:32:14.320' AS DateTime), NULL, CAST(N'2025-05-26T10:40:42.647' AS DateTime), NULL, 1, 0, 1, 0, 0, 6, 27)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (71, N' SUPERSTAR', N'superstar', 12, N'EG4958', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/sneaker-c77124-super-star-adidas-kingshoes.vn-tphcm-tanbinh-27-1628053703.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:33:26.293' AS DateTime), NULL, CAST(N'2025-05-26T10:40:28.370' AS DateTime), NULL, 1, 0, 1, 0, 0, 2, 26)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (72, N' ADIDAS GAZELLE INDOOR', N'adidas-gazelle-indoor', 7, N'IH7502', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/ih7502-giay-adidas-gazelle-indoor-cream-white-gia-tot-den-king-shoes-1.jpg', CAST(3600000.00 AS Decimal(18, 2)), CAST(2000000.00 AS Decimal(18, 2)), CAST(N'2025-05-15T17:37:09.340' AS DateTime), NULL, CAST(N'2025-05-26T10:39:11.770' AS DateTime), NULL, 1, 1, 1, 1, 1, 9, 11)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (76, N'AIR MAX PULSE', N'air-max-pulse', 6, N'FN7459 001', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/fn7459-001-giay-nike-air-max-pulse-pure-platinum-gia-tot-king-shoes-3.jpg', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:25:33.037' AS DateTime), NULL, CAST(N'2025-05-27T16:30:45.750' AS DateTime), NULL, 1, 0, 0, 0, 0, 7, 6)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (77, N'ADIDAS FREE METCON 6', N'adidas-free-metcon-6', 6, N'FJ7127 010', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/fj7127-010-giay-nike-free-metcon-6-gia-tot-den-king-shoes-12-1740569862.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:30:04.370' AS DateTime), NULL, CAST(N'2025-05-27T16:30:39.360' AS DateTime), NULL, 1, 0, 0, 0, 0, 1, 7)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (78, N'ADIDAS FREE METCON 6', N'adidas-free-metcon-6', 6, N' FJ7126 100', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/fj7126-100-giay-nike-free-metcon-6-pale-ivory-gia-tot-den-king-shoes-1-1734755708.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:37:21.693' AS DateTime), NULL, CAST(N'2025-05-27T16:41:09.217' AS DateTime), NULL, 1, 0, 0, 0, 0, 2, 7)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (79, N'ADIDAS FREE METCON 6', N'adidas-free-metcon-6', 6, N'HM4348 100', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/hm4348-100-giay-nike-air-pegasus-2005-gia-tot-den-king-shoes-2-1740211581.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:40:03.470' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 4, 7)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (80, N' AIR FORCE 1 MID X OFF WHITE', N'air-force-1-mid-x-off-white', 6, N'DR0500 101', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/dr0500-101-giay-nike-air-force-1-mid-x-off-white-gia-tot-den-king-shoes-1-1739770630.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:43:55.913' AS DateTime), NULL, CAST(N'2025-05-27T16:55:06.883' AS DateTime), NULL, 1, 0, 0, 0, 0, 10, 8)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (81, N' AIR FORCE 1 MID X OFF WHITE', N'air-force-1-mid-x-off-white', 6, N' HJ7037 100', N'Giày đi rất thoáng và thoải mái', NULL, N'/uploads/product/hj7037-100-giay-nike-air-zoom-pegasus-41-ek-gia-tot-den-king-shoes-12-1734758053.jpeg', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:46:19.107' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 3, 8)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (82, N' AIR FORCE 1 MID X OFF WHITE', N'air-force-1-mid-x-off-white', 6, N'FN7153 101', N'Giày đi rất thoáng và thoải mái', NULL, N'/uploads/product/fn7153-101-giay-nike-air-peg-2k5-phantom-and-coconut-milk-gia-tot-den-king-shoes-12-1733666451.jpeg', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:48:36.563' AS DateTime), NULL, CAST(N'2025-05-27T16:52:54.210' AS DateTime), NULL, 1, 0, 0, 0, 0, 2, 8)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (83, N' AIR FORCE 1 MID X OFF WHITE', N'air-force-1-mid-x-off-white', 6, N'HM0713 002', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/hm0713-002-giay-nike-lunar-roam-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(1500000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T16:52:37.340' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 7, 8)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (84, N' ADIDAS GAZELLE INDOOR', N'adidas-gazelle-indoor', 7, N'IB8971', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/nike-jordan-1-low-white-black-gym-red-ib8971-gia-tot-den-king-shoes-1744608209.jpg', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:00:26.980' AS DateTime), NULL, CAST(N'2025-05-27T17:00:46.573' AS DateTime), NULL, 1, 0, 0, 0, 0, 3, 11)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (85, N' ADIDAS GAZELLE INDOOR', N'adidas-gazelle-indoor', 7, N'CZ0790 002', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">Thể thao n&acirc;ng cao sức khoẻ. Gi&uacute;p bạn lu&ocirc;n tĩnh t&acirc;m. Kết nối ch&uacute;ng ta. Th&ocirc;ng qua thể thao, ch&uacute;ng ta c&oacute; sức mạnh để thay đổi cuộc sống&mdash;bằng những c&acirc;u chuyện về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/cz0790-002-giay-nike-air-jordan-1-low-silver-gia-tot-den-king-shoes-12-1734499579.jpeg', NULL, CAST(2500000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:05:46.447' AS DateTime), NULL, CAST(N'2025-05-27T17:09:17.653' AS DateTime), NULL, 1, 0, 0, 0, 0, 2, 11)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (86, N' JORDAN 1 RETRO LOW OG GORGE GREEN', N'jordan-1-retro-low-og-gorge-green', 7, N'CZ0775 036', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/cz0775-036-giay-air-jordan-1-retro-low-og-gorge-green-gia-tot-den-king-shoes-12-1743922375.jpg', NULL, CAST(2900000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:16:19.640' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 5, 12)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (87, N'JORDAN STADIUM 90', N'jordan-stadium-90', 7, N' FV3624 151', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/fv3624-151-giay-jordan-stadium-90-gia-tot-den-king-shoes-1-1742982858.jpg', NULL, CAST(2900000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:18:07.637' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 2, 12)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (88, N'JORDAN STADIUM 90', N'jordan-stadium-90', 7, N'HQ2993 100', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/hq2993-100-giay-nike-air-jordan-1-retro-low-og-howard-university-gia-tot-den-king-shoes-5-1741945373.png', NULL, CAST(2900000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:20:04.840' AS DateTime), NULL, CAST(N'2025-05-27T17:20:26.877' AS DateTime), NULL, 1, 0, 0, 0, 0, 3, 12)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (89, N' AIR JORDAN 1 LOW "VALENTINE’S DAY"', N'air-jordan-1-low-valentine’s-day', 7, N'HF3174 600', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/hf3174-600-giay-nike-air-jordan-1-low-valentines-day-gia-tot-den-king-shoes-12-1740216136.jpeg', NULL, CAST(4900000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:31:29.433' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 8, 13)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (90, N'JORDAN STADIUM 90', N'jordan-stadium-90', 7, N'DX4397 116', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/dx4397-116-giay-nike-jordan-stadium-90-gia-tot-den-king-shoes-1.jpg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:34:01.040' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 2, 13)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (91, N'JORDAN STADIUM 90', N'jordan-stadium-90', 7, N'553558 152', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/553558-152-giay-nike-air-jordan-1-low-iron-grey-gia-tot-den-king-shoes-12-1740035217.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:36:16.227' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 1, 13)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (92, N'JORDAN STADIUM 90', N'jordan-stadium-90', 7, N'DD1503 117', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/dd1503-117-giay-nike-dunk-low-gia-tot-den-king-shoes-12-1740217036.jpeg', NULL, CAST(3600000.00 AS Decimal(18, 2)), CAST(N'2025-05-27T17:38:20.073' AS DateTime), NULL, CAST(N'2025-05-27T17:38:44.283' AS DateTime), NULL, 1, 0, 0, 0, 0, 7, 13)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (93, N' JORDAN 1 LOW UNC', N'jordan-1-low-unc', 10, N'AO9944 441', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/jordan-1-low-unc-ao9944-441-den-king-shoes.jpg', NULL, CAST(4900000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:03:22.887' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 4, 21)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (94, N' JORDAN 1 HIGH RETRO OG', N'jordan-1-high-retro-og', 10, N'DZ5485 020', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/dz5485-020-giay-nike-air-jordan-1-palomino-chinh-hang-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(5800000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:06:31.497' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 9, 21)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (95, N'JORDAN 1 LOW WHITE WOLF GREY', N'jordan-1-low-white-wolf-grey', 10, N'DC0774 105', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/dc0774-105-giay-nike-air-jordan-1-low-chinh-hang-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(3900000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:10:09.987' AS DateTime), NULL, CAST(N'2025-05-28T09:12:09.997' AS DateTime), NULL, 1, 0, 0, 0, 0, 7, 22)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (96, N'AIR JORDAN 1 HI GYM RED', N'air-jordan-1-hi-gym-red', 10, N'CT0979 610', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/giày-air-jordan-1-zoom-air-comfort-gym-red-ct0979-610-chính-hãng-dến-king-shoes-3-1648028376.jpg', NULL, CAST(5800000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:12:02.493' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 3, 22)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (97, N'JORDAN 1 LOW PARIS', N'jordan-1-low-paris', 10, N'CV3043 100', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/cv3043-100-giay-nike-jordan-1-low-paris-gia-tot-den-king-shoes-1.jpg', NULL, CAST(4200000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:14:56.157' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 2, 22)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (98, N'AIR JORDAN 4 RETRO “SEAFOAM”', N'air-jordan-4-retro-“seafoam”', 10, N'AQ9129 103', N'Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/aq9129-103-air-jordan-4-gia-tot-den-king-shoes-9.jpeg', NULL, CAST(6800000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:17:05.203' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 5, 23)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (99, N'JORDAN 1 LOW OG ''MOCHA''', N'jordan-1-low-og-mocha', 10, N'CZ0790 102', N'Đôi giày thường ngày mang phong cách trượt ván, có sử dụng chất liệu tái chế.', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/cz0790-102-giay-air-jordan-1-low-og-mocha-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(6800000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:24:16.883' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 9, 23)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (100, N' AIR JORDAN 4 RETRO', N'air-jordan-4-retro', 10, N'408452 140', N'Giày đi rất thoáng và thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/408452-140-giay-nike-air-jordan-4-retro-gs-white-midnight-navy-lt-smoke-grey-gia-tot-den-king-shoes-12-1728300817.jpeg', NULL, CAST(4000000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T09:26:41.200' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 2, 23)
INSERT [dbo].[Product] ([Id], [Title], [Alias], [ProductCategoryId], [ProductCode], [Description], [Detail], [Image], [Price], [PriceSale], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy], [IsActive], [IsHome], [IsHot], [IsFeature], [IsSale], [ShoeColorId], [ProductGroupId]) VALUES (101, N'JORDAN 1 RETRO HIGH OG ''TAXI''', N'jordan-1-retro-high-og-taxi', 10, N'CZ0790 102', N'Giày rất đẹp và dùng rất thoải mái', N'<span style="color:rgb(30, 30, 39); font-family:poppins,sans-serif; font-size:14px">về c&aacute;c vận động vi&ecirc;n truyền cảm hứng, c&ocirc;ng nghệ đột ph&aacute; v&agrave; bằng c&aacute;ch gi&uacute;p bạn đứng l&ecirc;n v&agrave; vận động. T&igrave;m kiếm trang phục thể thao hiệu suất cao được ứng dụng c&ocirc;ng nghệ ti&ecirc;n tiến nhất để gi&uacute;p bạn bứt ph&aacute; giới hạn. D&ugrave; bạn l&agrave; một runner, cầu thủ b&oacute;ng rổ, cầu thủ b&oacute;ng đ&aacute; hay đơn giản chỉ l&agrave; người y&ecirc;u th&iacute;ch vận động, cửa h&agrave;ng thể thao của ch&uacute;ng t&ocirc;i ch&iacute;nh l&agrave; nơi d&agrave;nh cho bạn. Ch&uacute;ng t&ocirc;i gi&uacute;p bạn tập luyện chăm chỉ hơn, chạy nhanh hơn v&agrave; tiến xa hơn với những sản phẩm lu&ocirc;n đồng h&agrave;nh c&ugrave;ng từng chuyển động v&agrave; mục ti&ecirc;u của bạn. Kh&aacute;m ph&aacute; cửa h&agrave;ng trực tuyến của adidas để cập nhật những bộ sưu tập mới nhất, nơi c&ocirc;ng nghệ ti&ecirc;n tiến h&ograve;a quyện c&ugrave;ng phong c&aacute;ch. Cửa h&agrave;ng thể thao adidas mang đến trang phục hiệu năng cao cho mọi cấp độ&mdash;d&ugrave; bạn l&agrave; vận động vi&ecirc;n chuy&ecirc;n nghiệp, người y&ecirc;u thể thao hay chỉ mới bắt đầu h&agrave;nh tr&igrave;nh tập luyện. Với cửa h&agrave;ng trực tuyến của ch&uacute;ng t&ocirc;i, bạn c&oacute; thể tiếp cận những trang bị mới nhất, được thiết kế để chuyển động, d&ugrave; bạn ở bất kỳ đ&acirc;u. Cửa h&agrave;ng thể thao adidas kh&ocirc;ng chỉ l&agrave; nơi mua sắm&mdash;đ&acirc;y c&ograve;n l&agrave; kh&ocirc;ng gian d&agrave;nh cho những người s&aacute;ng tạo muốn n&acirc;ng tầm cuộc chơi v&agrave; định nghĩa lại giới hạn của bản th&acirc;n. Tại adidas, ch&uacute;ng t&ocirc;i hợp t&aacute;c với những t&ecirc;n tuổi h&agrave;ng đầu trong ng&agrave;nh để c&ugrave;ng s&aacute;ng tạo, đảm bảo từng m&oacute;n đồ kh&ocirc;ng chỉ hỗ trợ vận động m&agrave; c&ograve;n thể hiện c&aacute; t&iacute;nh v&agrave; phong c&aacute;ch sống năng động. D&ugrave; m&ocirc;n thể thao của bạn l&agrave; g&igrave;, cửa h&agrave;ng thể thao adidas lu&ocirc;n sẵn s&agrave;ng đồng h&agrave;nh, gi&uacute;p bạn tiến từng bước vững chắc tr&ecirc;n h&agrave;nh tr&igrave;nh chinh phục đỉnh cao.</span>', N'/uploads/product/575441-711-giay-nike-air-jordan-1-high-gia-tot-den-king-shoes-12.jpeg', NULL, CAST(4800000.00 AS Decimal(18, 2)), CAST(N'2025-05-28T10:05:04.653' AS DateTime), NULL, NULL, NULL, 1, 0, 0, 0, 0, 10, 23)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Title], [Alias], [Description], [Icon], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy]) VALUES (5, N'SAMBA', N'samba', NULL, N'/uploads/productcategories/02_ss25_anthony_edwards_1_artic_night_launch_catlp_mta_tc_d_f53d80b3b4.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Alias], [Description], [Icon], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy]) VALUES (6, N'CAMPUS', N'campus', NULL, N'/uploads/productcategories/07_originals_ss25_the_original_introduce_catlp_tc_campus_d_0237f8c49b.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Alias], [Description], [Icon], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy]) VALUES (7, N'GAZELLE', N'gazelle', NULL, N'/uploads/productcategories/01_originals_ss25_the_original_introduce_catlp_tc_gazelle_d_e61f3a2d99.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Alias], [Description], [Icon], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy]) VALUES (8, N'Sneakers', N'sneakers', NULL, N'/uploads/productcategories/id6015-giay-adidas-vl-court-2.0-gia-tot-den-king-shoes-2.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Alias], [Description], [Icon], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy]) VALUES (10, N'Training', N'training', NULL, N'/uploads/productcategories/id4017-giay-adidas-climacool-bounce-gia-tot-den-king-shoes-1.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductCategory] ([Id], [Title], [Alias], [Description], [Icon], [CreatedDate], [CreatedBy], [ModifierDate], [ModifierBy]) VALUES (12, N'Superstar', N'superstar', NULL, N'/uploads/productcategories/images.jpg', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSizes] ON 

INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (102, 72, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (103, 72, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (104, 72, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (105, 71, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (106, 71, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (107, 71, N'38', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (108, 71, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (109, 71, N'40', 20)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (110, 70, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (111, 70, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (112, 70, N'38', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (116, 68, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (117, 68, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (118, 68, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (119, 68, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (120, 68, N'40', 20)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (121, 66, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (122, 66, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (123, 66, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (124, 65, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (125, 65, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (126, 65, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (127, 65, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (128, 63, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (129, 63, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (130, 63, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (131, 62, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (132, 62, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (133, 62, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (134, 44, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (135, 44, N'37', 50)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (136, 44, N'38', 11)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (137, 44, N'39', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (138, 61, N'36', 28)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (139, 61, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (140, 61, N'38', 29)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (141, 61, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (142, 61, N'40', 20)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (143, 54, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (144, 54, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (145, 54, N'38', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (146, 54, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (147, 54, N'40', 20)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (148, 53, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (149, 53, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (150, 53, N'38', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (151, 53, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (152, 53, N'40', 20)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (153, 35, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (154, 35, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (155, 35, N'38', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (156, 35, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (157, 59, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (158, 59, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (159, 59, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (160, 58, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (161, 58, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (162, 58, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (164, 57, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (165, 57, N'37', 50)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (169, 56, N'37', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (170, 56, N'36', 45)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (171, 56, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (172, 55, N'37', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (173, 55, N'36', 45)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (174, 55, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (175, 52, N'36', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (176, 52, N'37', 38)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (177, 52, N'38', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (178, 52, N'39', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (182, 64, N'39', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (183, 64, N'40', 24)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (184, 51, N'37', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (185, 51, N'36', 45)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (186, 51, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (187, 69, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (188, 69, N'37', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (189, 69, N'38', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (190, 60, N'37', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (191, 60, N'36', 45)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (192, 60, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (209, 77, N'40', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (210, 77, N'41', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (211, 77, N'42', 43)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (212, 77, N'43', 21)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (213, 76, N'40', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (214, 76, N'41', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (215, 76, N'42', 43)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (216, 76, N'43', 21)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (217, 79, N'40', 31)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (218, 79, N'41', 53)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (219, 79, N'42', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (224, 78, N'37', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (225, 78, N'36', 45)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (226, 78, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (228, 81, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (229, 81, N'37', 50)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (234, 83, N'36.5', 31)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (235, 83, N'40', 34)
GO
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (236, 82, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (237, 82, N'37', 50)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (238, 82, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (239, 80, N'36', 30)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (240, 80, N'37', 50)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (241, 80, N'40', 40)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (245, 84, N'36.5', 31)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (246, 84, N'40', 34)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (247, 84, N'46', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (252, 85, N'43', 44)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (253, 85, N'44', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (254, 86, N'37', 53)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (255, 86, N'38', 56)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (256, 86, N'39', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (257, 86, N'40', 55)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (258, 86, N'41', 43)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (259, 86, N'42', 54)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (260, 86, N'43', 22)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (261, 86, N'46', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (262, 87, N'36.5', 31)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (263, 87, N'46', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (264, 87, N'46', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (267, 88, N'40', 43)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (268, 88, N'45', 54)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (269, 89, N'36', 20)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (270, 89, N'37', 27)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (271, 90, N'36', 31)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (272, 90, N'37', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (273, 90, N'46', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (274, 91, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (275, 91, N'37', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (276, 91, N'38', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (278, 92, N'43', 22)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (279, 93, N'40', 22)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (280, 93, N'41', 42)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (281, 93, N'42', 52)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (282, 93, N'43', 10)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (283, 94, N'40', 34)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (284, 94, N'41', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (285, 94, N'42', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (289, 96, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (290, 96, N'37', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (291, 96, N'38', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (292, 96, N'39', 11)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (293, 95, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (294, 95, N'37', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (295, 95, N'38', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (296, 97, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (297, 97, N'40', 55)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (298, 97, N'42', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (299, 97, N'44', 53)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (300, 98, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (301, 98, N'40', 55)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (302, 98, N'42', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (303, 99, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (304, 99, N'40', 55)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (305, 99, N'42', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (306, 99, N'44', 53)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (307, 99, N'46', 12)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (308, 100, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (309, 100, N'40', 55)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (310, 100, N'42', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (311, 101, N'36', 23)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (312, 101, N'37', 32)
INSERT [dbo].[ProductSizes] ([Id], [ProductId], [Size], [Quantity]) VALUES (313, 101, N'38', 32)
SET IDENTITY_INSERT [dbo].[ProductSizes] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (1, 59, 1, N'Hay', CAST(N'2025-05-16T14:03:26.463' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (2, 60, 2, N'Hay', CAST(N'2025-05-16T14:17:15.413' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (3, 51, 3, N'Hay', CAST(N'2025-05-16T14:17:52.400' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (4, 63, 5, N'hay', CAST(N'2025-05-16T14:18:42.480' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (5, 63, 5, N'hay', CAST(N'2025-05-16T14:18:53.397' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (6, 44, 2, N'hay', CAST(N'2025-05-16T14:19:15.170' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (7, 72, 2, N'test', CAST(N'2025-05-21T12:41:11.260' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (8, 72, 2, N'test 2
', CAST(N'2025-05-21T13:20:11.390' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (9, 72, 2, N'test3', CAST(N'2025-05-21T13:20:27.787' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (10, 72, 2, N'test 5
', CAST(N'2025-05-21T13:20:48.827' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (11, 72, 2, N'test 6', CAST(N'2025-05-21T13:33:32.323' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (12, 72, 2, N'test 7', CAST(N'2025-05-21T13:38:42.187' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (13, 72, 2, N'test 8', CAST(N'2025-05-21T13:46:35.887' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (14, 72, 2, N'test 9', CAST(N'2025-05-21T13:52:32.377' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (15, 72, 2, N'1', CAST(N'2025-05-21T13:57:10.130' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (16, 72, 3, N'2', CAST(N'2025-05-21T13:58:49.823' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (17, 72, 3, N'3', CAST(N'2025-05-21T13:58:56.083' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (18, 72, 3, N'4', CAST(N'2025-05-21T13:58:59.280' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (19, 72, 3, N'37373737373', CAST(N'2025-05-21T14:02:47.507' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (20, 72, 3, N'33133223', CAST(N'2025-05-21T14:02:51.383' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (21, 72, 3, N'34244444', CAST(N'2025-05-21T14:02:57.340' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (22, 71, 2, N'123455
', CAST(N'2025-05-21T14:05:23.093' AS DateTime))
INSERT [dbo].[Reviews] ([Id], [ProductId], [UserId], [Comment], [CreatedAt]) VALUES (1007, 71, 2, N'giày đẹp quá', CAST(N'2025-05-26T23:00:21.673' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoeColors] ON 

INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (1, N'Đen', N'#000000')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (2, N'Trắng', N'#FFFFF0')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (3, N'Đỏ', N'#FF0000')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (4, N'Xanh dương', N'#0000FF')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (5, N'Xanh lá', N'#008000')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (6, N'Vàng', N'#FFFF00')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (7, N'Xám', N'#808080')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (8, N'Hồng', N'#FFC0CB')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (9, N'Nâu', N'#8B4513')
INSERT [dbo].[ShoeColors] ([Id], [ColorName], [ColorCode]) VALUES (10, N'Cam', N'#FFA500')
SET IDENTITY_INSERT [dbo].[ShoeColors] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (2, 2, 1)
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (3, 3, 2)
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (5, 5, 2)
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (6, 1, 2)
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (7, 6, 2)
INSERT [dbo].[UserRoles] ([Id], [UserId], [RoleId]) VALUES (8, 7, 2)
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Email], [PasswordHash], [CreatedAt]) VALUES (1, N'PhamHieu', N'susikimchi69@gmail.com', N'2koQ2IDAP89fGfbiJZYKolja/ttWEOnNmBjrPHNX+D8=', CAST(N'2025-05-08T14:16:47.160' AS DateTime))
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PasswordHash], [CreatedAt]) VALUES (2, N'Phamhiuhiu01', N'Phamhiuhiu01@gmail.com', N'2koQ2IDAP89fGfbiJZYKolja/ttWEOnNmBjrPHNX+D8=', CAST(N'2025-05-08T14:20:11.740' AS DateTime))
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PasswordHash], [CreatedAt]) VALUES (3, N'hieu', N'hiu@gmail.com', N'Hr6qeIOzhW+05m5TufFj1/WL2JU6J01s65Smyp1NP3w=', CAST(N'2025-05-08T16:54:18.510' AS DateTime))
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PasswordHash], [CreatedAt]) VALUES (5, N'Hutao123', N'susikimchi12@gmail.com', N'2koQ2IDAP89fGfbiJZYKolja/ttWEOnNmBjrPHNX+D8=', CAST(N'2025-05-12T11:20:00.787' AS DateTime))
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PasswordHash], [CreatedAt]) VALUES (6, N'Tuananhle12', N'TuanAnh@gmail.com', N'2koQ2IDAP89fGfbiJZYKolja/ttWEOnNmBjrPHNX+D8=', CAST(N'2025-05-16T15:04:22.940' AS DateTime))
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PasswordHash], [CreatedAt]) VALUES (7, N'LeLong', N'LeLong111@gmail.com', N'2koQ2IDAP89fGfbiJZYKolja/ttWEOnNmBjrPHNX+D8=', CAST(N'2025-05-16T15:05:10.203' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__8A2B616090A9A6A4]    Script Date: 5/28/2025 10:16:50 AM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__C9F28456F874B6DA]    Script Date: 5/28/2025 10:16:50 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 5/28/2025 10:16:50 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_Users_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[childImage]  WITH CHECK ADD  CONSTRAINT [FK__childImag__Produ__32767D0B] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[childImage] CHECK CONSTRAINT [FK__childImag__Produ__32767D0B]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ShoeColor] FOREIGN KEY([ShoeColorId])
REFERENCES [dbo].[ShoeColors] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ShoeColor]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSizes_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSizes_Product]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Product]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
