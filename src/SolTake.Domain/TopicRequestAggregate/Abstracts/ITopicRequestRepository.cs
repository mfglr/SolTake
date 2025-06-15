using SolTake.Domain.TopicRequestAggregate.Entities;

namespace SolTake.Domain.TopicRequestAggregate.Abstracts
{
    public interface ITopicRequestRepository
    {
        Task CreateAsync(TopicRequest topicRequest, CancellationToken cancellationToken);
        Task<TopicRequest?> GetByIdAsync(int id, CancellationToken cancellationToken);
    }
}
