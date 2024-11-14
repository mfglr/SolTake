using MySocailApp.Domain.AppVersionAggregate.Entities;

namespace MySocailApp.Domain.AppVersionAggregate.Abstracts
{
    public interface IAppVersionWriteRepository
    {
        Task<AppVersion> GetLastVersionAsync(CancellationToken cancellationToken);
        Task CreateAsync(AppVersion version, CancellationToken cancellationToken);
        void Delete(AppVersion version);
    }
}
