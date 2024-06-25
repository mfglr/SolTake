namespace MySocailApp.Application.Services
{
    public interface IDomainEventsPublisher
    {
        Task PublishDomainEvents(CancellationToken cancellationToken);
    }
}
