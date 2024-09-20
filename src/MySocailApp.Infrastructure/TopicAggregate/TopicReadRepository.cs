using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.TopicAggregate.Entities;
using MySocailApp.Domain.TopicAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.TopicAggregate
{
    public class TopicReadRepository(AppDbContext context) : ITopicReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => await _context.Topics.Where(x => ids.Contains(x.Id)).ToListAsync(cancellationToken);
    }
}
