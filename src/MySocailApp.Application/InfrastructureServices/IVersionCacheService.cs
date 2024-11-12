namespace MySocailApp.Application.InfrastructureServices
{
    public interface IVersionCacheService
    {
        Domain.VersionAggregate.Entities.Version Version { get; }
        void Init(IEnumerable<Domain.VersionAggregate.Entities.Version> versions);
        void AddVersion(Domain.VersionAggregate.Entities.Version version);
        void RemoveLastVersion();
    }
}
