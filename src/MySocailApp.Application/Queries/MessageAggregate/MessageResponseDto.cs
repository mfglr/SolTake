using MySocailApp.Core;
using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;

namespace MySocailApp.Application.Queries.MessageAggregate
{
    public record MessageResponseDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, bool IsOwner, string UserName, int ConversationId, int SenderId, int ReceiverId, bool IsEdited, string? Content, MessageState State, IEnumerable<MessageMultimediaResponseDto> Medias, Multimedia? Image);
}
