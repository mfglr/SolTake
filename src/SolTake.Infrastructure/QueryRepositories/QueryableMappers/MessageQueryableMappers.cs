using SolTake.Application.Queries.MessageDomain;
using SolTake.Infrastructure.DbContexts;
using SolTake.Domain.MessageAggregate.Entities;
using SolTake.Domain.MessageAggregate.ValueObjects;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class MessageQueryableMappers
    {
        public static IQueryable<MessageResponseDto> ToMessageResponseDto(this IQueryable<Message> query, AppDbContext context, int userId)
            => query
                .Join(
                    context.Users,
                    message => message.SenderId == userId ? message.ReceiverId : message.SenderId,
                    user => user.Id,
                    (message, user) => new MessageResponseDto(
                        message.Id,
                        message.CreatedAt,
                        message.UpdatedAt,
                        message.SenderId == userId,
                        user.UserName.Value,
                        user.Id,
                        message.SenderId,
                        message.ReceiverId,
                        message.IsEdited,
                        message.Content.Value,
                        context.MessageUserViews.Count(muv => muv.MessageId == message.Id) != 0
                            ? MessageState.Viewed
                            : context.MessageUserReceives.Count(mur => mur.MessageId == message.Id) != 0
                                ? MessageState.Reached
                                : MessageState.Created,
                        message.Medias,
                        user.Image
                    )
                );
    }
}
