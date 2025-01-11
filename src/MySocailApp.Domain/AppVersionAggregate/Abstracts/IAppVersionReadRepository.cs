using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;

namespace MySocailApp.Domain.AppVersionAggregate.Abstracts
{
    public interface IAppVersionReadRepository
    {
        Task<AppVersion?> GetLastVersionAsync(CancellationToken cancellationToken);
        Task<List<AppVersion>> GetAllVersions(CancellationToken cancellationToken);
        Task<bool> IsUpgradeRequiredAsync(VersionCode code, CancellationToken cancellationToken);
    }
}
