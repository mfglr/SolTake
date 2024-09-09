using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.ValueObjects;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class MessageQueryableMappers
    {
        public static IQueryable<MessageResponseDto> ToMessageResponseDto(this IQueryable<Message> query,int accountId)
            => query
                .Select(
                    x => new MessageResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.UpdatedAt,
                        x.SenderId == accountId,
                        x.SenderId == accountId ? x.Receiver.Account.UserName! : x.Sender.Account.UserName!,
                        x.SenderId == accountId ? x.ReceiverId : x.SenderId,
                        x.SenderId,
                        x.ReceiverId,
                        x.IsEdited,
                        x.Content,
                        x.Viewers.Count != 0 ? MessageState.Viewed : x.Receivers.Count != 0 ? MessageState.Reached : MessageState.Created,
                        x.Images.Count
                    )
                );
    }
}
