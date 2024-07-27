using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class SolutionFinder(AppDbContext context) : ISolutionController
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Solutions.AnyAsync(x => x.Id == id,cancellationToken);
    }
}
