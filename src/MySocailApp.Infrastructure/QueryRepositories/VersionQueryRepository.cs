using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.VersionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class VersionQueryRepository(AppDbContext context) : IVersionQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<VersionResponseDto> GetLatestVersionAsync(CancellationToken cancellationToken)
            => _context.Versions
                .OrderBy(x => x.Id)
                .ToVersionResponseDto()
                .LastAsync(cancellationToken);
    }
}
