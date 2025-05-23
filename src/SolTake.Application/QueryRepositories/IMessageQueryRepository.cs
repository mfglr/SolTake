using SolTake.Application.Queries.MessageDomain;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IMessageQueryRepository
    {
        Task<MessageResponseDto?> GetMessageByIdAsync(int accountId, int messageId, CancellationToken cancellationToken);
        Task<List<MessageResponseDto>> GetMessagesByUserIdAsync(int accountId, int userId, IPage page, CancellationToken cancellationToken);
        Task<List<MessageResponseDto>> GetUnviewedMessagesAsync(int accountId, CancellationToken cancellationToken);
        Task<IEnumerable<MessageResponseDto>> GetConversationsAsync(int accountId, CancellationToken cancellationToken);
    }
}
