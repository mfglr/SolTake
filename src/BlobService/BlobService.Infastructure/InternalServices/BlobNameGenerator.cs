namespace BlobService.Infastructure.InternalServices
{
    internal static class BlobNameGenerator
    {
        public static string Generate(string root, string containerName, string? extention = null)
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
            } while (File.Exists(PathFinder.GetPath(root, containerName, blobName)));
            return blobName;
        }
    }
}
