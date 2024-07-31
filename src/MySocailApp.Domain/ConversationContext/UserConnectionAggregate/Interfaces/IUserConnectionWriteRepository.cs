using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Interfaces
{
    public interface IUserConnectionWriteRepository
    {
        Task CreateAsync(UserConnection userConnection, CancellationToken cancellationToken);
        Task<UserConnection?> GetByIdAsync(int id,CancellationToken cancellationToken);
    }
}
