using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Infrastructure.InfrastructureServices;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;

namespace MySocialApp.Infrastructure.Tests
{
    public class LocalBlobServiceTests
    {
        private readonly PathFinder _pathFinder;
        private readonly IBlobService _localBlobService;
        private readonly string _containerName;
        private readonly string _blobName;
        private readonly CancellationToken _cancellationToken;

        public LocalBlobServiceTests()
        {
            _pathFinder = new PathFinder();
            _localBlobService = new LocalBlobService(_pathFinder);
            _containerName = "test";
            _blobName = "test.txt";
            _cancellationToken = new CancellationToken();

            Directory.CreateDirectory(_pathFinder.GetContainerPath(_containerName));
            if (!File.Exists(_blobName))
            {
                var file = File.Create(_blobName);
                file.Close();
            }
        }

        [Fact]
        public async Task UploadAsync_WhenBlobNameAlreadyExist_ThenThrowExceptionAsync()
        {
            using var blob = File.OpenRead(_blobName);
            
            if(!await _localBlobService.Exist(_containerName,_blobName,_cancellationToken))
                await _localBlobService.UploadAsync(blob, _containerName, _blobName, _cancellationToken);
            
            var exception = await Assert.ThrowsAsync<BlobNameExistException>( async () => await _localBlobService.UploadAsync(blob, _containerName, _blobName, _cancellationToken));
            
            blob.Close();
        }
    }
}