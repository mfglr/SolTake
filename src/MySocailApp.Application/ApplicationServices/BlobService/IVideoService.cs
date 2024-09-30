using Microsoft.AspNetCore.Http;

namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IVideoService
    {
        Task<AppVideo> SaveAsync(IFormFile file, CancellationToken cancellationToken);
        Task<byte[]> ReadAsync(string containerName, string blobName);
        void RollBack();
    }
}
