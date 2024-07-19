using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.Services.BlobService
{
    public interface IBlobService
    {
        Task<Image> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken);
        Task<List<Image>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken);
        Stream Read(string containerName,string blobName);
        void Rollback();
    }
}
