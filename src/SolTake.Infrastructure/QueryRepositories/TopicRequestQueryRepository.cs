using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.TopicRequestAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Domain.TopicRequestAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class TopicRequestQueryRepository(AppDbContext context) : ITopicRequestQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<TopicRequestResponseDto>> GetAllTopicRequestsAsync(IPage page, CancellationToken cancellationToken)
            => _context.TopicRequests
                .AsNoTracking()
                .ToPage(page)
                .ToTopicRequestResponseDto(_context)
                .ToListAsync(cancellationToken);

        public Task<List<TopicRequestResponseDto>> GetPendingRequestsAsync(IPage page, CancellationToken cancellationToken)
            => _context.TopicRequests
                .AsNoTracking()
                .Where(x => x.State == TopicRequestState.Pending)
                .ToPage(page)
                .ToTopicRequestResponseDto(_context)
                .ToListAsync(cancellationToken);

        public Task<List<TopicRequestResponseDto>> GetTopicRequestsByUserIdAsync(int userId, IPage page, CancellationToken cancellationToken)
            => _context.TopicRequests
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .ToPage(page)
                .ToTopicRequestResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
