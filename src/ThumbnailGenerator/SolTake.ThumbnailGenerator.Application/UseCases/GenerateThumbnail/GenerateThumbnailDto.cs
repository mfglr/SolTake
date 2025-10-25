namespace SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail
{
    public record GenerateThumbnailDto(string ContainerName, string BlobName, double Resulation, bool IsSquare);
}
