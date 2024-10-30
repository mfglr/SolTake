namespace BlobService.Application
{
    public interface ITransactionService
    {
        void AddFileCreated(string path);
        void AddFileDeleted(string path);
        void Commit();
        void Rollback();
    }
}
