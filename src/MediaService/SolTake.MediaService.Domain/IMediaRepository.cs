namespace SolTake.MediaService.Domain
{
    public interface IMediaRepository
    {
        Task CreateAsync(Media media, CancellationToken cancellationToken);
        Task CreateManyAsync(IEnumerable<Media> media, CancellationToken cancellationToken);
        Task<Media?> GetByIdAsync(Guid id, CancellationToken cancellationToken);
        Task UpdateAsync(Media media, CancellationToken cancellationToken);
    }
}
