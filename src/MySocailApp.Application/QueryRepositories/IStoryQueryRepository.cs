using MySocailApp.Application.Queries.StoryDomain;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IStoryQueryRepository
    {
        Task<List<StoryResponseDto>> GetStoriesByUserId(int UserId, CancellationToken cancellationToken);
    }
}
