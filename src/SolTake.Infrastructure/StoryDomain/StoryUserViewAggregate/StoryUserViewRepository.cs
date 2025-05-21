using Microsoft.EntityFrameworkCore;
using SolTake.Domain.StoryUserViewAggregate.Absracts;
using SolTake.Domain.StoryUserViewAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.StoryDomain.StoryUserViewAggregate
{
    public class StoryUserViewRepository(AppDbContext context) : IStoryUserViewRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(StoryUserView storyUserView, CancellationToken cancellationToken)
            => await _context.StoryUserViews.AddAsync(storyUserView, cancellationToken);

        public void Delete(StoryUserView storyUserView)
            => _context.StoryUserViews.Remove(storyUserView);

        public void DeleteRange(IEnumerable<StoryUserView> storyUserViews)
            => _context.StoryUserViews.RemoveRange(storyUserViews);

        public Task<bool> ExistAsync(int storyId, int userId, CancellationToken cancellationToken)
            => _context.StoryUserViews.AnyAsync(x => x.StoryId == storyId && x.UserId == userId, cancellationToken);

        public Task<List<StoryUserView>> GetByStoryId(int storyId, CancellationToken cancellationToken)
            => _context.StoryUserViews.Where(x => x.StoryId == storyId).ToListAsync(cancellationToken);

        public Task<List<StoryUserView>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.StoryUserViews.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
