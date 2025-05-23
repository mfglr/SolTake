using Microsoft.AspNetCore.Http;

namespace SolTake.Application.InfrastructureServices.BlobService
{
    public interface ITextService
    {
        Task<string> UploadAsync(IFormFile file, string containerName, CancellationToken cancellationToken);
        Task<List<string>> UploadAsync(IFormFileCollection files, string containerName, CancellationToken cancellationToken);
    }
}
