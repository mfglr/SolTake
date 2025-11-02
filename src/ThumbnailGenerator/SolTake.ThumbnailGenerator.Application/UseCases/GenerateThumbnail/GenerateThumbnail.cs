namespace SolTake.ThumbnailGenerator.Application.UseCases.GenerateThumbnail
{
    public record GenerateThumbnail(Guid Id, string ContainerName, string BlobName, double Resulation, bool IsSquare);
}
