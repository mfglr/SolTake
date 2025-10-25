namespace SolTake.ThumbnailGenerator.Application.UseCases.CalculateAspectRatios
{
    public record Media_CalculateAspectRatios(string ContainerName, string BlobName);
    public record CalculateAspectRatios(IEnumerable<Media_CalculateAspectRatios> Media);
}
