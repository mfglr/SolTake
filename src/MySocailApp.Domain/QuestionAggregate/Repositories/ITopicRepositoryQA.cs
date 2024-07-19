using MySocailApp.Domain.TopicAggregate;

namespace MySocailApp.Domain.QuestionAggregate.Repositories
{
    public interface ITopicRepositoryQA
    {
        Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids,CancellationToken cancellationToken);
    }
}
