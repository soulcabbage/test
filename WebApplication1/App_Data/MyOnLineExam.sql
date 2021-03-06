SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
--51aspx.com
CREATE TABLE [dbo].[Users](
	[UserID] [varchar](20) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[UserPwd] [varchar](20) NOT NULL,
	[UserPower] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Score]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Score](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[ExamTime] [datetime] NOT NULL CONSTRAINT [DF_Score_ExamTime]  DEFAULT (getdate()),
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SingleProblem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SingleProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[AnswerA] [varchar](500) NOT NULL,
	[AnswerB] [varchar](500) NOT NULL,
	[AnswerC] [varchar](500) NOT NULL,
	[AnswerD] [varchar](500) NOT NULL,
	[Answer] [varchar](2) NOT NULL,
 CONSTRAINT [PK_SingleProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JudgeProblem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JudgeProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[Answer] [bit] NOT NULL,
 CONSTRAINT [PK_JudgeProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MultiProblem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MultiProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [varchar](1000) NOT NULL,
	[AnswerA] [varchar](500) NOT NULL,
	[AnswerB] [varchar](500) NOT NULL,
	[AnswerC] [varchar](500) NOT NULL,
	[AnswerD] [varchar](500) NOT NULL,
	[Answer] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MultiProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FillBlankProblem]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FillBlankProblem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[FrontTitle] [varchar](500) NULL,
	[BackTitle] [varchar](500) NULL,
	[Answer] [varchar](200) NOT NULL,
 CONSTRAINT [PK_FillBlankProblem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paper]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paper](
	[PaperID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[PaperName] [varchar](200) NOT NULL,
	[PaperState] [bit] NOT NULL,
 CONSTRAINT [PK_Paper] PRIMARY KEY CLUSTERED 
(
	[PaperID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Tr_Paper_Insert] ON [dbo].[Paper] FOR INSERT AS SELECT @@IDENTITY
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_PaperDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[Proc_PaperDetail]
		(@PaperID		[int],
		 @Type			[varchar](10))
AS
begin 
	declare @sql nvarchar(1000)
if @Type=''单选题''
 begin	
	set @sql=''select * from PaperDetail,SingleProblem where [Type]=''''单选题'''' and PaperDetail.TitleID=SingleProblem.ID and [PaperID]= ''+Cast(@PaperID AS varchar(10)) 
	exec sp_executesql @sql		
 end
else if @Type=''多选题''
 begin	
	set @sql=''select * from PaperDetail,MultiProblem where [Type]=''''多选题'''' and PaperDetail.TitleID=MultiProblem.ID and [PaperID]='' + +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
else if @Type=''判断题''
 begin	
	set @sql=''select * from PaperDetail,JudgeProblem where [Type]=''''判断题'''' and PaperDetail.TitleID=JudgeProblem.ID and [PaperID]='' + +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
else
 begin	
	set @sql=''select * from PaperDetail,FillBlankProblem where [Type]=''''填空题'''' and PaperDetail.TitleID=FillBlankProblem.ID and [PaperID]='' + +Cast(@PaperID AS varchar(10))
	exec sp_executesql @sql		
 end
end

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PaperDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PaperDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaperID] [int] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[TitleID] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_ExamPaper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_UsersDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_UsersDetail]
	@UserID	[varchar](50)
AS SELECT 	[dbo].[Users].[UserID], 
		[dbo].[Users].[UserName],
		[dbo].[Users].[UserPwd], 
		[dbo].[Users].[UserPower]		
		
		
FROM 		[dbo].[Users]
WHERE UserID=@UserID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_ScoreList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[Proc_ScoreList]
AS SELECT 	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],
		[dbo].[Score].[ID],
		[dbo].[Score].[Score],
		[dbo].[Score].[ExamTime],
		[dbo].[Paper].[PaperName]
FROM 		[dbo].[Users],[dbo].[Score],[dbo].[Paper]
where Users.UserID=Score.UserID and Score.PaperID=Paper.PaperID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_UsersAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



create PROCEDURE [dbo].[Proc_UsersAdd]
	(@UserID	 	[varchar](20), 
	 @UserName 		[varchar](20),
	 @UserPwd 		[varchar](20),
	 @UserPower 	[int])

AS INSERT INTO [MyOnLineExam].[dbo].[Users] 
	 ([UserID], 
	 [UserName],
	 [UserPwd],
	 [UserPower]) 
 
VALUES 
	( @UserID,	 
	 @UserName,
	 @UserPwd,
	 @UserPower)

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_UsersDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_UsersDelete]
	(@UserID		[varchar](20))
AS DELETE [MyOnLineExam].[dbo].[Users] 
WHERE 
	( [UserID]	 = @UserID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_UsersList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_UsersList]
AS SELECT 	[dbo].[Users].[UserID],		 
		[dbo].[Users].[UserName],
		[dbo].[Users].[UserPower]
FROM 		[dbo].[Users]' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_UsersModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_UsersModify]
	(@UserID	 	[varchar](20),	 
	 @UserName 		[varchar](20),
	 @UserPower 	[int])

AS UPDATE [MyOnLineExam].[dbo].[Users] 

SET  [UserPower]	= @UserPower,
	 [UserName]		= @UserName

WHERE 
	( [UserID]	 = @UserID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_ScoreDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_ScoreDelete]
	(@ID		[int])
AS DELETE [MyOnLineExam].[dbo].[Score] 
WHERE 
	( [ID]	 = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_ScoreAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROCEDURE [dbo].[Proc_ScoreAdd]
	(@UserID	 	[varchar](20), 
	 @PaperID 		[int],
	 @Score 		[int])

AS INSERT INTO [MyOnLineExam].[dbo].[Score] 
	 ([UserID], 
	 [PaperID],
	 [Score]) 
 
VALUES 
	( @UserID,	 
	 @PaperID,
	 @Score)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_SingleProblemDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[Proc_SingleProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[SingleProblem]
where ID=@ID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_SingleProblemAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_SingleProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](2))

AS INSERT INTO [MyOnLineExam].[dbo].[SingleProblem] 
	 ([CourseID],
	 [Title],
	 [AnswerA],
	 [AnswerB],
	 [AnswerC],
	 [AnswerD],
	 [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,
	 @AnswerA,
	 @AnswerB,
	 @AnswerC,
	 @AnswerD,
	 @Answer)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_SingleProblemModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_SingleProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](2))

AS UPDATE [MyOnLineExam].[dbo].[SingleProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,
	 [AnswerA]	= @AnswerA,
	 [AnswerB]	= @AnswerB,
	 [AnswerC]	= @AnswerC,
	 [AnswerD]	= @AnswerD,
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_SingleProblemDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_SingleProblemDelete]
	(@ID		[int])
AS DELETE [MyOnLineExam].[dbo].[SingleProblem] 
WHERE 
	( [ID]	 = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_SingleProblemList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[Proc_SingleProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[SingleProblem].[ID], 
		left([dbo].[SingleProblem].[Title],10) as Title
FROM 		[MyOnLineExam].[dbo].[SingleProblem] 
where [CourseID]=@CourseID
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_CourseList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_CourseList]		
AS SELECT 	*
FROM 		[MyOnLineExam].[dbo].[Course] 
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_PaperList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_PaperList]	
AS SELECT 	*		
FROM 		[dbo].[Paper],[dbo].[Course]
where [Paper].CourseID=[Course].ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_CourseModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_CourseModify]
	(@ID	 		[int],	 
	 @Name 		[varchar](200))

AS UPDATE [MyOnLineExam].[dbo].[Course] 

SET  [Name]		= @Name

WHERE 
	( [ID]	 = @ID)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_CourseDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_CourseDelete]
	(@ID		[int])
AS DELETE [MyOnLineExam].[dbo].[Course] 
WHERE 
	( [ID]	 = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_CourseAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_CourseAdd]
	(@Name 		[varchar](200))

AS INSERT INTO [MyOnLineExam].[dbo].[Course] 
	 ([Name]) 
 
VALUES 
	(@Name)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_JudgeProblemModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_JudgeProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),	 
	 @Answer	[bit])

AS UPDATE [MyOnLineExam].[dbo].[JudgeProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,	 
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_JudgeProblemAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


Create PROCEDURE [dbo].[Proc_JudgeProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),	 
	 @Answer	[bit])

AS INSERT INTO [MyOnLineExam].[dbo].[JudgeProblem] 
	 ([CourseID],
	  [Title],	 
	  [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,	 
	 @Answer)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_JudgeProblemDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



create PROCEDURE [dbo].[Proc_JudgeProblemDelete]
	(@ID		[int])
AS DELETE [MyOnLineExam].[dbo].[JudgeProblem] 
WHERE 
	( [ID]	 = @ID)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_JudgeProblemDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_JudgeProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[JudgeProblem]
where ID=@ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_JudgeProblemList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_JudgeProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[JudgeProblem].[ID], 
		left([dbo].[JudgeProblem].[Title],10) as Title
FROM 		[MyOnLineExam].[dbo].[JudgeProblem] 
where [CourseID]=@CourseID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_MultiProblemAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_MultiProblemAdd]
	(@CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](50))

AS INSERT INTO [MyOnLineExam].[dbo].[MultiProblem] 
	 ([CourseID],
	 [Title],
	 [AnswerA],
	 [AnswerB],
	 [AnswerC],
	 [AnswerD],
	 [Answer]) 
 
VALUES 
	(@CourseID,
	 @Title,
	 @AnswerA,
	 @AnswerB,
	 @AnswerC,
	 @AnswerD,
	 @Answer)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_MultiProblemDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_MultiProblemDelete]
	(@ID		[int])
AS DELETE [MyOnLineExam].[dbo].[MultiProblem] 
WHERE 
	( [ID]	 = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_MultiProblemDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



create PROCEDURE [dbo].[Proc_MultiProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[MultiProblem]
where ID=@ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_MultiProblemList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




create PROCEDURE [dbo].[Proc_MultiProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[MultiProblem].[ID], 
		left([dbo].[MultiProblem].[Title],10) as Title
FROM 		[MyOnLineExam].[dbo].[MultiProblem] 
where [CourseID]=@CourseID

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_MultiProblemModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_MultiProblemModify]
	(@ID		[int],
	 @CourseID	[int],
	 @Title 	[varchar](1000),
	 @AnswerA 	[varchar](500),
	 @AnswerB 	[varchar](500),
	 @AnswerC 	[varchar](500),
	 @AnswerD 	[varchar](500),
	 @Answer	[varchar](50))

AS UPDATE [MyOnLineExam].[dbo].[MultiProblem] 

SET  [CourseID]	= @CourseID,
	 [Title]	= @Title,
	 [AnswerA]	= @AnswerA,
	 [AnswerB]	= @AnswerB,
	 [AnswerC]	= @AnswerC,
	 [AnswerD]	= @AnswerD,
	 [Answer]	= @Answer 

WHERE 
	( [ID]	 = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_FillBlankProblemList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

create PROCEDURE [dbo].[Proc_FillBlankProblemList]
		(@CourseID		[int])
AS SELECT 	[dbo].[FillBlankProblem].[ID], 
		left([dbo].[FillBlankProblem].[FrontTitle],10) as FrontTitle,
		left([dbo].[FillBlankProblem].[BackTitle],10) as BackTitle
FROM 		[MyOnLineExam].[dbo].[FillBlankProblem] 
where [CourseID]=@CourseID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_FillBlankProblemDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_FillBlankProblemDetail]
	@ID	[int]
AS SELECT 	*
FROM [dbo].[FillBlankProblem]
where ID=@ID' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_FillBlankProblemDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



create PROCEDURE [dbo].[Proc_FillBlankProblemDelete]
	(@ID		[int])
AS DELETE [MyOnLineExam].[dbo].[FillBlankProblem] 
WHERE 
	( [ID]	 = @ID)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_FillBlankProblemAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_FillBlankProblemAdd]
	(@CourseID		[int],
	 @FrontTitle 	[varchar](500),
	 @BackTitle 	[varchar](500),	 
	 @Answer		[varchar](200))

AS INSERT INTO [MyOnLineExam].[dbo].[FillBlankProblem] 
	 ([CourseID],
	  [FrontTitle],
	  [BackTitle],	 
	  [Answer]) 
 
VALUES 
	(@CourseID,
	 @FrontTitle,
	 @BackTitle,	 
	 @Answer)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_FillBlankProblemModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_FillBlankProblemModify]
	(@ID			[int],
	 @CourseID		[int],
	 @FrontTitle 	[varchar](500),
	 @BackTitle		[varchar](500),	 
	 @Answer		[varchar](200))

AS UPDATE [MyOnLineExam].[dbo].[FillBlankProblem] 

SET  [CourseID]		= @CourseID,
	 [FrontTitle]	= @FrontTitle,
	 [BackTitle]	= @BackTitle,	 
	 [Answer]		= @Answer 

WHERE 
	( [ID]	 = @ID)
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_PaperUseList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create PROCEDURE [dbo].[Proc_PaperUseList]
	(@paperState	[bit])
AS SELECT 	[dbo].[Paper].[PaperID],		 
		[dbo].[Paper].[PaperName]		
FROM 		[dbo].[Paper]
where PaperState=@paperState' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_PaperModify]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_PaperModify]
	(@PaperID		[int],
	 @PaperState 	[bit])

AS UPDATE [MyOnLineExam].[dbo].[Paper] 

SET  [PaperState]		= @PaperState

WHERE 
	( [PaperID]	 = @PaperID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_PaperDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


create PROCEDURE [dbo].[Proc_PaperDelete]
	(@PaperID		[int])
AS DELETE [MyOnLineExam].[dbo].[Paper] 
WHERE 
	( [PaperID]	 = @PaperID)
' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PaperDetail_Paper1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PaperDetail]'))
ALTER TABLE [dbo].[PaperDetail]  WITH CHECK ADD  CONSTRAINT [FK_PaperDetail_Paper1] FOREIGN KEY([PaperID])
REFERENCES [dbo].[Paper] ([PaperID])
ON DELETE CASCADE
