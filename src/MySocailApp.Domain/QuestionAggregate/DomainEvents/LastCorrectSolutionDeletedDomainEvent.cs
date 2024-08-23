using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Domain.QuestionAggregate.DomainEvents
{
    public record LastCorrectSolutionDeletedDomainEvent(Question question) : IDomainEvent;
}
