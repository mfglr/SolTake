using MySocailApp.Core;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.DomainEvents;

namespace MySocailApp.Application.Queries.QuestionDomain
{
    public record QuestionUserLikeResponseDto(int Id, int UserId,string UserName, string? Name, Multimedia? Image)
    {
        public static QuestionUserLikeResponseDto Create(QuestionLikedNotificationCreatedDomainEvent @event) =>
            new(
                @event.Like.Id,
                @event.Like.UserId,
                @event.Login.UserName,
                @event.Login.Name,
                @event.Login.Image
            );
    }
}
