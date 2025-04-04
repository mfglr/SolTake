using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class StoryQueryRepository(AppDbContext context) : IStoryQueryRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<StoryResponseDto>> GetStoriesByUserId(int UserId, IPage page, CancellationToken cancellationToken)
        {

            var stories = await _context.Stories
                    .AsNoTracking()
                    .Where(
                        x =>
                            x.UserId != UserId &&
                            DateTime.UtcNow <= x.CreatedAt.AddDays(1) &&
                            _context.Follows.Any(follow => follow.FollowerId == UserId && follow.FollowedId == x.UserId)
                    )
                    .ToStoryResponseSto(_context)
                    .ToListAsync(cancellationToken);
            
            if(page.IsDescending)
                return stories
                    .GroupBy(x => x.UserId)
                    .Where(x => page.Offset == null || x.OrderBy(x => x.Id).Last().Id < page.Offset)
                    .OrderByDescending(x => x.OrderBy(x => x.Id).Last().Id)
                    .Take(page.Take)
                    .Select(x => x.OrderBy(x => x.Id).Last())
                    .ToList();

            return stories
                .GroupBy(x => x.UserId)
                .Where(x => page.Offset == null || x.OrderBy(x => x.Id).Last().Id > page.Offset)
                .OrderBy(x => x.OrderBy(x => x.Id).Last().Id)
                .Take(page.Take)
                .Select(x => x.OrderBy(x => x.Id).Last())
                .ToList();
        }
                
                
                
                
                
                
    }
}
