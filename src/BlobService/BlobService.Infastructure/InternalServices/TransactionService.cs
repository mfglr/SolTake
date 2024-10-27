using BlobService.Application;

namespace BlobService.Infastructure.InternalServices
{
    public class TransactionService : ITransactionService
    {
        private readonly List<string> _filesCreated = [];
        private readonly List<string> _filesDeleted = [];

        public void AddFileCreated(string path) => _filesCreated.Add(path);
        public void AddFileDeleted(string path) => _filesDeleted.Add(path);

        public void Commit()
        {
            foreach (var file in _filesDeleted)
                if (File.Exists(file))
                    File.Delete(file);
        }

        public void Rollback()
        {
            foreach (var file in _filesCreated)
                if (File.Exists(file))
                    File.Delete(file);
        }
    }
}
