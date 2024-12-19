using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public record SolutionMediaResponseDto(int Id, int SolutionId, string BlobName, long size, double Height, double Width, double Duration, MultimediaType MediaType);
}
