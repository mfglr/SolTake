using MySocailApp.Application.Queries.VersionAggregate;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IVersionQueryRepository
    {
        Task<VersionResponseDto> GetLatestVersionAsync(CancellationToken cancellationToken);
    }
}
