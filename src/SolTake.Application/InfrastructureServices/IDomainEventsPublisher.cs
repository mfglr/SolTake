namespace SolTake.Application.InfrastructureServices
{
    public interface IDomainEventsPublisher
    {
        Task PublishDomainEvents(CancellationToken cancellationToken);
    }
}
