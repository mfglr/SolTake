namespace MySocailApp.Domain.VersionAggregate.Abstracts
{
    public interface IVersionReadRepository
    {
        Task<Entities.Version> GetLastVersionAsync(CancellationToken cancellationToken);
        Task<List<Entities.Version>> GetAllVersions(CancellationToken cancellationToken);
    }
}
