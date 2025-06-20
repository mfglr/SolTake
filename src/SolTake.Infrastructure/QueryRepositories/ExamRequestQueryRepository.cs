using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.ExamRequestAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Domain.ExamRequestAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class ExamRequestQueryRepository(AppDbContext context) : IExamRequestQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<ExamRequestResponseDto>> GetExamRequestsByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken)
            => _context.ExamRequests
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .ToPage(page)
                .ToExamRequestResponseDto()
                .ToListAsync(cancellationToken);

        public Task<List<ExamRequestResponseDto>> GetPendingExamRequestsAsync(IPage page, CancellationToken cancellationToken)
            => _context.ExamRequests
                .AsNoTracking()
                .Where(x => x.State == ExamRequestState.Pending)
                .ToPage(page)
                .ToExamRequestResponseDto()
                .ToListAsync(cancellationToken);
    }
}
