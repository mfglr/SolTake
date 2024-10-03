using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;

namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IVideoService
    {
        Task<AppVideo> SaveAsync(IFormFile file, string containerNameOfVideo, string containerNameOfFrame, CancellationToken cancellationToken);
        void Delete(string containerName, string blobName);
        Stream Read(string containerName, string blobName);
    }
}
