namespace SolTake.ThumbnailGenerator.Application
{
    public interface ITempDirectoryManager
    {
        string ScopeContainerName { get; }
        Task<string> AddAsync(Stream stream, CancellationToken cancellationToken);
        Task<Stream> ReadAsync(string blobName, CancellationToken cancellationToken);
        Task Create(CancellationToken cancellationToken);
        Task Delete(CancellationToken cancellationToken);
    }
}
