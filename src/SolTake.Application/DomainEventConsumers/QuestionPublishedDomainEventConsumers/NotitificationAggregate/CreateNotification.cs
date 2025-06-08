using SolTake.Core;
using SolTake.Domain.QuestionAggregate.DomainEvents;

namespace SolTake.Application.DomainEventConsumers.QuestionPublishedDomainEventConsumers.NotitificationAggregate
{
    public class CreateNotification : IDomainEventConsumer<QuestionPublishedDomainEvent>
    {
        public Task Handle(QuestionPublishedDomainEvent notification, CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
