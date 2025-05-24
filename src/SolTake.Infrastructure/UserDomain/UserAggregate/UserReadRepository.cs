using Microsoft.EntityFrameworkCore;
using SolTake.Domain.UserAggregate.Abstracts;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Domain.UserAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.UserDomain.UserAggregate
{
    public class UserReadRepository(AppDbContext context) : IUserReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> IsEmailTaken(Email email, CancellationToken cancellationToken)
            => _context.Users.AnyAsync(x => x.Email.Value == email.Value, cancellationToken);

        public Task<bool> Exist(int id, CancellationToken cancellationToken)
            => _context.Users.AnyAsync(x => x.Id == id, cancellationToken);

        public Task<List<int>> GetUserIdsByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Where(x => userNames.Select(x => x.ToLower()).Contains(x.UserName.Value))
                .Select(x => x.Id)
                .ToListAsync(cancellationToken);

        public async Task<User?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<User?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public Task<User?> GetByUserName(UserName userName, CancellationToken cancellationToken)
            => _context.Users
                .AsNoTracking()
                .Include(x => x.PrivacyPolicies)
                .Include(x => x.TermsOfUses)
                .Include(x => x.VerificationTokens)
                .FirstOrDefaultAsync(x => x.UserName.Value == userName.Value, cancellationToken);

        public Task<bool> UserNameExist(UserName userName, CancellationToken cancellationToken)
            => _context.Users.AnyAsync(x => x.UserName.Value == userName.Value, cancellationToken);

    }
}
