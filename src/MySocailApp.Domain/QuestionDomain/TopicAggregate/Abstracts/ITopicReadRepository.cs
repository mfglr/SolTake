using MySocailApp.Domain.QuestionDomain.TopicAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.TopicAggregate.Abstracts
{
    public interface ITopicReadRepository
    {
        Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids, CancellationToken cancellationToken);
        Task<Topic?> GetTopicById(int id, CancellationToken cancellationToken);
    }
}
