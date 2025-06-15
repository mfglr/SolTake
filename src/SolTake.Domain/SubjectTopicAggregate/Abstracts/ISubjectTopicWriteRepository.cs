using SolTake.Domain.SubjectTopicAggregate.Entities;
using SolTake.Domain.TopicAggregate.Entities;

namespace SolTake.Domain.SubjectTopicAggregate.Abstracts
{
    public interface ISubjectTopicWriteRepository
    {
        Task CreateAsync(SubjectTopic subjectTopic, CancellationToken cancellationToken);
        Task<List<SubjectTopic>> GetByTopicIdAsync(int topicId,CancellationToken cancellationToken);
        void DeleteRange(List<SubjectTopic> topics);
    }
}
