using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Repositories;
using MySocailApp.Domain.TopicAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class TopicRepositoryQA(AppDbContext context) : ITopicRepositoryQA
    {
        private readonly AppDbContext _context = context;

        public async Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids,CancellationToken cancellationToken)
            => await _context.Topics.Where(x => ids.Contains(x.Id)).ToListAsync(cancellationToken);
    }
}
