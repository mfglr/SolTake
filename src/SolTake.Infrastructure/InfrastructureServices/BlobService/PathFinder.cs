using SolTake.Application.InfrastructureServices.BlobService;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class PathFinder : IPathFinder
    {
        public string GetContainerPath(string containerName) => $"Blobs/{containerName}";
        public string GetPath(string containerName, string blobName) => $"Blobs/{containerName}/{blobName}";
    }
}
