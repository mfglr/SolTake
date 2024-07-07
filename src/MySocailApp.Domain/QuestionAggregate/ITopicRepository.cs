namespace MySocailApp.Domain.QuestionAggregate
{
    public interface ITopicRepository
    {
        Task<bool> IsTopicsAvailableAsync(IEnumerable<int> topicIds, CancellationToken cancellationToken);
    }
}
