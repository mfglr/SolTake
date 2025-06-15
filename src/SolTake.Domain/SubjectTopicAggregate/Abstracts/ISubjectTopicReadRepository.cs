namespace SolTake.Domain.SubjectTopicAggregate.Abstracts
{
    public interface ISubjectTopicReadRepository
    {
        Task<bool> ExistAsync(int subjectId, int topicId, CancellationToken cancellationToken);
    }
}
