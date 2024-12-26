using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageAggregate
{
    public record MessageMultimediaResponseDto(string ContainerName, string BlobName, string? BlobNameOfFrame, long Size, double Height, double Width, double Duration, MultimediaType MultimediaType);
}
