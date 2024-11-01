using BlobService.Application.Objects;
using Microsoft.AspNetCore.Http;

namespace BlobService.Application
{
    public interface IImageService
    {
        Task<AppImage> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken);
        Task<List<AppImage>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken);
        Task<byte[]> ReadAsync(string containerName, string blobName, CancellationToken cancellationToken);
        void Delete(string containerName, string blobName);
        void DeleteRange(string containerName, IEnumerable<string> blobNames);

        Task<AppImage> UpdateUserImageAsync(Guid userId, IFormFile file, CancellationToken cancellationToken);
    }
}
