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
                    context.Accounts,
                    message => message.SenderId == accountId ? message.ReceiverId : message.SenderId,
                    account => account.Id,
                    (message, account) => new MessageResponseDto(
                        message.Id,
                        message.CreatedAt,
                        message.UpdatedAt,
                        message.SenderId == accountId,
                        account.UserName.Value,
                        account.Id,
                        message.SenderId,
                        message.ReceiverId,
                        message.IsEdited,
                        message.Content.Value,
                        message.Viewers.Count != 0
                            ? MessageState.Viewed
                            : message.Receivers.Count != 0
                                ? MessageState.Reached
                                : MessageState.Created,
                        message.Medias.Select(
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
                        )
                    )
                );
    }
}
