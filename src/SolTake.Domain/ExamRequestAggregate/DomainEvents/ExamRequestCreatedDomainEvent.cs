using SolTake.Core;
using SolTake.Domain.ExamRequestAggregate.Entities;

namespace SolTake.Domain.ExamRequestAggregate.DomainEvents
{
    public record ExamRequestCreatedDomainEvent(ExamRequest ExamRequest) : IDomainEvent;
}
