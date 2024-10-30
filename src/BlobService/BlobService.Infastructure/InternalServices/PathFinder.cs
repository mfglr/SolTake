namespace BlobService.Infastructure.InternalServices
{
    internal static class PathFinder
    {
        public static string GetPath(string rootName, string containerName, string blobName) 
            => $"{rootName}/{containerName}/{blobName}";
    }
}
