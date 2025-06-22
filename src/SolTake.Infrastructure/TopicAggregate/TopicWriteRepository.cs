using Microsoft.EntityFrameworkCore;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.TopicAggregate
{
    internal class TopicWriteRepository(AppDbContext context) : ITopicWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Topic topic, CancellationToken cancellationToken)
            => await _context.Topics.AddAsync(topic, cancellationToken);

        public void Delete(Topic topic)
            => _context.Topics.Remove(topic);

        public Task<Topic?> GetByIdAsync(int topicId, CancellationToken cancellationToken)
            => _context.Topics.FirstOrDefaultAsync(x => x.Id == topicId, cancellationToken);
    }
}
