using MySocailApp.Domain.TopicAggregate.Entities;

namespace MySocailApp.Domain.TopicAggregate.Abstracts
{
    public interface ITopicReadRepository
    {
        Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids, CancellationToken cancellationToken);
        Task<Topic?> GetTopicById(int id, CancellationToken cancellationToken);
    }
}
