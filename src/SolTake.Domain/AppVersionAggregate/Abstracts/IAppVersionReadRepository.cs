using SolTake.Domain.AppVersionAggregate.Entities;
using SolTake.Domain.AppVersionAggregate.ValuObjects;

namespace SolTake.Domain.AppVersionAggregate.Abstracts
{
    public interface IAppVersionReadRepository
    {
        Task<AppVersion?> GetLastVersionAsync(CancellationToken cancellationToken);
        Task<List<AppVersion>> GetAllVersions(CancellationToken cancellationToken);
        Task<bool> IsUpgradeRequiredAsync(VersionCode code, CancellationToken cancellationToken);
    }
}
