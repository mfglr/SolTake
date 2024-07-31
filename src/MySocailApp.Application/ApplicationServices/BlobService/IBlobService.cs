using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IBlobService
    {
        Task<Image> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken);
        Task<List<Image>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken);
        Stream Read(string containerName, string blobName);
        void Rollback();
    }
}
