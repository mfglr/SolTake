using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Domain.MessageDomain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class MessageQueryableMappers
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
                        message.Viewers.Count != 0
                            ? MessageState.Viewed
                            : context.MessageUserReceives.Count() != 0
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
                        ),
                        user.Image
                    )
                );
    }
}
