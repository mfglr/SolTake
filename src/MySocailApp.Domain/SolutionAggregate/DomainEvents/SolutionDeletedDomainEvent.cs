using MySocailApp.Core;

namespace MySocailApp.Domain.SolutionAggregate.DomainEvents
{
    public record SolutionDeletedDomainEvent(int SolutionId) : IDomainEvent;
}
