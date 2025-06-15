using SolTake.Core;
using SolTake.Domain.ExamAggregate.Entitities;
using SolTake.Domain.ExamRequestAggregate.Entities;

namespace SolTake.Domain.ExamAggregate.DomainEvents
{
    public record ExamCreatedDomainEvent(ExamRequest ExamRequest, Exam Exam) : IDomainEvent;
}
