using MySocailApp.Domain.UserConnectionAggregate.Entities;

namespace MySocailApp.Domain.UserConnectionAggregate.Interfaces
{
    public interface IUserConnectionReadRepository
    {
        Task<UserConnection?> GetById(int id, CancellationToken cancellationToken);
    }
}
