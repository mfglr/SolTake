namespace SolTake.ThumbnailGenerator.Application
{
    public interface IThumbnailGenerator
    {
        Task<Stream> GenerateAsync(Stream stream, double resulation, bool isSquare, CancellationToken cancellationToken);
    }
}
