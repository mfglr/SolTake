using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Abstracts;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.StoryDomain.StoryAggregate
{
    public class StoryWriteRepository(AppDbContext context) : IStoryWriteRepository
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

        public Task<Story?> GetByIdAsync(int storyId, CancellationToken cancellationToken)
            => _context.Stories.FirstOrDefaultAsync(x => x.Id == storyId, cancellationToken);
        public Task<List<Story>> GetByUserId(int userId, CancellationToken cancellationToken)
            => _context.Stories.Where(x => x.UserId == userId).ToListAsync(cancellationToken);
    }
}
