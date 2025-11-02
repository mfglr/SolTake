namespace SolTake.MediaMetadataService.Application
{
    public interface IBlobService
    {
        Task UploadAsync(Stream stream, string containerName, string blobName, CancellationToken cancellationToken);
        Task DeleteAsync(string containerName, string blobName, CancellationToken cancellationToken);
        Task<Stream> GetAsync(string containerName, string blobName, CancellationToken cancellationToken);
    }
}
