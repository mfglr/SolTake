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
                    message => message.ReceiverId,
                    account => account.Id,
                    (message,account) => new { message, ReceiverUserName = account.UserName }
                )
                .Join(
                    context.Accounts,
                    join => join.message.SenderId,
                    account => account.Id,
                    (join,account) => new MessageResponseDto(
                        join.message.Id,
                        join.message.CreatedAt,
                        join.message.UpdatedAt,
                        join.message.SenderId == accountId,
                        join.message.SenderId == accountId ? join.ReceiverUserName.Value : account.UserName.Value,
                        join.message.SenderId == accountId ? join.message.ReceiverId : join.message.SenderId,
                        join.message.SenderId,
                        join.message.ReceiverId,
                        join.message.IsEdited,
                        join.message.Content.Value,
                        join.message.Viewers.Count != 0
                            ? MessageState.Viewed 
                            : join.message.Receivers.Count != 0 
                                ? MessageState.Reached 
                                : MessageState.Created,
                        join.message.Medias.Count
                    )
                );
    }
}
