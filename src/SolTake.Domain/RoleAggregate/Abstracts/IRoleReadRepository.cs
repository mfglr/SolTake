using SolTake.Domain.RoleAggregate.Entities;

namespace SolTake.Domain.RoleAggregate.Abstracts
{
    public interface IRoleReadRepository
    {
        Task<List<Role>> GetRolesByIdsAsync(IEnumerable<int> ids, CancellationToken cancellationToken);
    }
}
