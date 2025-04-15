using MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Entities;

namespace MySocailApp.Domain.UserDomain.UserUserBlockAggregate.Abstracts
{
    public interface IUserUserBlockRepository
    {
        Task<bool> ExistAsync(int blockerId, int blockedId, CancellationToken cancellationToken);
        Task CreateAsync(UserUserBlock userUserblock, CancellationToken cancellationToken);
        Task<UserUserBlock?> GetAsync(int blockerId, int blockedId, CancellationToken cancellationToken);
        void Delete(UserUserBlock UserUserBlock);
    }
}
