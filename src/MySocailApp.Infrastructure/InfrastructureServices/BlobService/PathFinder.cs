using MySocailApp.Application.InfrastructureServices.BlobService;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class PathFinder : IPathFinder
    {
        public string GetPath(string rootName, string containerName, string blobName) => $"{rootName}/{containerName}/{blobName}";
    }
}
