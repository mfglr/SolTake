using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainEvents
{
    public record QuestionLikedDomainEvent(QuestionUserLike Like, Login Login, int QuestionUserId) : IDomainEvent;
}
