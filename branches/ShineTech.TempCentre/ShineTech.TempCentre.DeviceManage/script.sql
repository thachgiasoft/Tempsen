CREATE TABLE [AlarmConfig] (
    [ID] int PRIMARY KEY NOT NULL,
    [SN] nvarchar(64) NOT NULL,
    [TN] nvarchar(64) NOT NULL,
    [ProductName] nvarchar(64) NOT NULL,
    [AlarmMode] nvarchar(64),
    [AlarmLevel] nvarchar(8),
    [AlarmTemp] nvarchar(16),
    [AlarmType] nvarchar(16),
    [AlarmDelay] nvarchar(16),
	[AlarmTotalTime] nvarchar(16),
	[AlarmNumbers] int,
	[AlarmFirstTriggered] nvarchar(32),
    [IsAlarm] nvarchar(64) NOT NULL,
	[AlarmEnable] bool,
    [Remark] nvarchar(256)
);

CREATE TABLE [Device] (
    [ID] int PRIMARY KEY NOT NULL,
	DeviceID int,
    [ProductName] nvarchar(50),
    [SerialNum] nvarchar(50),
    [TripNum] nvarchar(50),
    [Model] nvarchar(50),
    [Memory] numeric(12,2),
    [Battery] numeric(12,2),
    [DESCS] nvarchar(128),
	[LoggerReader] nvarchar(64),
	[AlarmMode] int,
    [Remark] nvarchar(256)
);

CREATE TABLE [LogConfig] (
    [ID] int PRIMARY KEY NOT NULL,
    [SN] Nvarchar(64) NOT NULL,
    [TN] nvarchar(64) NOT NULL,
    [ProductName] nvarchar(64) NOT NULL,
    [StartMode] nvarchar(64),
    [LogInterval] nvarchar(16) NOT NULL,
    [LogCycle] nvarchar(16) NOT NULL,
    [StartDelay] nvarchar(16) NOT NULL,
    [Remark] nvarchar(256) NOT NULL
);

CREATE TABLE [Meanings] (
    [ID] int PRIMARY KEY NOT NULL,
    [Desc] nvarchar(64) NOT NULL,
    [Remark] nvarchar(256)
);

CREATE TABLE [OperationLog] (
    [ID] int PRIMARY KEY NOT NULL,
    [OperateTime] datetime,
    [Action] nvarchar(256),
    [UserName] nvarchar(128),
    [FullName] nvarchar(64),
    [Detail] nvarchar(50),
    [LogType] int NOT NULL
);

CREATE TABLE [PointInfo] (
    [ID] int PRIMARY KEY NOT NULL,
    [SN] nvarchar(64) NOT NULL,
    [TN] nvarchar(64) NOT NULL,
    [ProductName] nvarchar(64) NOT NULL,
	[TempUnit] nvarchar(1),
	HighestC nvarchar(64),
	LowestC nvarchar(64),
	StartTime datetime,
	EndTime datetime,
	AVGTemp nvarchar(32),
	FirstPoint datetime,
	MKT nvarchar(64),
	TripLength nvarchar(64),
    [Points] blob,
    [Remark] nvarchar(256)
);

CREATE TABLE [Policy] (
    [ID] int PRIMARY KEY NOT NULL,
    [MinPwdSize] int NOT NULL,
    [InactivityTime] int NOT NULL,
    [PwdExpiredDay] int NOT NULL,
    [LockedTimes] int NOT NULL,
    [ProfileFolder] nvarchar(128),
    [Remark] nvarchar(256)
);

CREATE TABLE [RoleInfo] (
    [ID] int PRIMARY KEY NOT NULL,
    [RoleName] nVarchar(64) NOT NULL,
    [Remark] Nvarchar(256)
);

CREATE TABLE [UserInfo] (
    [Userid] int PRIMARY KEY NOT NULL,
    [Account] nvarchar(32) NOT NULL,
    [UserName] nvarchar(128) NOT NULL,
    [FullName] nvarchar(128),
    [Description] nvarchar(64),
    [Pwd] nvarchar(32),
    [Disabled] int NOT NULL,
    [Locked] int NOT NULL,
    [RoleId] int NOT NULL,
    [LastPwdChangedTime] datetime NOT NULL,
    [Remark] nvarchar(256)
);

CREATE TABLE [UserMeanRelation] (
    [ID] int PRIMARY KEY NOT NULL,
    [UserName] nvarchar(64) NOT NULL,
    [MeaningId] int NOT NULL,
    [Remark] nvarchar(256)
);

CREATE TABLE [UserProfile] (
    [ID] int PRIMARY KEY NOT NULL,
    [UserName] nvarchar(50) NOT NULL,
    [Logo] blob,
    [ContactInfo] nvarchar(256),
    [ReportTitle] nvarchar(50),
    [DefaultPath] nvarchar(128),
	[IsGlobal] int,
	[IsShowHeader] bool,
	[TempUnit]varchar(1),
	[TempCurveRGB] nvarchar(12),
	[AlarmLineRGB] nvarchar(12),
	[IdealRangeRGB] nvarchar(12),
	[IsShowAlarmLimit] bool,
	[IsShowMark] bool,
	[IsFillIdealRange] bool,
	[DateTimeFormator] nvarchar(32),
    [Remark] nvarchar(128)
);

CREATE TABLE [UserRight] (
    [ID] int PRIMARY KEY NOT NULL,
    [UserName] nvarchar(50) NOT NULL,
    [Right] nvarchar(64) NOT NULL,
    [Remark] nvarchar(256)
);
CREATE TABLE [DigitalSignature] (
    [ID] int PRIMARY KEY NOT NULL,
    [SN] nvarchar(64) NOT NULL,
    [TN] nvarchar(64) NOT NULL,
    [UserName] nvarchar(64) NOT NULL,
    [FullName] nvarchar(64),
    [MeaningDesc] nvarchar(64),
    [SignTime] datetime,
    [Remark] nvarchar(256)
);
CREATE TABLE [ReportEditor] (
    [ID] int PRIMARY KEY NOT NULL,
    [SN] varchar(64),
    [TN] varchar(64),
    [IsLogoExist] bool,
    [ReportTitle] varchar(64),
    [IsContactInfoChecked] bool,
    [IsDeviceInfoChecked] bool,
    [IsSummaryChecked] bool,
    [Comments] varchar(256),
    [Remark] varchar(50)
);