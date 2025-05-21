using SolTake.Domain.UserUserConversationAggregate.Entities;

namespace SolTake.Domain.UserUserConversationAggregate.Abstracts
{
    public interface IUserUserConversationWriteRepository
    {
        Task<UserUserConversation?> GetAsync(int converserId, int listenerId, CancellationToken cancellationToken);
        Task<List<UserUserConversation>> GetListAsync(int userId0, int userId1, CancellationToken cancellationToken);

        Task CreateAsync(UserUserConversation userUserConversation, CancellationToken cancellationToken);
        void Delete(UserUserConversation userUserConversation);
        void DeleteRange(IEnumerable<UserUserConversation> conversations);
    }
}
