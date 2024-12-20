using Microsoft.AspNetCore.Http;
using MySocailApp.Core;

namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IMultimedyaService
    {
        public Task<Multimedia?> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken);
        public Task<List<Multimedia>> UploadAsync(string container, IFormFileCollection files, CancellationToken cancellationToken);
    }
}
