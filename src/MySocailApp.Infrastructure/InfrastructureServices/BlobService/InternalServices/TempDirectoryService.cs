using Microsoft.AspNetCore.Http;
using MySocailApp.Core.Exceptions;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class TempDirectoryService(IHttpContextAccessor contextAccessor, UniqNameGenerator uniqNameGenerator)
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        
        public string TempDirectoryPath => $"Temp/{_contextAccessor.HttpContext!.TraceIdentifier}";
        public string GetBlobPath(string blobName) => $"{TempDirectoryPath}/{blobName}";

        public void Create()
        {
            _contextAccessor.HttpContext!.TraceIdentifier = _uniqNameGenerator.Generate();
            Directory.CreateDirectory(TempDirectoryPath);
        }
        public void Delete() => Directory.Delete(TempDirectoryPath, true);

        public async Task<string> AddFile(Stream stream)
        {
            var blobName = _uniqNameGenerator.Generate();
            var path = GetBlobPath(blobName);

            if (File.Exists(path))
                throw new ServerSideException();

            using var fileStream = File.Create(path);
            await stream.CopyToAsync(fileStream);
            fileStream.Close();
            
            return path;
        }
    }
}
