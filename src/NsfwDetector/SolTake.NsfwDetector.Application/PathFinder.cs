namespace SolTake.NsfwDetector.Application
{
    internal class PathFinder
    {
        public string GetContainerPath(string containerName)
            => $"{AppContext.BaseDirectory}Blobs/{containerName}";

        public string GetPath(string containerName, string blobName)
            => $"{AppContext.BaseDirectory}Blobs/{containerName}/{blobName}";
    }
}
