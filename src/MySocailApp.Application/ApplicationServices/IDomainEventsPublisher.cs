namespace MySocailApp.Application.ApplicationServices
{
    public interface IDomainEventsPublisher
    {
        Task PublishDomainEvents(CancellationToken cancellationToken);
    }
}
