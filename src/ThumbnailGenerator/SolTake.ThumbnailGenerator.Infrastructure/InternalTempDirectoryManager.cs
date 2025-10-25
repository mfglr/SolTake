namespace SolTake.ThumbnailGenerator.Infrastructure
{
    internal class InternalTempDirectoryManager
    {
        public string ContainerName { get; private set; }
        
        public InternalTempDirectoryManager() => ContainerName = $"Temp/{GenerateUniqName()}";

        private static string GenerateUniqName(string? extention = null)
        {
            if (extention == null)
                return $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
            return $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}.{extention}";
        }

        private static string GetContainerPath(string containerName)
            => $"{AppContext.BaseDirectory}Blobs/{containerName}";

        private static string GetPath(string containerName, string blobName)
            => $"{AppContext.BaseDirectory}Blobs/{containerName}/{blobName}";


        public string GeneratePath(string? extention = null) => GetPath(ContainerName, GenerateUniqName(extention));

        public void Create() => Directory.CreateDirectory(GetContainerPath(ContainerName));

        public void Delete()
        {
            var path = GetContainerPath(ContainerName);
            if (Directory.Exists(path))
                Directory.Delete(path, true);
        }

        public async Task<string> AddAsync(Stream stream, CancellationToken cancellationToken)
        {
            var path = GetPath(ContainerName, GenerateUniqName());
            using var fileStream = File.Create(path);
            await stream.CopyToAsync(fileStream, cancellationToken);
            return path;
        }
    }
}
