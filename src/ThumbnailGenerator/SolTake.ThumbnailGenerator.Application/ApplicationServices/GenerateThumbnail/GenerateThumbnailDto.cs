namespace SolTake.ThumbnailGenerator.Application.ApplicationServices.GenerateThumbnail
{
    public record GenerateThumbnailDto(string ContainerName, string BlobName, double Resulation, bool IsSquare);
}
