using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class StoryQueryRepository(AppDbContext context) : IStoryQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<StoryResponseDto>> GetAllStoriesByUserId(int userId, IPage page, CancellationToken cancellationToken)
            => _context.Stories
                .AsNoTracking()
                .Where(story => story.UserId == userId)
                .ToPage(page)
                .ToStoryResponseSto(_context)
                .ToListAsync(cancellationToken);

        public Task<List<StoryResponseDto>> GetStoriesByUserId(int UserId, CancellationToken cancellationToken)
            => _context.Stories
                .AsNoTracking()
                .Where(
                    story =>
                        DateTime.UtcNow <= story.CreatedAt.AddDays(1) &&
                        (
                            story.UserId == UserId ||
                            _context.Follows.Any(follow => follow.FollowerId == UserId && follow.FollowedId == story.UserId)
                        )
                )
                .ToStoryResponseSto(_context)
                .ToListAsync(cancellationToken);
    }
}
