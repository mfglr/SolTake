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

        public Task<List<StoryResponseDto>> GetAllStoriesByUserId(int userId, int forUserId, IPage page, CancellationToken cancellationToken)
            => _context.Stories
                .AsNoTracking()
                .Where(story => story.UserId == userId)
                .ToPage(page)
                .ToStoryResponseSto(forUserId, _context)
                .ToListAsync(cancellationToken);

        public Task<List<StoryResponseDto>> GetStoriesByUserId(int userId, int forUserId, CancellationToken cancellationToken)
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
    }
}
