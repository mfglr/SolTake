namespace SolTake.NsfwDetector.Application
{
    public interface IBlobService
    {
        Task<Stream> ReadAsync(string containerName, string blobName, CancellationToken cancellationToken);
    }
}
