using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.SubjectTopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.TopicDeletedDomainEventConsumers.SubjecTopicAggregate
{
    public class DeleteSubjectTopics(ISubjectTopicWriteRepository subjectTopicWriteRepository, IUnitOfWork unitOfWork) : IDomainEventConsumer<TopicDeletedDomainEvent>
    {
        private readonly ISubjectTopicWriteRepository _subjectTopicWriteRepository = subjectTopicWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(TopicDeletedDomainEvent notification, CancellationToken cancellationToken)
        {
            var subjectTopics = await _subjectTopicWriteRepository.GetByTopicIdAsync(notification.Topic.Id, cancellationToken);
            _subjectTopicWriteRepository.DeleteRange(subjectTopics);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
