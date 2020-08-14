USE [MyDatabase]
CREATE TABLE [dbo].[CompanyTable](  
    [SrNo] [int] IDENTITY(1,1) NOT NULL,  
    [CompanyName] [nvarchar](50) NULL,  
    [TurnoverAmt] [numeric](10,3)NULL, 
	[GSTIN] [nvarchar](50) NULL, 
    [Sdate] [date] NULL,  
    [Edate] [date] NULL, 
	[Email] [nvarchar](50) NULL,
	[Contact] [int] NULL
 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED   
(  
    [SrNo] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]  
) ON [PRIMARY]  
  
GO  
  
CREATE procedure [dbo].[spGetCompanyAllDetails]  
as  
begin  
select SrNo,CompanyName,TurnoverAmt,GSTIN,Sdate,Edate,Email,Contact from CompanyTable  
end  



