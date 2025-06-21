using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.SubjectRequestAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Domain.SubjectRequestAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class SubjectRequestQueryRepository(AppDbContext context) : ISubjectRequestQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<SubjectRequestResponseDto>> GetByUserId(int userId, IPage page, CancellationToken cancellationToken)
            => _context.SubjectRequests
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .ToPage(page)
                .ToSubjectRequestResponseDto(_context)
                .ToListAsync(cancellationToken);

        public Task<List<SubjectRequestResponseDto>> GetPendingsAsync(IPage page, CancellationToken cancellationToken)
            => _context.SubjectRequests
                .AsNoTracking()
                .Where(x => x.State == SubjectRequestState.Pending)
                .ToPage(page)
                .ToSubjectRequestResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
