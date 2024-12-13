using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;

namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IImageService
    {
        Task<AppImage> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken);
        Task<List<AppImage>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken);
    }
}
