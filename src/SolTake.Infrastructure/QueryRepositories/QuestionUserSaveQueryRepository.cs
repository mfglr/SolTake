using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.QuestionDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Core;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class QuestionUserSaveQueryRepository(AppDbContext context) : IQuestionUserSaveQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<QuestionUserSaveResponseDto>> GetAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserSaves
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .ToPage(page)
                .ToQuestionUserSaveResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
