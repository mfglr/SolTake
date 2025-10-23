using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application
{
    public interface INsfwDetector
    {
        Task<IEnumerable<NsfwScore>> ClasifyAsync(string text, CancellationToken cancellationToken);
        Task<IEnumerable<NsfwScore>> ClasifyAsync(string inputPath, string outputPath, MediaType type, CancellationToken cancellationToken);
    }
}
