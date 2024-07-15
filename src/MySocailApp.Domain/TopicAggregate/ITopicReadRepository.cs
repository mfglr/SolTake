namespace MySocailApp.Domain.TopicAggregate
{
    public interface ITopicReadRepository
    {
        Task<List<Topic>> GetBySubjectId(int subjectId,CancellationToken cancellationToken);
    }
}
