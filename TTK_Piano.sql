USE [TKK_Piano]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Course_Name] [nvarchar](500) NOT NULL,
	[Teacher_ID] [int] NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[Slot] [int] NULL,
	[Tuition_Fee] [numeric](12, 0) NULL,
	[Image_Url] [text] NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[LevelID] [int] NULL,
	[Created_By] [int] NULL,
	[Last_Update_Date] [date] NOT NULL,
	[Last_Update_User] [int] NOT NULL,
	[Created_At] [date] NULL,
	[sold_count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[Level_Name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Buy_Date] [date] NOT NULL,
	[Total_Price] [numeric](12, 0) NULL,
	[Payment_Method] [nvarchar](40) NOT NULL,
	[Payment_Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [numeric](12, 0) NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Phone] [char](15) NULL,
	[Email] [varchar](40) NULL,
	[Role] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Course]    Script Date: 14-Dec-22 2:34:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Course](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_User_Course] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (1, N'Piano')
INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (2, N'Guitar')
INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (3, N'Drum')
INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (4, N'Flute')
INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (5, N'Trumpet')
INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (6, N'Saxophone')
INSERT [dbo].[Category] ([CategoryID], [Category_Name]) VALUES (7, N'Drawing')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (9, N'ACOUSTIC GUITAR', 4, 2, N'Có nhiều quý phụ huynh mong muốn con em mình chơi được những ca khúc theo ý thích và khả năng diễn tấu của mình. Đáp ứng các nhu cầu nói trên, đã có rất nhiều khóa học ngắn hạn như modern guitar, guitar đệm hát được mở ra.Tuy nhiên, những khóa học này hầu hết chỉ dựa trên kinh nghiệm đàn của nhạc công, chủ yếu là dạy và & học những miếng, những câu cú bắt chước từ những album hay chứ không mang tính hệ thống để hình thành một bộ môn mà học viên có thể học tiến xa trên con đường âm nhạc của mình. Và dĩ nhiên những khóa này thường đòi hỏi học viên phải có một khả năng chơi đàn nào đó trước khi học. Nếu classical guitar, là bộ môn học chơi những tác phẩm được soạn sẵn cho hai tay, thì guitar acoustic là bộ môn tiếp cận thẳng vào việc hình thành và chơi các hợp âm, các mẫu tiết tấu, các phong cách âm nhạc đại chúng (popular music) và các ca khúc phổ thông. Vì vậy, bộ môn acoustic được thiết kế để học viên dù chưa học guitar ngày nào cũng có thể tham dự.', 20, CAST(200000 AS Numeric(12, 0)), N'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQRi5dN3UiAPXlCq0yvTSZuD5fnnu-cPleUBBul7s6KredpTu-j_q0URQIKKNtG5JAOkgOWJLoOYnquz6ulZMrdgMcwsR2soVAC7nLY6RA&usqp=CAE', CAST(N'2022-08-28' AS Date), CAST(N'2022-09-28' AS Date), 1, 2, 31, CAST(N'2022-08-28' AS Date), 31, CAST(N'2022-07-28' AS Date), 5)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (10, N'CLASSICAL GUITAR', 1, 2, N'Classical guitar là bộ môn guitar cổ điển, hiểu đơn giản là dạy & học chơi những tác phẩm do các nhạc sĩ nổi tiếng qua các thời kỳ âm nhạc được chuyển soạn cho đàn guitar.Những tác phẩm này vừa phản ánh đời sống văn hóa nhân loại qua các thời kỳ lịch sử, vừa bao hàm hầu hết những kỹ năng về ngón đàn. Vì vậy, một mặt nó mang tính giáo dục cao về văn hóa, mặt khác, nó là công cụ để rèn luyện toàn bộ những kỹ năng biểu diễn.Có thể người học không trở thành nghệ sĩ biểu diễn, nhưng chắc chắc sẽ trở thành một con người có một nhân cách cân bằng và hài hòa.Đó chính là lợi thể để thành công trong cuộc sống.', 20, CAST(300000 AS Numeric(12, 0)), N'https://online.berklee.edu/takenote/wp-content/uploads/2021/06/classical-guitar.jpg', CAST(N'2022-08-29' AS Date), CAST(N'2022-09-29' AS Date), 1, 2, 31, CAST(N'2022-08-29' AS Date), 32, CAST(N'2022-07-29' AS Date), 5)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (19, N'ELECTRIC GUITAR', 2, 2, N'Sự phát triển của công nghệ điện và điện tử ngày càng giúp cho tiếng guitar điện trở nên phong phú và quyến rũ hơn, cả về âm sắc và âm lượng. Âm sắc guitar điện thể hiện nhiều trạng thái cảm xúc hơn so với guitar thùng: từ nhẹ nhàng thanh thoát đến mạnh mẽ phấn khích; từ rã rời trầm buồn đến gào thét phẫn nộ… Guitar điện trở nên đặc biệt hấp dẫn lôi cuốn, nhất là với giới trẻ. Nó đã trở thành một trong những nhạc cụ phù hợp nhất dành cho những bạn trẻ có cá tính mạnh. Vai trò chính của guitar điện trong ban nhạc là: chơi chord progression (chuỗi hợp âm) theo các phong cách tiết tấu (điệu) và ứng tấu trên những chuỗi hợp âm đó. Từ nhiều năm nay, tại các trường nhạc trên thế giới, guitar điện đã trở thành một bộ môn độc lập với những tính chất riêng biệt và rất nhiều kỹ thuật và phong cách chơi khác biệt.', 20, CAST(600000 AS Numeric(12, 0)), N'https://amthanhsankhau.vn/media/lib/572_yamaha-pacifica-012-electric-guitar-gia-tot.jpg', CAST(N'2022-08-30' AS Date), CAST(N'2022-09-30' AS Date), 1, 2, 31, CAST(N'2022-08-30' AS Date), 31, CAST(N'2022-07-30' AS Date), 6)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (23, N'POPULAR MUSIC PIANO', 5, 1, N'Có rất nhiều phụ huynh mong muốn con em mình chơi được những ca khúc phổ thông. Nhiều bạn trẻ muốn cover lại những ca khúc theo ý thích và khả năng diễn tấu của mình. Đáp ứng các nhu cầu nói trên, người ta đã mở rất nhiều khóa học ngắn hạn như modern piano, piano đệm hát, piano cover… Tuy nhiên, những khóa học này hầu hết chỉ dựa trên kinh nghiệm đàn của các nhạc công, chủ yếu là dạy & học những “miếng”, những “câu cú”… bắt chước từ những album… chứ không mang tính hệ thống để hình thành một bộ môn mà học viên có thể học tiến xa trên con đường âm nhạc của mình. Và dĩ nhiên những khóa này thường đòi hỏi học viên phải có một khả năng chơi đàn nào đó trước khi học. Khóa học đàn piano pop tại Việt Thương Music School giúp học viên tự chơi, tự sáng tạo ra những cách chơi theo ý muốn. Nếu classical piano, là bộ môn học chơi những tác phẩm được soạn sẵn cho hai tay, thì pop piano là bộ môn tiếp cận thẳng vào việc hình thành và chơi các hợp âm, các mẫu tiết tấu, các phong cách âm nhạc đại chúng (popular music) và các ca khúc phổ thông. Vì vậy, bộ môn pop piano được thiết kế để học viên dù chưa học piano ngày nào cũng có thể tham dự.', 20, CAST(900000 AS Numeric(12, 0)), N'https://file.hstatic.net/200000359259/file/dan-piano-yamaha-u3h_1__c9a9f892986e49f3a1bac9b4f1d822b2_grande.jpg', CAST(N'2022-09-01' AS Date), CAST(N'2022-10-01' AS Date), 1, 3, 31, CAST(N'2022-09-01' AS Date), 31, CAST(N'2022-08-01' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (24, N'KHÓA HỌC DRUM KIT', 1, 3, N'Bộ trống đảm nhiệm phần tiết tấu của bản nhạc, nên nó luôn là trung tâm, là hơi thở của một ban nhạc. Tuy nhiên, khi học trống, nhiều người chỉ quan tâm đến các điệu để đệm những ca khúc, mà không quan tâm đến những kỹ thuật chơi trống và kiến thức âm nhạc. Chính vì vậy, có rất nhiều tay trống chơi lâu năm trong các ban nhạc lại không thể đọc được nốt nhạc và chơi được những kỹ thuật khó. Người chơi trống không thể chỉ chơi một mình, mà cần phải được hòa tấu. Trong khi đó, những bản hòa tấu hay thường có phần drum kit được các nhạc sĩ phối khí soạn sẵn. Để có thể hòa tấu những bản nhạc mới thì học một cách bài bản là con đường ngắn nhất để khám phá và sáng tạo âm nhạc.', 20, CAST(500000 AS Numeric(12, 0)), N'https://www.musicca.com/files/scripts/drumkit/static/media/drum-kit.eb6cdcf0.png', CAST(N'2022-09-02' AS Date), CAST(N'2022-10-02' AS Date), 1, 2, 31, CAST(N'2022-09-02' AS Date), 31, CAST(N'2022-08-02' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (25, N'Khóa học kèn trumpet', 2, 5, N'Trung tâm âm nhạc Ngũ Cung tin tưởng rằng nếu các em học thổi kèn trumpet nếu bỏ thời gian ra học tập,rèn luyện hẳn hoi thì chỉ trong 6 tháng đến 12 tháng thôi các em sẽ thành thạo khi thổi kèn trumpet.', 20, CAST(900000 AS Numeric(12, 0)), N'https://phongvans.com/wp-content/uploads/2021/01/z2287161717442_ae2a4b568d219d0193e52005fd836e1b.jpg', CAST(N'2022-09-03' AS Date), CAST(N'2022-10-03' AS Date), 1, 2, 31, CAST(N'2022-09-03' AS Date), 32, CAST(N'2022-08-03' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (26, N'Học Đàn Piano tại Tân Phú', 3, 1, N'trong thời buổi công nghệ hiện nay, các em ở mọi lứa tuổi khác nhau sẽ rất dễ kích thích bở công nghệ. Điện thoại, máy tính gần như không quá xa lạ với các bé.Vậy cho nên việc học nhạc hay là học đàn piano sẽ là điều rất cần thiết cho các em. Hãy tạo cho các em một môi trường lành mạnh ngay từ bây giờ.', 20, CAST(300000 AS Numeric(12, 0)), N'https://nhaccutienmanh.vn/wp-content/uploads/2022/03/dan-piano-co-ottostein-sn121k-1.jpg', CAST(N'2022-09-04' AS Date), CAST(N'2022-10-04' AS Date), 1, 2, 31, CAST(N'2022-09-04' AS Date), 32, CAST(N'2022-08-04' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (27, N'Khóa học trống', 2, 3, N'Phát triển nhận thức và kỹ năng chuyên môn về TrốngHiểu biết về Trống và các nốt đơn, chùm nốt nhạcThành thạo các beat và fill (câu báo Trống) đơn giảnTập đệm theo bài nhạc đơn giảnTrải qua từng cấp độ, học viên sẽ dần hoàn thiện các kỹ thuật chơi Trống, cảm thụ được tinh thần bản nhạc, định hình phong cách của bản thânPhát triển kỹ năng biểu diễn chuyên nghiệp, tự tin; giải phóng hình thể và cảm xúc khi biểu diễn', 20, CAST(100000 AS Numeric(12, 0)), N'https://m.media-amazon.com/images/I/817sf0b1DCL.jpg', CAST(N'2022-09-05' AS Date), CAST(N'2022-10-05' AS Date), 1, 1, 31, CAST(N'2022-09-05' AS Date), 31, CAST(N'2022-08-05' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (28, N'Khóa học kèn saxophone', 2, 6, N'Đối với các môn học khác, học thôi kèn saxophone giống như một thứ gì đó cao sang. Nhưng các bạn yên trí, trung tâm âm nhạc luôn hỗ trợ các em đến hết khóa học để các em có được kiến thức cơ bản tốt nhất và sẽ thổi được các ca khúc mình yêu thích.', 20, CAST(800000 AS Numeric(12, 0)), N'https://virtualpiano.net/wp-content/uploads/2021/12/Play-Virtual-Saxophone-online-Virtual-Piano.jpg', CAST(N'2022-09-06' AS Date), CAST(N'2022-10-06' AS Date), 1, 1, 31, CAST(N'2022-09-06' AS Date), 32, CAST(N'2022-08-06' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (29, N'Học kèn trumpet', 5, 5, N'Trumpet A được làm từ đồng thau và là trụ trong hình dạng gồm 4 feet 7 inch của ống quấn thành hình dạng nhỏ gọn với một đơn vị ngôn luận cupshape và kích thước một quả bóng vừa phải ở cuối. Có đa dạng kèn trumpet trong gia đình. tối tân The trumpet chúng ta đã thân thuộc với ngày nay có ba van và lần đầu tiên được thực hiện trong 1820s. Earlier các kèn không có van.', 20, CAST(600000 AS Numeric(12, 0)), N'https://thein-brass.de/wp-content/uploads/2021/11/IMG_2285JA_-1920x1064.jpg', CAST(N'2022-09-07' AS Date), CAST(N'2022-10-07' AS Date), 1, 1, 31, CAST(N'2022-09-07' AS Date), 32, CAST(N'2022-08-07' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (30, N'PIANOFORTE GENERAL', 1, 1, N'Việc chơi đàn piano giúp kết nối các tế bào thần kinh, kích thích các vùng của não bộ phát triển. Chính vì vậy mà mà giúp não bộ được hoạt động tốt hơn. Con người sẽ trở nên nhanh nhẹn và nhạy bén hơn trong việc xử lý các thông tin trong công việc và cuộc sống hàng ngày.', 20, CAST(200000 AS Numeric(12, 0)), N'https://vn.yamaha.com/vi/files/slider_03_sp_9536785633ea44c58c3fff7a784463e6.jpg?impolicy=resize&imwid=1000&imhei=1000', CAST(N'2022-09-08' AS Date), CAST(N'2022-10-08' AS Date), 1, 2, 31, CAST(N'2022-09-08' AS Date), 32, CAST(N'2022-08-08' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (31, N'KHÓA HỌC SÁO TRÚC', 5, 4, N'Học sáo trúc bài bản và được kèm cặp trực tiếp bởi thầy Bùi Công Thơm – Giảng Viên bộ môn Sáo Trúc tại Học Viện Âm Nhạc Quốc Gia Việt Nam – thầy có 25 năm kinh nghiệm trong việc biểu diễn và giảng dạy sáo trúcLộ trình học 12 level rõ ràng (có giáo trình MIỄN PHÍ tặng cùng khóa học)KHÔNG cần lo lắng không xếp được lịch học vì phương pháp học linh động về thời gian- học lúc nào bạn rảnh, tập bài và trả bài cho thầy ĐẶC BIỆT, sau khi bạn hoàn thành 12 level học và tốt nghiệp, bạn sẽ được tặng cây 1 cây VS3 tông tùy chọn', 20, CAST(1000000 AS Numeric(12, 0)), N'https://saotruchoanganh.com/wp-content/uploads/2018/11/d-hoang-anh-cd-hoang-anh-anh-new-folder-img_6045-.jpeg', CAST(N'2022-09-09' AS Date), CAST(N'2022-10-09' AS Date), 1, 2, 31, CAST(N'2022-09-09' AS Date), 32, CAST(N'2022-08-09' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (32, N'KHÓA HỌC SÁO TRÚC VIP Cơ Bản + Nâng Cao', 5, 4, N'Dành cho tất cả các bạn yêu quý, đam mê bộ môn Sáo Trúc muốn tìm hiểu chuyên sâu về các kỹ thuật trong Sáo Trúc. Những bạn không biết gì về nhạc lý vẫn có thể học được một cách dễ dàng.Mọi câu hỏi từ dễ đến khó, đều được hỗ trợ giải đáp trong quá trình học tập.Đặc biệt Khóa VIP được trực tiếp Thầy ưu tiên hỗ trợ 24/7, hỗ trợ video call skype, facebook livestream, sms, điện thoại, email, mọi phương thức liên lạc mà học viên mong muốn Học viên được toàn quyền sử dụng toàn bộ Beat, Karaoke Sáo Trúc độc quyền và luôn cập nhật mới của Thầy Hoàng Anh, dùng để biểu diễn, giao lưu một cách thoải mái. Khóa VIP luôn được cập nhật các bài học mới tại nhóm kín facebook. Thường xuyên tổ chức offline các cuộc giao lưu gặp gỡ cho học viên được trao đổi trực tiếp với thầy, học hỏi từ bạn.', 20, CAST(400000 AS Numeric(12, 0)), N'https://cf.shopee.vn/file/0a26930dcb2aa862d58acddb7e5bcbd3', CAST(N'2022-09-10' AS Date), CAST(N'2022-10-10' AS Date), 1, 3, 31, CAST(N'2022-09-10' AS Date), 32, CAST(N'2022-08-10' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (33, N'Nhạc lý cơ bản trên sáo trúc', 3, 4, N'Nhạc lý cơ bản trên sáo trúc là khóa học cần thiết, dành cho các học viên muốn nâng cao trình độ, muốn học hỏi nghiêm túc, bước đầu theo con đường chuyên nghiệp.', 20, CAST(200000 AS Numeric(12, 0)), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBGZNCZv95xNLhWe12EeRysuwryM_15eKvqw&usqp=CAU', CAST(N'2022-09-11' AS Date), CAST(N'2022-10-11' AS Date), 1, 2, 31, CAST(N'2022-09-11' AS Date), 32, CAST(N'2022-08-11' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (34, N'Học Thổi Sáo Cơ Bản Dành Cho Người Mới Bắt Đầu', 4, 4, N'Khóa Học Sáo Trúc Cơ Bản dành cho tất cả các bạn yêu quý, đam mê bộ môn Sáo Trúc muốn tìm hiểu về cách chơi, cách thổi Sáo Trúc một cách cơ bản. Những bạn không biết gì về nhạc lý vẫn có thể học được một cách dễ dàng.Học được ngay chỉ cần có sáo, cực kỳ dễ hiểu. Chỉ cần có thiết bị kết nối internet, bạn có thể học mọi lúc mọi nơi bất cứ khi nào bạn muốn', 20, CAST(1000000 AS Numeric(12, 0)), N'https://saotruchoanganh.com/wp-content/uploads/2021/07/A4c-min.jpg', CAST(N'2022-09-12' AS Date), CAST(N'2022-10-12' AS Date), 1, 1, 31, CAST(N'2022-09-12' AS Date), 31, CAST(N'2022-08-12' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (35, N'Sáo Trúc Biểu Diễn', 4, 4, N'Sản phẩm dành riêng cho người muốn biểu diễn sáo trúc, trong các cuộc thi, lễ hội, chương trình ca nhạc chuyên nghiệp, bán chuyên hoặc không chuyên', 20, CAST(300000 AS Numeric(12, 0)), N'https://photo-cms-sggp.zadn.vn/Uploaded/2022/dudbexqdre/2021_10_02/dinh-ngoc-minh_hwnm.jpg', CAST(N'2022-09-13' AS Date), CAST(N'2022-10-13' AS Date), 1, 4, 32, CAST(N'2022-09-13' AS Date), 31, CAST(N'2022-08-13' AS Date), 10)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (36, N'Khóa học vẽ tại TP. Hồ Chí Minh', 2, 7, N'KHÔNG CẦN NĂNG KHIẾU, tất cả những gì bạn cần là đam mê khám phá những điều mới mẻ Lớp vẽ dành cho người bận rộn, vì KHUNG GIỜ CỰC KỲ ĐA DẠNG: giờ hành chính, buổi tối, cuối tuần. Nếu bạn bận, có thể học bù.️Không hề tốn thời gian, chương trình học tinh gọn CHỈ CÒN 6 BUỔI, phù hợp cho học viên không chuyên.️', 20, CAST(700000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2017/02/%E1%BA%A2nh-m%C3%B4-t%E1%BA%A3-2-1.jpg', CAST(N'2022-09-14' AS Date), CAST(N'2022-10-14' AS Date), 1, 2, 32, CAST(N'2022-09-14' AS Date), 31, CAST(N'2022-08-14' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (37, N'Lớp Vẽ Căn Bản Màu', 4, 7, N'Dành cho người mới bắt đầu học vẽ, không cần năng khiếu, yêu thích màu sắc.Phù hợp với mọi độ tuổi khác nhau, tất cả tất cả những người đam mê vẽ.', 20, CAST(200000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2020/10/1-1-2.jpg', CAST(N'2022-09-15' AS Date), CAST(N'2022-10-15' AS Date), 1, 2, 32, CAST(N'2022-09-15' AS Date), 32, CAST(N'2022-08-15' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (38, N'Lớp Vẽ Chân Dung', 2, 7, N'Làm quen với tất cả kinh nghiệm vẽ từng bộ phận một; cách vẽ mắt, vẽ mũi, miệng, tai, tả da, tóc…Một trăm lẻ một các bài phân tích về tỉ lệ gương mặt người. Học vẽ lần lượt các đối tượng khác nhau: Nam, nữ, trẻ em, người già… Các góc từ chính diện cơ bản đến góc nghiêng, góc phức tạp. Kỹ năng sử dụng các dụng cụ mới lạ như bút than, bút di, bút trắng, than,… đến các chất liệu màu như chì màu, màu nước…', 20, CAST(700000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2017/02/%E1%BA%A2nh-m%C3%B4-t%E1%BA%A3-1-1.jpg', CAST(N'2022-09-16' AS Date), CAST(N'2022-10-16' AS Date), 1, 3, 32, CAST(N'2022-09-16' AS Date), 32, CAST(N'2022-08-16' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (39, N'Lớp Vẽ Phong Cảnh', 2, 7, N'Học viên vui tính, hòa đồng, giáo viên tận tình, dễ mến, lớp học vẽ căn bản màu của Bụi chính là một không gian đầy màu sắc, thư giãn đầy ắp tiếng cười. Khi tham gia lớp học, học viên khỏi phải lo lắng điều gì, tất cả đã có Bụi chuẩn bị, với dụng cụ vẽ đầy đủ, giáo trình thú vị và lôi cuốn, kiến thức mỹ thuật tuy căn bản vẫn mang định hướng hàn lâm.', 20, CAST(100000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2017/02/%E1%BA%A2nh-m%C3%B4-t%E1%BA%A3-3.jpg', CAST(N'2022-09-17' AS Date), CAST(N'2022-10-17' AS Date), 1, 3, 32, CAST(N'2022-09-17' AS Date), 31, CAST(N'2022-08-17' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (40, N'Lớp Học Vẽ Ký Họa', 4, 7, N'Đơn giản: Dụng cụ vẽ chỉ cần sổ, bút chì hoặc bút kim và… Tada! Bạn có thể vẽ bất cứ nơi đâu, bất cứ lúc nào!Ngẫu hứng: Ký họa là bộ môn thiên về cảm xúc, giúp bạn nắm bắt và lưu giữ lại đường nét, thần thái của cảnh sắc, sự vật một cách nhanh nhất.Tự do: Khác với hầu hết các bộ môn chỉ học trong nhà, Ký họa còn cho bạn những giờ học “tung tẩy” tự do ngoài trời để vẽ những gì mình thích.', 20, CAST(100000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2019/03/1-1.jpg', CAST(N'2022-09-18' AS Date), CAST(N'2022-10-18' AS Date), 1, 3, 32, CAST(N'2022-09-18' AS Date), 32, CAST(N'2022-08-18' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (41, N'Bụi Nhỏ – Lớp học vẽ cho Trẻ em', 2, 7, N'Mỹ thuật Bụi tin rằng mỗi đứa trẻ đều mang trong mình bản năng của một người họa sĩ với con mắt nhìn thế giới vô cùng sống động, vô cùng màu sắc và trí tưởng tượng phong phú vô hạn. Bởi vậy, khóa Bụi Nhỏ – Lớp học vẽ dành Trẻ em từ 6-11 tuổi ra đời để đưa thế giới của trẻ lên những bức tranh, giúp cho các bé thể hiện ý tưởng và tài hoa của chính mình.', 20, CAST(600000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2017/11/1-1-3.jpg', CAST(N'2022-09-19' AS Date), CAST(N'2022-10-19' AS Date), 1, 1, 32, CAST(N'2022-09-19' AS Date), 32, CAST(N'2022-08-19' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (42, N'Màu Nước Căn Bản', 5, 7, N'Các họa cụ vẽ Màu nước, cách làm chủ chúng trong từng trường hợp Cách kỹ thuật cốt lõi của màu nước như ướt trên ướt, loang màu, hòa sắc, pha màu…Vẽ theo từng chủ đề theo mảng đa dạng từ hoa lá, đồ ăn, động vật, cảnh vật…Không gian ngập tràn tranh vẽ và họa cụ, chỉ còn bạn và nghệ thuật.', 20, CAST(100000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2017/02/mn-web-1.png', CAST(N'2022-09-20' AS Date), CAST(N'2022-10-20' AS Date), 1, 2, 32, CAST(N'2022-09-20' AS Date), 32, CAST(N'2022-08-20' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (43, N'Lớp Vẽ Sơn Dầu', 4, 7, N'Từ A-Z tất tần tật các kỹ thuật sơn dầu cơ bản nhất, từ cách dùng dụng cụ đến những kiến thức màu, pha màu, phối màu, tả chất…Các kiến thức vẽ Sơn dầu được sắp xếp theo từng cấp độ từ dễ dàng đến phức tạp, để người học cảm thấy gần gũi, dễ tiếp nhận. Cách vẽ các chủ đề cơ bản như tĩnh vật, phong cảnh, đến những chủ đề nâng cao hơn như phong cảnh góc rộng, đô thị, chân dung…', 20, CAST(500000 AS Numeric(12, 0)), N'https://mythuatbui.edu.vn/wp-content/uploads/2017/11/Sd-web-2409.png', CAST(N'2022-09-21' AS Date), CAST(N'2022-10-21' AS Date), 1, 2, 32, CAST(N'2022-09-21' AS Date), 32, CAST(N'2022-08-21' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (44, N'Khóa học guitar đệm hát căn bản', 1, 2, N'Các lớp dạy chơi nhạc cụ rất phổ biến từ mô hình nhỏ dạy tại nhà đến lớn hơn là các trung tâm dạy nhạc cụ với các chương trình giảng dạy khác nhau, đội ngũ giáo viên với cách giảng dạy khác nhau và học phí cũng không giống nhau.Guitar luôn là một loại nhạc cụ được nhiều người theo học và chơi phổ biến, chỉ với một cây guitar bạn có thể làm nên một buổi giao lưu, trò chuyện rôm rả, đầy thú vị, nhất là đối với các bạn sinh viên.', 20, CAST(900000 AS Numeric(12, 0)), N'https://media.istockphoto.com/id/165931148/vector/sketchy-gutar-style.jpg?s=612x612&w=0&k=20&c=4lv-X2QxxbkGOSGGP-_Bq89IcQHHURdBmqMKbcCF23w=', CAST(N'2022-09-22' AS Date), CAST(N'2022-10-22' AS Date), 1, 2, 32, CAST(N'2022-09-22' AS Date), 32, CAST(N'2022-08-22' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (45, N'Gutar cơ bản', 1, 2, N'Các lớp dạy chơi nhạc cụ rất phổ biến từ mô hình nhỏ dạy tại nhà đến lớn hơn là các trung tâm dạy nhạc cụ với các chương trình giảng dạy khác nhau, đội ngũ giáo viên với cách giảng dạy khác nhau và học phí cũng không giống nhau. Guitar luôn là một loại nhạc cụ được nhiều người theo học và chơi phổ biến, chỉ với một cây guitar bạn có thể làm nên một buổi giao lưu, trò chuyện rôm rả, đầy thú vị, nhất là đối với các bạn sinh viên.', 20, CAST(100000 AS Numeric(12, 0)), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvnzgJzkelnBMpdhbWpDbNezRXeAzYLvfgSg&usqp=CAU', CAST(N'2022-09-23' AS Date), CAST(N'2022-10-23' AS Date), 1, 1, 32, CAST(N'2022-09-23' AS Date), 31, CAST(N'2022-08-23' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (46, N'Lớp đào tạo piano chuyên nghiệp', 3, 1, N'Piano là loại nhạc cụ có sức biểu cảm và tầm ảnh hưởng rất lớn trong nền Âm nhạc của nhân loại. Những tiếng đàn Piano du dương đã làm say đắm biết bao thế hệ và đã trở thành một phần không thể thiếu trong nhu cầu thưởng thức nghệ thuật của chúng ta. Các Nghệ sỹ Piano là những Nghệ sỹ danh giá, luôn được xã hội tôn trọng. Vì vậy việc trở thành một Nghệ sỹ Piano luôn là niềm khát khao của rất nhiều người. Ngày nay, việc tiếp cận với bộ môn Piano đã dễ dàng hơn rất nhiều và đang ngày càng phát triển mạnh mẽ ở Việt Nam. Lựa chọn cho mình nơi đào tạo Piano tốt, các bạn sẽ mau chóng phát triển tình yêu Âm nhạc và các kỹ năng để chinh phục những tiếng đàn tuyệt vời này.', 20, CAST(1000000 AS Numeric(12, 0)), N'https://vn.yamaha.com/vi/files/hocguitarchuyennghiep2-min_9fc2f19d49d4ab39d12b95e7165ab9d1.jpg', CAST(N'2022-09-24' AS Date), CAST(N'2022-10-24' AS Date), 1, 2, 32, CAST(N'2022-09-24' AS Date), 32, CAST(N'2022-08-24' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (47, N'PIANOFORTE', 1, 1, N'Pianoforte là bộ môn piano cổ điển, hiểu đơn giản là dạy và học chơi những tác phẩm do các nhạc sĩ nổi tiếng của các thời kỳ âm nhạc biên soạn. Những tác phẩm này vừa phản ánh đời sống văn hóa nhân loại qua các thời kỳ lịch sử, vừa bao hàm hầu hết những kỹ năng về ngón đàn. Vì vậy, một mặt nó mang tính giáo dục cao về văn hóa, mặt khác nó là công cụ để rèn luyện toàn bộ những kỹ năng biểu diễn piano. Có thể người học không trở thành nghệ sĩ biểu diễn, nhưng chắc chắn sẽ trở thành một con người có một nhân cách cân bằng và hài hòa. Đó chính là lợi thế để thành công trong cuộc sống. Mỗi trình độ chuẩn bao gồm 5 phần: Kỹ thuật, Biểu diễn, Kiến thức, Thi tấu và Tai nghe.', 20, CAST(700000 AS Numeric(12, 0)), N'https://pianoforte.vn/wp-content/uploads/2020/03/b8caf7db5a05d12bda14526c005d0b6d.jpg', CAST(N'2022-08-31' AS Date), CAST(N'2022-09-15' AS Date), 1, 3, 32, CAST(N'2022-08-31' AS Date), 32, CAST(N'2022-07-15' AS Date), 20)
INSERT [dbo].[Course] ([CourseID], [Course_Name], [Teacher_ID], [CategoryID], [Description], [Slot], [Tuition_Fee], [Image_Url], [Start_Date], [End_Date], [Status], [LevelID], [Created_By], [Last_Update_Date], [Last_Update_User], [Created_At], [sold_count]) VALUES (48, N'Alo ALo Check', 1, 1, N'dwerfwetewtgewr3w', 20, CAST(700000 AS Numeric(12, 0)), N'https://online.berklee.edu/takenote/wp-content/uploads/2021/06/classical-guitar.jpg', CAST(N'2023-01-03' AS Date), CAST(N'2023-01-03' AS Date), 1, 1, 32, CAST(N'2022-12-13' AS Date), 32, CAST(N'2022-12-13' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [Level_Name]) VALUES (1, N'Beginner')
INSERT [dbo].[Level] ([LevelID], [Level_Name]) VALUES (2, N'Basic')
INSERT [dbo].[Level] ([LevelID], [Level_Name]) VALUES (3, N'Advance')
INSERT [dbo].[Level] ([LevelID], [Level_Name]) VALUES (4, N'Professional')
SET IDENTITY_INSERT [dbo].[Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [UserID], [Buy_Date], [Total_Price], [Payment_Method], [Payment_Status]) VALUES (1, 2, CAST(N'2022-12-13' AS Date), CAST(900000 AS Numeric(12, 0)), N'cash', 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Buy_Date], [Total_Price], [Payment_Method], [Payment_Status]) VALUES (2, 5, CAST(N'2022-12-13' AS Date), CAST(700000 AS Numeric(12, 0)), N'cash', 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Buy_Date], [Total_Price], [Payment_Method], [Payment_Status]) VALUES (3, 2, CAST(N'2022-12-13' AS Date), CAST(100000 AS Numeric(12, 0)), N'cash', 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Buy_Date], [Total_Price], [Payment_Method], [Payment_Status]) VALUES (4, 2, CAST(N'2022-12-13' AS Date), CAST(700000 AS Numeric(12, 0)), N'cash', 1)
INSERT [dbo].[Order] ([OrderID], [UserID], [Buy_Date], [Total_Price], [Payment_Method], [Payment_Status]) VALUES (5, 2, CAST(N'2022-12-13' AS Date), CAST(600000 AS Numeric(12, 0)), N'cash', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Order_Detail] ([OrderID], [CourseID], [Quantity], [Price]) VALUES (1, 36, 1, CAST(700000 AS Numeric(12, 0)))
INSERT [dbo].[Order_Detail] ([OrderID], [CourseID], [Quantity], [Price]) VALUES (1, 37, 1, CAST(200000 AS Numeric(12, 0)))
INSERT [dbo].[Order_Detail] ([OrderID], [CourseID], [Quantity], [Price]) VALUES (2, 36, 1, CAST(700000 AS Numeric(12, 0)))
INSERT [dbo].[Order_Detail] ([OrderID], [CourseID], [Quantity], [Price]) VALUES (3, 39, 1, CAST(100000 AS Numeric(12, 0)))
INSERT [dbo].[Order_Detail] ([OrderID], [CourseID], [Quantity], [Price]) VALUES (4, 38, 1, CAST(700000 AS Numeric(12, 0)))
INSERT [dbo].[Order_Detail] ([OrderID], [CourseID], [Quantity], [Price]) VALUES (5, 41, 1, CAST(600000 AS Numeric(12, 0)))
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (1, N'toanvuongkhac', N'12345', N'Vương Khắc Toàn', N'1651110352     ', N'toanvuongkhac@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (2, N'toanlovan', N'12345', N'Lê Văn Toản', N'1651110385     ', N'toanlovan@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (3, N'tulothanh', N'12345', N'Lê Thanh Tú', N'1651110298     ', N'tulothanh@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (4, N'tuanloanh', N'12345', N'Lã Anh Tuấn', N'1651110147     ', N'tuanloanh@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (5, N'datnguyentien', N'12345', N'Nguyễn Tiến Đạt', N'1651010583     ', N'datnguyentien@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (6, N'huydoquang', N'12345', N'Đỗ Quang Huy', N'1651010014     ', N'huydoquang@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (7, N'namdaongoc', N'12345', N'Đào Ngọc Nam', N'1651010574     ', N'namdaongoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (8, N'thanhnguyenhuu', N'12345', N'Nguyễn Hữu Thành', N'1651010140     ', N'thanhnguyenhuu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (9, N'anchutat', N'12345', N'Chu Tất An', N'1651010441     ', N'anchutat@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (10, N'dongphamduy', N'12345', N'Phạm Duy Đông', N'1651010462     ', N'dongphamduy@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (11, N'dunghoangvan', N'12345', N'Hoàng Văn Dũng', N'1651010488     ', N'dunghoangvan@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (12, N'duongnguyenhong', N'12345', N'Nguyễn Hồng Dương', N'1651010017     ', N'duongnguyenhong@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (13, N'hanguyenvan', N'12345', N'Nguyễn Văn Hà', N'1651010418     ', N'hanguyenvan@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (14, N'haiphamvan', N'12345', N'Phạm Văn Hải', N'1651010322     ', N'haiphamvan@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (15, N'hienphamngoc', N'12345', N'Phạm Ngọc Hiển', N'1651010199     ', N'hienphamngoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (16, N'hoaidomaithu', N'12345', N'Đỗ Mai Thu Hoài', N'1651010495     ', N'hoaidomaithu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (17, N'hoangnguyentranviet', N'12345', N'Nguyễn Việt Hoàng', N'1651010103     ', N'hoangnguyentranviet@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (18, N'hungphanquoc', N'12345', N'Phan Quốc Hùng', N'1651010158     ', N'hungphanquoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (19, N'hungvuthanh', N'12345', N'Vũ Thành Hưng', N'1651010245     ', N'hungvuthanh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (20, N'huyennguyenthithanh', N'12345', N'Nguyễn  Thanh Huyền', N'1651010742     ', N'huyennguyenthithanh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (21, N'huyenphanthingoc', N'12345', N'Phan Thị Ngọc Huyền', N'1651010377     ', N'huyenphanthingoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (22, N'khaibuiduy', N'12345', N'Bùi Duy Khải', N'1651010117     ', N'khaibuiduy@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (23, N'linhphanthiha', N'12345', N'Phan Thị Hà Linh', N'1651010621     ', N'linhphanthiha@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (24, N'phongtranthanh', N'12345', N'Trần Thanh Phong', N'1651010528     ', N'phongtranthanh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (25, N'quynhnguyenthinhu', N'12345', N'Nguyễn Thị Như Quỳnh', N'1651010490     ', N'quynhnguyenthinhu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (26, N'sonduongphamhoang', N'12345', N'Dương Phạm Hoàng Sơn', N'1651010281     ', N'sonduongphamhoang@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (27, N'taivudonh', N'12345', N'Vũ Đình Tài', N'1651010099     ', N'taivudonh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (28, N'thangnguyendonh', N'12345', N'Nguyễn Đình Thắng', N'1651012856     ', N'thangnguyendonh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (29, N'trangduongthu', N'12345', N'Dương Thu Trang', N'1651010031     ', N'trangduongthu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (30, N'trangvithithu', N'12345', N'Vi Thị Thu Trang', N'1651010066     ', N'trangvithithu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (31, N'thanhdd', N'12345', N'Đào Đức Thành', N'1651011111     ', N'thanhdd@gmail.com', N'AD')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (32, N'phuongnh', N'12345', N'Nguyễn Hoài Phương', N'1651019999     ', N'phuongnh@gmail.com', N'AD')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (63, N'toanvuongkhac', N'12345', N'Vương Khắc Toàn', N'01651110352    ', N'toanvuongkhac@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (64, N'toanlovan', N'12345', N'Lê Văn Toản', N'01651110352    ', N'toanlovan@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (65, N'tulothanh', N'12345', N'Lê Thanh Tú', N'01651110352    ', N'tulothanh@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (66, N'tuanloanh', N'12345', N'Lã Anh Tuấn', N'01651110352    ', N'tuanloanh@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (67, N'datnguyentien', N'12345', N'Nguyễn Tiến Đạt', N'01651110352    ', N'datnguyentien@gmail.com', N'TC')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (68, N'huydoquang', N'12345', N'Đỗ Quang Huy', N'01651110352    ', N'huydoquang@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (69, N'namdaongoc', N'12345', N'Đào Ngọc Nam', N'01651110352    ', N'namdaongoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (70, N'thanhnguyenhuu', N'12345', N'Nguyễn Hữu Thành', N'01651110352    ', N'thanhnguyenhuu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (71, N'anchutat', N'12345', N'Chu Tất An', N'01651110352    ', N'anchutat@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (72, N'dongphamduy', N'12345', N'Phạm Duy Đông', N'01651110352    ', N'dongphamduy@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (73, N'dunghoangvan', N'12345', N'Hoàng Văn Dũng', N'01651110352    ', N'dunghoangvan@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (74, N'duongnguyenhong', N'12345', N'Nguyễn Hồng Dương', N'01651110352    ', N'duongnguyenhong@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (75, N'hanguyenvan', N'12345', N'Nguyễn Văn Hà', N'01651110352    ', N'hanguyenvan@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (76, N'haiphamvan', N'12345', N'Phạm Văn Hải', N'01651110352    ', N'haiphamvan@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (77, N'hienphamngoc', N'12345', N'Phạm Ngọc Hiển', N'01651110352    ', N'hienphamngoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (78, N'hoaidomaithu', N'12345', N'Đỗ Mai Thu Hoài', N'01651110352    ', N'hoaidomaithu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (79, N'hoangnguyentranviet', N'12345', N'Nguyễn Việt Hoàng', N'01651110352    ', N'hoangnguyentranviet@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (80, N'hungphanquoc', N'12345', N'Phan Quốc Hùng', N'01651110352    ', N'hungphanquoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (81, N'hungvuthanh', N'12345', N'Vũ Thành Hưng', N'01651110352    ', N'hungvuthanh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (82, N'huyennguyenthithanh', N'12345', N'Nguyễn  Thanh Huyền', N'01651110352    ', N'huyennguyenthithanh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (83, N'huyenphanthingoc', N'12345', N'Phan Thị Ngọc Huyền', N'01651110352    ', N'huyenphanthingoc@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (84, N'khaibuiduy', N'12345', N'Bùi Duy Khải', N'01651110352    ', N'khaibuiduy@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (85, N'linhphanthiha', N'12345', N'Phan Thị Hà Linh', N'01651110352    ', N'linhphanthiha@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (86, N'phongtranthanh', N'12345', N'Trần Thanh Phong', N'01651110352    ', N'phongtranthanh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (87, N'quynhnguyenthinhu', N'12345', N'Nguyễn Thị Như Quỳnh', N'01651110352    ', N'quynhnguyenthinhu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (88, N'sonduongphamhoang', N'12345', N'Dương Phạm Hoàng Sơn', N'01651110352    ', N'sonduongphamhoang@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (89, N'taivudonh', N'12345', N'Vũ Đình Tài', N'01651110352    ', N'taivudonh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (90, N'thangnguyendonh', N'12345', N'Nguyễn Đình Thắng', N'01651110352    ', N'thangnguyendonh@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (91, N'trangduongthu', N'12345', N'Dương Thu Trang', N'01651110352    ', N'trangduongthu@gmail.com', N'ST')
INSERT [dbo].[User] ([UserID], [Username], [Password], [Fullname], [Phone], [Email], [Role]) VALUES (92, N'trangvithithu', N'12345', N'Vi Thị Thu Trang', N'01651110352    ', N'trangvithithu@gmail.com', N'ST')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((0)) FOR [Slot]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((0)) FOR [Tuition_Fee]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((0)) FOR [sold_count]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT ((0)) FOR [Total_Price]
GO
ALTER TABLE [dbo].[Order_Detail] ADD  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([Created_By])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([Last_Update_User])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_1] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_1]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_1] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_1]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_2] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_2]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_1]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_2] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_2]
GO
