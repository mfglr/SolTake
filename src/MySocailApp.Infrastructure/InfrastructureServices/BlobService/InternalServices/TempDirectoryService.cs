using Microsoft.AspNetCore.Http;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class TempDirectoryService(IHttpContextAccessor contextAccessor, UniqNameGenerator blobNameGenerator)
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly UniqNameGenerator _uniqNameGenerator = blobNameGenerator;
        
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

            using var fileStream = File.Create(path);
            await stream.CopyToAsync(fileStream);
            fileStream.Close();
            
            return path;
        }
    }
}
