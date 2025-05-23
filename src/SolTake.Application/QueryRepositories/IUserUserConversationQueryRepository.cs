using MySocailApp.Application.Queries.UserUserConversation;
using SolTake.Core;

namespace SolTake.Application.QueryRepositories
{
    public interface IUserUserConversationQueryRepository
    {
        Task<List<UserUserConversationResponseDto>> GetAsync(int userId, IPage page, CancellationToken cancellationToken);
    }
}
