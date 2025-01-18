using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class MessageQueryableMappers
    {
        public static IQueryable<MessageResponseDto> ToMessageResponseDto(this IQueryable<Message> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    message => message.SenderId == accountId ? message.ReceiverId : message.SenderId,
                    user => user.Id,
                    (message, user) => new { message, user }
                )
                .Join(
                    context.Accounts,
                    join => join.message.SenderId == accountId ? join.message.ReceiverId : join.message.SenderId,
                    account => account.Id,
                    (join, account) => new MessageResponseDto(
                        join.message.Id,
                        join.message.CreatedAt,
                        join.message.UpdatedAt,
                        join.message.SenderId == accountId,
                        account.UserName.Value,
                        account.Id,
                        join.message.SenderId,
                        join.message.ReceiverId,
                        join.message.IsEdited,
                        join.message.Content.Value,
                        join.message.Viewers.Count != 0
                            ? MessageState.Viewed
                            : join.message.Receivers.Count != 0
                                ? MessageState.Reached
                                : MessageState.Created,
                        join.message.Medias.Select(
                            media => new MessageMultimediaResponseDto(
                                media.ContainerName,
                                media.BlobName,
                                media.BlobNameOfFrame,
                                media.Size,
                                media.Height,
                                media.Width,
                                media.Duration,
                                media.MultimediaType
                            )
                        ),
                        join.user.Image
                    )
                );
    }
}
