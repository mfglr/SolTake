using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionUserSaveQuestionRepository(AppDbContext context) : IQuestionUserSaveQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<QuestionUserSaveResponseDto>> GetSavesAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserSaves
                .AsNoTracking()
                .Where(x => x.UserId == userId)
                .ToPage(page)
                .ToQuestionUserSaveResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
