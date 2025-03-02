using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.UserDomain.UserSearchAggregate
{
    public class UserSearchWriteRepository(AppDbContext context) : IUserSearchWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(UserSearch userSearch, CancellationToken cancellationToken)
            => await _context.UserSearchs.AddAsync(userSearch, cancellationToken);

        public Task<List<UserSearch>> GetUserSearchsByUserId(int userId, CancellationToken cancellationToken)
            => _context.UserSearchs.Where(x => x.SearcherId == userId || x.SearchedId == userId).ToListAsync(cancellationToken);
        
        public void Delete(UserSearch userSearch)
            => _context.UserSearchs.Remove(userSearch);

        public void DeleteRange(IEnumerable<UserSearch> userSearchs)
            => _context.UserSearchs.RemoveRange(userSearchs);

        public Task<UserSearch?> GetAsync(int searcherId, int searchedId, CancellationToken cancellationToken)
            => _context.UserSearchs.FirstOrDefaultAsync(x => x.SearcherId == searcherId && x.SearcherId == searchedId, cancellationToken);

        
    }
}
