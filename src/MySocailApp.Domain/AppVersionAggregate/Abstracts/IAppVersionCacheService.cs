using MySocailApp.Domain.AppVersionAggregate.Entities;

namespace MySocailApp.Domain.AppVersionAggregate.Abstracts
{
    public interface IAppVersionCacheService
    {
        AppVersion Version { get; }
        void Init(IEnumerable<AppVersion> versions);
        void AddVersion(AppVersion version);
        void RemoveLastVersion();
    }
}
