namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IPathFinder
    {
        string GetContainerPath(string containerName);
        string GetPath(string containerName, string blobName);
    }
}
