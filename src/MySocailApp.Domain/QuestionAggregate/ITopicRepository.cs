using MySocailApp.Domain.TopicAggregate;

namespace MySocailApp.Domain.QuestionAggregate
{
    public interface ITopicRepository
    {
        Task<List<Topic>> GetTopicsAsync(IEnumerable<int> topicIds, CancellationToken cancellationToken);
    }
}
