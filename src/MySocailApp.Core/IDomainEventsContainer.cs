namespace MySocailApp.Core
{
    public interface IDomainEventsContainer
    {
        IReadOnlyList<IDomainEvent> Events { get; }
        void AddDomainEvent(IDomainEvent domainEvent);
    }
}
