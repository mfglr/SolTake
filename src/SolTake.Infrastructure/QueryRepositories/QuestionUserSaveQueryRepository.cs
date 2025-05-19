using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionUserSaveQueryRepository(AppDbContext context) : IQuestionUserSaveQueryRepository
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
