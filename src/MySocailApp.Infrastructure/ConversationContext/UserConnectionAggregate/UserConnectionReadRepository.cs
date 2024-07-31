using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Entities;
using MySocailApp.Domain.ConversationContext.UserConnectionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.ConversationContext.UserConnectionAggregate
{
    public class UserConnectionReadRepository(AppDbContext context) : IUserConnectionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<UserConnection?> GetById(int id, CancellationToken cancellationToken)
            => await _context.UserConnections.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
