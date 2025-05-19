﻿namespace SolTake.Core
{
    public interface IDomainEventsContainer
    {
        IReadOnlyList<IDomainEvent> Events { get; }
        void AddDomainEvent(IDomainEvent domainEvent);
        void ClearEvents();
    }
}
