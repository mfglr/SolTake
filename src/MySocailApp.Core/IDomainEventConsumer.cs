using MediatR;

namespace MySocailApp.Core
{
    public interface IDomainEventConsumer<TDomainEvent> : INotificationHandler<TDomainEvent> where TDomainEvent : IDomainEvent;
}
