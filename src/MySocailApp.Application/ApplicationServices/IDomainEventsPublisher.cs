namespace MySocailApp.Application.ApplicationServices
{
    public interface IDomainEventsPublisher
    {
        void PublishDomainEvents(CancellationToken cancellationToken);
    }
}
