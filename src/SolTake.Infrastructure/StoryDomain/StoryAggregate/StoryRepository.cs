using Microsoft.EntityFrameworkCore;
using SolTake.Domain.StoryAggregate.Abstracts;
using SolTake.Domain.StoryAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.StoryDomain.StoryAggregate
{
    public class StoryRepository(AppDbContext context) : IStoryRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Story story, CancellationToken cancellationToken)
            => await _context.Stories.AddAsync(story, cancellationToken);
        public async Task CreateRangeAsync(IEnumerable<Story> stories, CancellationToken cancellationToken)
            => await _context.Stories.AddRangeAsync(stories,cancellationToken);
        public void Delete(Story story)
            => _context.Stories.Remove(story);
        public void DeleteRange(IEnumerable<Story> stories)
            => _context.Stories.RemoveRange(stories);

        public Task<Story?> GetAsNoTrackingAsync(int storyId, CancellationToken cancellationToken)
            => _context.Stories.AsNoTracking().FirstOrDefaultAsync(x => x.Id == storyId, cancellationToken);
        public Task<Story?> GetByIdAsync(int storyId, CancellationToken cancellationToken)
            => _context.Stories.FirstOrDefaultAsync(x => x.Id == storyId, cancellationToken);
        public Task<List<Story>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.Stories.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
