namespace MySocailApp.Domain.VersionAggregate.Abstracts
{
    public interface IVersionWriteRepository
    {
        Task<Entities.Version> GetLastVersionAsync(CancellationToken cancellationToken);
        Task CreateAsync(Entities.Version version,CancellationToken cancellationToken);
        void Delete(Entities.Version version);
    }
}
