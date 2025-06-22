using Microsoft.EntityFrameworkCore;
using SolTake.Domain.UserUserSearchAggregate.Abstracts;
using SolTake.Domain.UserUserSearchAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.UserUserSearchAggregate
{
    internal class UserUserSearchWriteRepository(AppDbContext context) : IUserUserSearchWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(UserUserSearch userSearch, CancellationToken cancellationToken)
            => await _context.UserUserSearchs.AddAsync(userSearch, cancellationToken);

        public Task<List<UserUserSearch>> GetUserSearchsByUserId(int userId, CancellationToken cancellationToken)
            => _context.UserUserSearchs.Where(x => x.SearcherId == userId || x.SearchedId == userId).ToListAsync(cancellationToken);

        public void Delete(UserUserSearch userSearch)
            => _context.UserUserSearchs.Remove(userSearch);

        public void DeleteRange(IEnumerable<UserUserSearch> userSearchs)
            => _context.UserUserSearchs.RemoveRange(userSearchs);

        public Task<UserUserSearch?> GetAsync(int searcherId, int searchedId, CancellationToken cancellationToken)
            => _context.UserUserSearchs.FirstOrDefaultAsync(x => x.SearcherId == searcherId && x.SearchedId == searchedId, cancellationToken);

        public Task<List<UserUserSearch>> GetByUserIds(int userId0, int userId1, CancellationToken cancellationToken)
            => _context.UserUserSearchs
                .Where(
                    uus => 
                        (uus.SearcherId == userId0 && uus.SearchedId == userId1) ||
                        (uus.SearcherId == userId1 && uus.SearchedId == userId0)
                )
                .ToListAsync(cancellationToken);
    }
}
