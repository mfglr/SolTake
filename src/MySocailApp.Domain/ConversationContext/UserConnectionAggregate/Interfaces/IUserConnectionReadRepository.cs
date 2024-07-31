using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Entities;

namespace MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Interfaces
{
    public interface IUserConnectionReadRepository
    {
        Task<UserConnection?> GetById(int id, CancellationToken cancellationToken);
    }
}
