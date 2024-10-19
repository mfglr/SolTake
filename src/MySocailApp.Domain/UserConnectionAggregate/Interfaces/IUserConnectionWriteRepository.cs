using MySocailApp.Domain.UserConnectionAggregate.Entities;

namespace MySocailApp.Domain.UserConnectionAggregate.Interfaces
{
    public interface IUserConnectionWriteRepository
    {
        Task CreateAsync(UserConnection userConnection, CancellationToken cancellationToken);
        Task<UserConnection?> GetByIdAsync(int id, CancellationToken cancellationToken);
        void Delete(UserConnection userConnection);
    }
}
