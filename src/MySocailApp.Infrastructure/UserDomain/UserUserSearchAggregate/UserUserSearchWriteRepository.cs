using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserUserSearchAggregate.Abstracts;
using MySocailApp.Domain.UserUserSearchAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.UserUserSearchAggregate
{
    public class UserUserSearchWriteRepository(AppDbContext context) : IUserUserSearchWriteRepository
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


    }
}
