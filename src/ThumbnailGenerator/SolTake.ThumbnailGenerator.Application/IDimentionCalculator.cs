using SolTake.Core;

namespace SolTake.ThumbnailGenerator.Application
{
    public interface IDimentionCalculator
    {
        Task<Dimention> CalculateAsync(Stream stream, CancellationToken cancellationToken);
    }
}
