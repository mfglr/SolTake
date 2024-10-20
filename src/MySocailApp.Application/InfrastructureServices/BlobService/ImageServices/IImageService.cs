using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;

namespace MySocailApp.Application.InfrastructureServices.BlobService.ImageServices
{
    public interface IImageService
    {
        Task<AppImage> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken);
        Task<List<AppImage>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken);
        Task<byte[]> ReadAsync(string containerName, string blobName);
        void Delete(string containerName, string blobName);
        void DeleteRange(string containerName, IEnumerable<string> blobNames);
    }
}
