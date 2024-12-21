using MySocailApp.Application.Queries.MessageAggregate;
using MySocailApp.Core;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IMessageQueryRepository
    {
        Task<MessageResponseDto?> GetMessageByIdAsync(int accountId, int messageId, CancellationToken cancellationToken);
        Task<List<MessageResponseDto>> GetMessagesByUserIdAsync(int accountId, int userId, IPage page, CancellationToken cancellationToken);
        Task<List<MessageResponseDto>> GetConversationsAsync(int accountId, IPage page, CancellationToken cancellationToken);
        Task<List<MessageResponseDto>> GetUnviewedMessagesAsync(int accountId, CancellationToken cancellationToken);
    }
}
