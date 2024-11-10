namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class PathFinder
    {
        public string GetPath(string containerName, string blobName) => $"Blobs/{containerName}/{blobName}";
    }
}
