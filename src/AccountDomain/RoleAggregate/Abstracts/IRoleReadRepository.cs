using AccountDomain.RoleAggregate.Entities;

namespace AccountDomain.RoleAggregate.Abstracts
{
    public interface IRoleReadRepository
    {
        Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
