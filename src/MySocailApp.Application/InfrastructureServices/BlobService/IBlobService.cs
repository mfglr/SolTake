namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IBlobService
    {
        Task UploadAsync(Stream stream, string containerName, string blobName,CancellationToken cancellationToken);
        Task UploadAsync(byte[] bytes, string containerName, string blobName, CancellationToken cancellationToken);
        Task<Stream> ReadAsync(string containerName, string blobName, CancellationToken cancellationToken);
        Task DeleteAsync(string containerName, string blobName, CancellationToken cancellationToken);
        Task<bool> Exist(string containerName, string blobName, CancellationToken cancellationToken);

    }
}
