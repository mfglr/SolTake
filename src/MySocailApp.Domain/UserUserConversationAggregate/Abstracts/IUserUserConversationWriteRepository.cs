using MySocailApp.Domain.UserUserConversationAggregate.Entities;

namespace MySocailApp.Domain.UserUserConversationAggregate.Abstracts
{
    public interface IUserUserConversationWriteRepository
    {
        Task<UserUserConversation?> GetAsync(int converserId, int listenerId, CancellationToken cancellationToken);
        Task CreateAsync(UserUserConversation userUserConversation, CancellationToken cancellationToken);
        void Delete(UserUserConversation userUserConversation);
        void DeleteRange(IEnumerable<UserUserConversation> conversations);
    }
}
