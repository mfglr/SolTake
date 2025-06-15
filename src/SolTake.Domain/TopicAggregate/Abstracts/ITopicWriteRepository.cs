using SolTake.Domain.TopicAggregate.Entities;

namespace SolTake.Domain.TopicAggregate.Abstracts
{
    public interface ITopicWriteRepository
    {
        Task<Topic?> GetByIdAsync(int topicId, CancellationToken cancellationToken);
        Task CreateAsync(Topic topic,CancellationToken cancellationToken);
        void Delete(Topic topic);
    }
}
