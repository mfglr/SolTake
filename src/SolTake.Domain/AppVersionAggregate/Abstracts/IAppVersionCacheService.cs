using SolTake.Domain.AppVersionAggregate.Entities;

namespace SolTake.Domain.AppVersionAggregate.Abstracts
{
    public interface IAppVersionCacheService
    {
        AppVersion? Version { get; }
        void Init(IEnumerable<AppVersion> versions);
        void AddVersion(AppVersion version);
        void RemoveLastVersion();
    }
}
