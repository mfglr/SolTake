using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;

namespace MySocailApp.Infrastructure.InfrastructureServices
{
    public class LocalBlobService(PathFinder pathFinder) : IBlobService
    {
        private readonly PathFinder _pathFinder = pathFinder;

        public async Task UploadAsync(Stream stream, string containerName, string blobName, CancellationToken cancellationToken)
        {
            var path = _pathFinder.GetPath(containerName, blobName);
            if (File.Exists(path))
                throw new BlobNameExistException();

            using var fileStream = File.OpenWrite(path);
            await stream.CopyToAsync(fileStream, cancellationToken);
            fileStream.Close();
        }

        public async Task UploadAsync(byte[] bytes, string containerName, string blobName, CancellationToken cancellationToken)
        {
            var path = _pathFinder.GetPath(containerName, blobName);
            if (File.Exists(path))
                throw new BlobNameExistException();

            using var fileStream = File.OpenWrite(path);
            await fileStream.WriteAsync(bytes, cancellationToken);
            fileStream.Close();
        }

        public Task DeleteAsync(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var path = _pathFinder.GetPath(containerName, blobName);
            File.Delete(path);
            return Task.CompletedTask;
        }

        public Task<Stream> ReadAsync(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var path = _pathFinder.GetPath(containerName, blobName);
            if (!File.Exists(path))
                throw new BlobNotFoundException();

            var stream = (Stream)File.OpenRead(path);
            return Task.FromResult(stream);
        }

        public Task<bool> Exist(string containerName, string blobName, CancellationToken cancellationToken)
            => Task.FromResult(File.Exists(_pathFinder.GetPath(containerName, blobName)));

        public Task MoveAsync(string blobName, string sourceContainerName, string destinationContainerName, CancellationToken cancellationToken)
        {
            var sourcePath = _pathFinder.GetPath(sourceContainerName, blobName);
            var destinationPath = _pathFinder.GetPath(destinationContainerName, blobName);

            if (!File.Exists(sourcePath))
                return Task.CompletedTask;
            
            File.Move(sourcePath, destinationPath, true);

            return Task.CompletedTask;
        }
    }
}
