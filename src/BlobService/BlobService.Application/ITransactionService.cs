namespace BlobService.Application
{
    public interface ITransactionService
    {
        void Create(string path);
        void Delete(string path);
        void Commit();
        void Rollback();
    }
}
