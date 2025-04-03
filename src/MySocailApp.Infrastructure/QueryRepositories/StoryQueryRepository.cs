using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class StoryQueryRepository(AppDbContext context) : IStoryQueryRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<StoryResponseDto>> GetStoriesByUserId(int UserId, CancellationToken cancellationToken)
            =>
                (
                    await _context.Stories
                        .AsNoTracking()
                        .Where(
                            x =>
                                _context.Follows.Any(follow => follow.FollowerId == UserId) &&
                                DateTime.UtcNow <= x.CreatedAt.AddDays(1)
                        )
                        .ToStoryResponseSto(_context)
                        .ToListAsync(cancellationToken)
                )
                .GroupBy(x => x.UserId)
                .OrderByDescending(x => x.OrderBy(x => x.Id).Last().Id)
                .Select(x => x.OrderBy(x => x.Id).Last())
                .ToList();
                
                
                
                
                
    }
}
