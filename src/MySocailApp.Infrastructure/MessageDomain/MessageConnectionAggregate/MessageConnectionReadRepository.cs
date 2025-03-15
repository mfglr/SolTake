using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Abstracts;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.MessageDomain.UserConnectionAggregate
{
    public class MessageConnectionReadRepository(AppDbContext context) : IMessageConnectionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<MessageConnection?> GetById(int id, CancellationToken cancellationToken)
            => await _context.MessageConnections.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
