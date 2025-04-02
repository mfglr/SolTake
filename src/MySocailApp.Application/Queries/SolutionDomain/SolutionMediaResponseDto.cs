using MySocailApp.Core;

namespace MySocailApp.Application.Queries.SolutionDomain
{
    public record SolutionMediaResponseDto(int Id,string ContainerName, string BlobName, string? BlobNameOfFrame, long Size, double Height, double Width, double Duration, MultimediaType MultimediaType);
}
