using MySocailApp.Core;

namespace MySocailApp.Application.Queries.MessageAggregate
{
    public record MessageMultimediaResponseDto(int Id, int MessageId, string ContainerName, string BlobName, long Size, double Height, double Width, double Duration, MultimediaType MultimediaType);
}
