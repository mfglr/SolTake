namespace MySocailApp.Application.InfrastructureServices
{
    public interface IDomainEventsPublisher
    {
        Task PublishDomainEvents(CancellationToken cancellationToken);
    }
}
