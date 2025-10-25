namespace SolTake.ThumbnailGenerator.Application.UseCases.CalculateMediaAspectRatios
{
    public record Media_CalculateMediaAspectRatios(string ContainerName, string BlobName);
    public record CalculateMediaAspectRatios(IEnumerable<Media_CalculateMediaAspectRatios> Media);
}
