using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService
{
    public class ImageToBase64Convertor(IPathFinder pathFinder) : IImageToBase64Convertor
    {
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<string> ToBase64(string containerName, string blobName,CancellationToken cancellationToken)
        {
            var bytes = await File.ReadAllBytesAsync(_pathFinder.GetPath(containerName, blobName), cancellationToken);
            return $"data:image/jpeg;base64,{Convert.ToBase64String(bytes)}";
        }

        public async Task<string> ToBase64(Stream stream, CancellationToken cancellationToken)
        {
            var bytes = await stream.ToByteArrayAsync(cancellationToken);
            return $"data:image/jpeg;base64,{Convert.ToBase64String(bytes)}";
        }

        public string ToBase64(byte[] bytes,string format) => $"data:image/{format};base64,{Convert.ToBase64String(bytes)}";
    }
}
