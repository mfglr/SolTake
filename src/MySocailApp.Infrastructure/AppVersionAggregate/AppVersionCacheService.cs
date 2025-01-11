using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.AppVersionAggregate.Entities;

namespace MySocailApp.Infrastructure.AppVersionAggregate
{
    public class AppVersionCacheService : IAppVersionCacheService
    {
        private readonly List<AppVersion> _versions = [];

        public AppVersion? Version => _versions.LastOrDefault();
        public void Init(IEnumerable<AppVersion> versions) => _versions.AddRange(versions);
        public void AddVersion(AppVersion version) => _versions.Add(version);
        public void RemoveLastVersion() => _versions.Remove(_versions.Last());
    }
}
