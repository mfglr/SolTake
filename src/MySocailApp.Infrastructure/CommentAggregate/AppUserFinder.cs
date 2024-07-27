using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AppUserAggregate;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class AppUserFinder(AppDbContext context) : IAppUserFinder
    {
        private readonly AppDbContext _context = context;

        public async Task<List<AppUser>> GetByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => await _context.AppUsers
                .AsNoTracking()
                .Where(x => userNames.Contains(x.Account.UserName))
                .ToListAsync(cancellationToken);
    }
}
