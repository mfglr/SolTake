namespace SolTake.Core.Events.MediaEvents
{
    public record ThumbnailGenerated(Guid Id, string BlobName, double Resulation, bool IsSquare);
}
