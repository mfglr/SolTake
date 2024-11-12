using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Infrastructure.InfrastructureServices
{
    public class VersionCacheService : IVersionCacheService
    {
        private readonly List<Domain.VersionAggregate.Entities.Version> _versions = [];

        public Domain.VersionAggregate.Entities.Version Version => _versions.Last();
        public void Init(IEnumerable<Domain.VersionAggregate.Entities.Version> versions) => _versions.AddRange(versions);
        public void AddVersion(Domain.VersionAggregate.Entities.Version version) => _versions.Add(version);
        public void RemoveLastVersion() => _versions.Remove(_versions.Last());
    }
}
