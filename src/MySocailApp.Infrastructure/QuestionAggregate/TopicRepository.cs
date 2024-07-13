using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.TopicAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class TopicRepository(AppDbContext context) : ITopicRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Topic>> GetTopicsAsync(IEnumerable<int> topicIds, CancellationToken cancellationToken)
        {
            return await _context
                .Topics
                .Where(x => topicIds.Contains(x.Id))
                .ToListAsync(cancellationToken);
        }
    }
}
