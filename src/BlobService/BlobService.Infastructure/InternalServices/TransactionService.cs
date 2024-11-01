using BlobService.Application;

namespace BlobService.Infastructure.InternalServices
{
    public class TransactionService : ITransactionService
    {
        private readonly List<string> _filesCreated = [];
        private readonly List<string> _filesDeleted = [];

        public void Create(string path) => _filesCreated.Add(path);
        public void Delete(string path)
        {
            _filesDeleted.Add(path);
        }

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
