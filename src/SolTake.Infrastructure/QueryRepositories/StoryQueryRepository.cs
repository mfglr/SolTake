using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.StoryDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class StoryQueryRepository(AppDbContext context) : IStoryQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<StoryResponseDto>> GetAllStoriesByUserId(int userId, int? forUserId, IPage page, CancellationToken cancellationToken)
            => _context.Stories
                .AsNoTracking()
                .Where(story => story.UserId == userId)
                .ToPage(page)
                .ToStoryResponseSto(forUserId, _context)
                .ToListAsync(cancellationToken);

        public Task<List<StoryResponseDto>> GetStoriesByUserId(int userId, int? forUserId, CancellationToken cancellationToken)
            => _context.Stories
                .AsNoTracking()
                .Where(
                    story =>
                        DateTime.UtcNow <= story.CreatedAt.AddDays(1) &&
                        (
                            story.UserId == userId ||
                            _context.UserUserFollows.Any(follow => follow.FollowerId == userId && follow.FollowedId == story.UserId)
                        )
                )
                .OrderByDescending(x => x.Id)
                .ToStoryResponseSto(forUserId, _context)
                .ToListAsync(cancellationToken);

        public Task<List<StoryResponseDto>> GetActiveStoriesByUserId(int userId, int? forUserId, CancellationToken cancellationToken)
            => _context.Stories
                .AsNoTracking()
                .Where(story => DateTime.UtcNow <= story.CreatedAt.AddDays(1) && story.UserId == userId)
                .ToStoryResponseSto(forUserId, _context)
                .ToListAsync(cancellationToken);
    }
}
