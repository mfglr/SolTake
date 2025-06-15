using SolTake.Application.Queries.TopicRequestAggregate;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface ITopicRequestQueryRepository
    {
        Task<List<TopicRequestResponseDto>> GetAllTopicRequestsAsync(IPage page,CancellationToken cancellationToken);
        Task<List<TopicRequestResponseDto>> GetPendingRequestsAsync(IPage page, CancellationToken cancellationToken);
        Task<List<TopicRequestResponseDto>> GetTopicRequestsByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken);
    }
}
