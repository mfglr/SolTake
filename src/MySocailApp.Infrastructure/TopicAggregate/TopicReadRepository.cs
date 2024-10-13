using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.TopicAggregate.Entities;
using MySocailApp.Domain.TopicAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.TopicAggregate
{
    public class TopicReadRepository(AppDbContext context) : ITopicReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Topic?> GetTopicById(int topicId, CancellationToken cancellationToken)
            => _context.Topics
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == topicId, cancellationToken);

        public Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.Topics
                .AsNoTracking()
                .Where(x => ids.Contains(x.Id))
                .ToListAsync(cancellationToken);
    }
}
