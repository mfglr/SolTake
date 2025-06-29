﻿using Microsoft.EntityFrameworkCore;
using SolTake.Domain.TopicAggregate.Abstracts;
using SolTake.Domain.TopicAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.TopicAggregate
{
    internal class TopicReadRepository(AppDbContext context) : ITopicReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> ExistByNameAsync(string name, CancellationToken cancellationToken)
            => _context.Topics.AnyAsync(x => x.Name.ToLower() == name.ToLower(),cancellationToken);

        public Task<List<Topic>> GetByTopicIds(IEnumerable<int> ids, CancellationToken cancellationToken)
            => _context.Topics
                .AsNoTracking()
                .Where(x => ids.Contains(x.Id))
                .ToListAsync(cancellationToken);

        public Task<Topic?> GetTopicById(int id, CancellationToken cancellationToken)
            => _context.Topics
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
