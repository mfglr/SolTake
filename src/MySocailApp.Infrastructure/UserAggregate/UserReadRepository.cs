using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserAggregate
{
    public class UserReadRepository(AppDbContext context) : IUserReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<User?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
