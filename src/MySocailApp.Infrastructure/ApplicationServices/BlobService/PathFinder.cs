using MySocailApp.Application.ApplicationServices.BlobService;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class PathFinder : IPathFinder
    {
        public string GetPath(string rootName, string containerName, string blobName) => $"{rootName}/{containerName}/{blobName}";
    }
}
