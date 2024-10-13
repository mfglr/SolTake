using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Domain.TopicAggregate.Interfaces
{
    public interface ITopicReadRepository
    {
        Task<Topic?> GetTopicById(int topicId, CancellationToken cancellationToken);
        Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
