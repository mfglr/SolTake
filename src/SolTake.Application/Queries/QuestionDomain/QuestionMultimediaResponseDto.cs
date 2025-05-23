using SolTake.Core;

namespace SolTake.Application.Queries.QuestionDomain
{
    public record QuestionMultimediaResponseDto(int Id, string ContainerName, string BlobName, string? BlobNameOfFrame, long Size, double Height, double Width, double Duration, MultimediaType MultimediaType);
}
