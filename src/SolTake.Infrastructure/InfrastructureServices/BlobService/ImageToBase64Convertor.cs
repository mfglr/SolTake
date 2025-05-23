using SolTake.Application.InfrastructureServices.BlobService;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class ImageToBase64Convertor(IPathFinder pathFinder) : IImageToBase64Convertor
    {
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<string> ToBase64(string containerName, string blobName,CancellationToken cancellationToken)
        {
            var bytes = await File.ReadAllBytesAsync(_pathFinder.GetPath(containerName, blobName), cancellationToken);
            return $"data:image/jpeg;base64,{Convert.ToBase64String(bytes)}";
        }
    }
}
