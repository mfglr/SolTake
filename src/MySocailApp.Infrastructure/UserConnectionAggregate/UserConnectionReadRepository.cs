using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserConnectionAggregate.Entities;
using MySocailApp.Domain.UserConnectionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserConnectionAggregate
{
    public class UserConnectionReadRepository(AppDbContext context) : IUserConnectionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<UserConnection?> GetById(int id, CancellationToken cancellationToken)
            => await _context.UserConnections.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
