using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.StoryDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
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
