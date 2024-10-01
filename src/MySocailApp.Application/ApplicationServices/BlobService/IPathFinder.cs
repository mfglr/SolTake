namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IPathFinder
    {
        string GetPath(string rootName, string containerName,string blobName);
    }
}
