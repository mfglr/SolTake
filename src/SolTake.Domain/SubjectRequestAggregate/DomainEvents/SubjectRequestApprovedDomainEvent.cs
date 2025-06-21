using SolTake.Core;
using SolTake.Domain.SubjectRequestAggregate.Entities;

namespace SolTake.Domain.SubjectRequestAggregate.DomainEvents
{
    public record SubjectRequestApprovedDomainEvent(SubjectRequest SubjectRequest) : IDomainEvent;
}
