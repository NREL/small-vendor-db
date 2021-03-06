USE [sm_biz]
GO
/****** Object:  Table [dbo].[data_contacts]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[data_contacts](
	[contact_id] [int] IDENTITY(3548,1) NOT NULL,
	[unique_ID] [uniqueidentifier] NOT NULL CONSTRAINT [DF_data_contacts_unique_ID]  DEFAULT (newid()),
	[biz_name] [nvarchar](255) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[address_1] [nvarchar](50) NULL,
	[address_2] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [char](2) NULL,
	[zip] [nvarchar](10) NULL,
	[phone] [nvarchar](15) NULL,
	[fax] [nvarchar](15) NULL,
	[email] [nvarchar](75) NULL,
	[website] [nvarchar](255) NULL,
	[approved] [nvarchar](1) NULL,
	[date_modified] [datetime2](7) NULL,
	[date_applied] [datetime2](7) NOT NULL CONSTRAINT [DF_data_contacts_date_applied]  DEFAULT (getdate()),
	[comments] [varchar](4000) NULL,
	[hear_about_nrel] [varchar](1000) NULL,
	[sam] [nvarchar](1) NULL,
	[reminder_sent] [datetime2](7) NULL,
 CONSTRAINT [PK_data_contacts_1] PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[data_users]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[administrator] [bit] NOT NULL CONSTRAINT [DF_data_users_administrator]  DEFAULT ((0)),
 CONSTRAINT [data_users$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[join_contacts_certs]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_contacts_certs](
	[contact_id] [int] NULL,
	[cert_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[join_contacts_keywords]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_contacts_keywords](
	[contact_id] [int] NULL,
	[keyword] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[join_contacts_naics]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_contacts_naics](
	[contact_id] [int] NULL,
	[naics_id] [int] NULL,
	[rank] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[join_contacts_products]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_contacts_products](
	[contact_id] [int] NULL,
	[product_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[join_contacts_types]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_contacts_types](
	[contact_id] [int] NULL,
	[type_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lookup_certs]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lookup_certs](
	[cert_id] [int] NOT NULL,
	[cert] [nvarchar](255) NULL,
 CONSTRAINT [lookup_certs$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[cert_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lookup_naics_codes]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lookup_naics_codes](
	[naics_code] [nvarchar](10) NOT NULL,
	[title] [nvarchar](255) NULL,
 CONSTRAINT [lookup_naics_codes$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[naics_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lookup_products]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lookup_products](
	[product_id] [int] NOT NULL,
	[product] [nvarchar](255) NULL,
 CONSTRAINT [lookup_products$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lookup_states]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lookup_states](
	[state] [nvarchar](25) NOT NULL,
	[abbr] [char](2) NOT NULL,
	[ro] [nvarchar](15) NULL,
 CONSTRAINT [PK_lookup_states_1] PRIMARY KEY CLUSTERED 
(
	[state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lookup_types]    Script Date: 6/16/2017 8:31:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lookup_types](
	[type_id] [int] NOT NULL,
	[type] [nvarchar](255) NULL,
	[cert_trigger] [nvarchar](1) NULL,
	[sort_order] [int] NULL,
 CONSTRAINT [lookup_types$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[contact_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'contact_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[biz_name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'biz_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[first_name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'first_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[last_name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'last_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[address_1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'address_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[address_2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'address_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[city]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[state]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[zip]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'zip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[fax]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[email]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[website]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'website'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[approved]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'approved'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[date_modified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'date_modified'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[date_applied]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'date_applied'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[comments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[hear_about_nrel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'hear_about_nrel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[sam]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'sam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts].[reminder_sent]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts', @level2type=N'COLUMN',@level2name=N'reminder_sent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_contacts]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_contacts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_users].[user_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_users', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_users].[username]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_users', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_users]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[data_users].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data_users', @level2type=N'CONSTRAINT',@level2name=N'data_users$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_certs].[contact_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_certs', @level2type=N'COLUMN',@level2name=N'contact_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_certs].[cert_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_certs', @level2type=N'COLUMN',@level2name=N'cert_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_certs]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_certs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_keywords].[contact_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_keywords', @level2type=N'COLUMN',@level2name=N'contact_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_keywords].[keyword]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_keywords', @level2type=N'COLUMN',@level2name=N'keyword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_keywords]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_naics].[contact_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_naics', @level2type=N'COLUMN',@level2name=N'contact_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_naics].[naics_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_naics', @level2type=N'COLUMN',@level2name=N'naics_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_naics].[rank]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_naics', @level2type=N'COLUMN',@level2name=N'rank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_naics]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_naics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_products].[contact_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_products', @level2type=N'COLUMN',@level2name=N'contact_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_products].[product_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_products', @level2type=N'COLUMN',@level2name=N'product_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_products]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_types].[contact_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_types', @level2type=N'COLUMN',@level2name=N'contact_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_types].[type_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_types', @level2type=N'COLUMN',@level2name=N'type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[join_contacts_types]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'join_contacts_types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_certs].[cert_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_certs', @level2type=N'COLUMN',@level2name=N'cert_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_certs].[cert]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_certs', @level2type=N'COLUMN',@level2name=N'cert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_certs]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_certs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_certs].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_certs', @level2type=N'CONSTRAINT',@level2name=N'lookup_certs$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_naics_codes].[naics_code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_naics_codes', @level2type=N'COLUMN',@level2name=N'naics_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_naics_codes].[title]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_naics_codes', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_naics_codes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_naics_codes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_naics_codes].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_naics_codes', @level2type=N'CONSTRAINT',@level2name=N'lookup_naics_codes$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_products].[product_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_products', @level2type=N'COLUMN',@level2name=N'product_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_products].[product]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_products', @level2type=N'COLUMN',@level2name=N'product'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_products]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_products].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_products', @level2type=N'CONSTRAINT',@level2name=N'lookup_products$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_states].[state]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_states', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_states].[abbr]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_states', @level2type=N'COLUMN',@level2name=N'abbr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_states].[ro]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_states', @level2type=N'COLUMN',@level2name=N'ro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_states]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_states'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_types].[type_id]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_types', @level2type=N'COLUMN',@level2name=N'type_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_types].[type]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_types', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_types].[cert_trigger]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_types', @level2type=N'COLUMN',@level2name=N'cert_trigger'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_types].[sort_order]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_types', @level2type=N'COLUMN',@level2name=N'sort_order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_types]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'sm_biz-from-postgresprod-2015-11-05a.[lookup_types].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lookup_types', @level2type=N'CONSTRAINT',@level2name=N'lookup_types$PrimaryKey'
GO
