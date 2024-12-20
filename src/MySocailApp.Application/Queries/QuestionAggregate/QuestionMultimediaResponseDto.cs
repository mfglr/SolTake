using MySocailApp.Core;

namespace MySocailApp.Application.Queries.QuestionAggregate
{
    public record QuestionMultimediaResponseDto(int Id, int QuestionId, string ContainerName, string BlobName, long Size, double Height, double Width, double Duration, MultimediaType MediaType);
}
