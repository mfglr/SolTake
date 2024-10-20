using MySocailApp.Application.InfrastructureServices.BlobService;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class BlobNameGenerator(IPathFinder pathFinder) : IBlobNameGenerator
    {
        private readonly IPathFinder _pathFinder = pathFinder;

        public string Generate(string root, string containerName, string? extention = null)
        {
            ArgumentNullException.ThrowIfNull(root);
            ArgumentNullException.ThrowIfNull(containerName);

            string blobName;
            do
            {
                if (extention == null)
                    blobName = $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
                else
                    blobName = $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}.{extention}";
            } while (File.Exists(_pathFinder.GetPath(root, containerName, blobName)));
            return blobName;
        }
    }
}
