using Microsoft.AspNetCore.Http;
using MySocailApp.Core;

namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IMultimedyaService
    {
        public Task<List<Multimedia>> UploadAsync(string container, IFormFileCollection files, CancellationToken cancellationToken);
    }
}
