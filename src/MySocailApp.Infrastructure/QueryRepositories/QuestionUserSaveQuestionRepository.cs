using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionUserSaveQuestionRepository(AppDbContext context) : IQuestionUserSaveQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<QuestionUserSaveResponseDto>> GetSavesAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserSaves
                .Where(x => x.AppUserId == userId)
                .ToPage(page)
                .ToQuestionUserSaveResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);
    }
}
