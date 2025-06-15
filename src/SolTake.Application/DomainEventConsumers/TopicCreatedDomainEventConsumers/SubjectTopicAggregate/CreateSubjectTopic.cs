using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.SubjectTopicAggregate.Abstracts;
using SolTake.Domain.SubjectTopicAggregate.DomainEvents;
using SolTake.Domain.SubjectTopicAggregate.Entities;
using SolTake.Domain.TopicAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.TopicCreatedDomainEventConsumers.SubjectTopicAggregate
{
    public class CreateSubjectTopic(ISubjectTopicWriteRepository subjectTopicWriteRepository, IUnitOfWork unitOfWork, IPublisher publisher) : IDomainEventConsumer<TopicCreatedDomainEvent>
    {
        private readonly ISubjectTopicWriteRepository _subjectTopicWriteRepository = subjectTopicWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(TopicCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var subjectTopic = new SubjectTopic(notification.Topic.Id, notification.TopicRequest.SubjectId);
            subjectTopic.Create();
            await _subjectTopicWriteRepository.CreateAsync(subjectTopic, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new SubjectTopicCreatedDomainEvent(notification.TopicRequest, notification.Topic, subjectTopic),cancellationToken);
        }
    }
}
