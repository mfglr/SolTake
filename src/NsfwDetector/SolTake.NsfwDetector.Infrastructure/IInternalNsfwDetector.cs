namespace SolTake.NsfwDetector.Infrastructure
{
    internal interface IInternalNsfwDetector
    {
        Task<NsfwScoreResult> ClassifyAsync(string text, CancellationToken cancellationToken);
        Task<NsfwScoreResult> ClassifyImageAsync(string inputPath, CancellationToken cancellationToken);
        Task<NsfwScoreResult> ClassifyImagesAsync(IEnumerable<string> inputPaths, CancellationToken cancellationToken);
    }
}
