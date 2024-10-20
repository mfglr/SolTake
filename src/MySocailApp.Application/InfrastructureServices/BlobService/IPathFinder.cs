namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IPathFinder
    {
        string GetPath(string rootName, string containerName, string blobName);
    }
}
