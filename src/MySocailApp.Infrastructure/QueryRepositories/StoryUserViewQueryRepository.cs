using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class StoryUserViewQueryRepository(AppDbContext context) : IStoryUserViewQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<StoryUserViewResponseDto>> GetStoryUserViewsByStoryId(int storyId, IPage page, CancellationToken cancellationToken)
            => _context.StoryUserViews
                .AsNoTracking()
                .Where(x => x.StoryId == storyId)
                .ToPage(page)
                .ToStoryUserViewResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
