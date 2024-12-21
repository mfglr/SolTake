using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.DomainEvents
{
    public record QuestionDeletedDomainEvent(Question Question) : IDomainEvent;
}
