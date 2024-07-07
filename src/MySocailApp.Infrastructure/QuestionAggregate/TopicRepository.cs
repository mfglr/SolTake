using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class TopicRepository(AppDbContext context) : ITopicRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> IsTopicsAvailableAsync(IEnumerable<int> topicIds, CancellationToken cancellationToken)
        {
            var count = await _context.Topics.Where(x => topicIds.Contains(x.Id)).CountAsync(cancellationToken);
            return count == topicIds.Count();
        }
    }
}
