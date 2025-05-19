using MediatR;

namespace SolTake.Core
{
    public interface IDomainEventConsumer<TDomainEvent> : INotificationHandler<TDomainEvent> where TDomainEvent : IDomainEvent;
}
