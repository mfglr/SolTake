using MySocailApp.Domain.AccountDomain.RoleAggregate.Entities;

namespace MySocailApp.Domain.AccountDomain.RoleAggregate.Abstracts
{
    public interface IRoleReadRepository
    {
        Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
