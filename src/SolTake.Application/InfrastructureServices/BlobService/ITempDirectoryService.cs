//namespace SolTake.Application.InfrastructureServices.BlobService
//{
//    public interface ITempDirectoryService
//    {
//        string ScopeContainerName { get; }
//        void Create();
//        void Delete();
//        Task<string> AddFile(Stream stream);

//        async Task<T> CreateTransactionAsync<T>(Func<Task<T>> callback)
//        {
//            try
//            {
//                Create();
//                var result = await callback();
//                Delete();
//                return result;
//            }
//            catch (Exception)
//            {
//                Delete();
//                throw;
//            }
//        }

//    }
//}
