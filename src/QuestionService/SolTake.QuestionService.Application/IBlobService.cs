using Microsoft.AspNetCore.Http;

namespace SolTake.QuestionService.Application
{
    public interface IBlobService
    {
        Task<List<string>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken);
        Task DeleteAsync(string containerName, IEnumerable<string> blobNames, CancellationToken cancellationToken);
    }
}
