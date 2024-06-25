namespace MySocailApp.Core
{
    public class DomainEventsContainer : IDomainEventsContainer
    {
        private readonly List<IDomainEvent> _events = [];
        public IReadOnlyList<IDomainEvent> Events => _events;
        public void AddDomainEvent(IDomainEvent domainEvent) => _events.Add(domainEvent);
    }
}
