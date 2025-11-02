namespace SolTake.MediaMetadataService.Application
{
    public interface IDimentionCalculator
    {
        Task<(double width, double height)> CalculateAsync(Stream stream, CancellationToken cancellationToken);
    }
}
