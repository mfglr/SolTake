using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Domain.QuestionUserLikeAggregate.Entities;
using SolTake.Core;

namespace SolTake.Domain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionLikedDomainEvent(Question Question, QuestionUserLike Like, Login Login) : IDomainEvent;
}
