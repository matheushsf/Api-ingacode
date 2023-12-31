BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[tasks] (
    [Id] NVARCHAR(1000) NOT NULL,
    [Name] VARCHAR(250) NOT NULL,
    [Description] VARCHAR(max) NOT NULL,
    [ProjectId] NVARCHAR(1000) NOT NULL,
    [CreatedAt] DATETIME2 NOT NULL,
    [UpdateAt] DATETIME2 NOT NULL,
    [DeletedAt] DATETIME2 NOT NULL,
    CONSTRAINT [tasks_pkey] PRIMARY KEY CLUSTERED ([Id])
);

-- AddForeignKey
ALTER TABLE [dbo].[tasks] ADD CONSTRAINT [tasks_ProjectId_fkey] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[projects]([Id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
