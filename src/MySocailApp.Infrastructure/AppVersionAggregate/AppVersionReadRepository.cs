using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppVersionAggregate.Abstracts;
using MySocailApp.Domain.AppVersionAggregate.Entities;
using MySocailApp.Domain.AppVersionAggregate.ValuObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.AppVersionAggregate
{
    public class AppVersionReadRepository(AppDbContext context) : IAppVersionReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<AppVersion>> GetAllVersions(CancellationToken cancellationToken)
            => _context.AppVersions.ToListAsync(cancellationToken);

        public Task<AppVersion?> GetLastVersionAsync(CancellationToken cancellationToken)
            => _context.AppVersions.OrderByDescending(x => x.Id).FirstOrDefaultAsync(cancellationToken);

        public async Task<bool> IsUpgradeRequiredAsync(VersionCode code, CancellationToken cancellationToken)
        {
            var latestVersion = await GetLastVersionAsync(cancellationToken);
            return latestVersion?.UpgradeRequired(code) ?? false;
        }
    }
}
