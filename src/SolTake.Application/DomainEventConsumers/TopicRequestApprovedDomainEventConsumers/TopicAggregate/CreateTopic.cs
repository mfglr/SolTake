using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Core;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.DomainEvents;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Domain.TopicRequestAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.TopicRequestApprovedDomainEventConsumers.TopicAggregate
{
    public class CreateTopic(ITopicWriteRepository topicWriteRepository, IUnitOfWork unitOfWork,IPublisher publisher) : IDomainEventConsumer<TopicRequestApprovedDomainEvent>
    {
        private readonly ITopicWriteRepository _topicWriteRepository = topicWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(TopicRequestApprovedDomainEvent notification, CancellationToken cancellationToken)
        {
            var topic = new Topic(notification.TopicRequest.Name.Value);
            topic.Create();
            await _topicWriteRepository.CreateAsync(topic, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await _publisher.Publish(new TopicCreatedDomainEvent(notification.TopicRequest, topic),cancellationToken);
        }
    }
}
