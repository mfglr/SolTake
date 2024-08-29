using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.Extetions.QueryableMappers;

namespace MySocailApp.Infrastructure.ApplicationServices.QueryRepositories
{
    public class QuestionUserLikeQueryRepository(AppDbContext context) : IQuestionUserLikeQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<List<QuestionUserLikeResponseDto>> GetQuestionLikesAsync(int questionId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserLikes
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId)
                .ToPage(page)
                .ToQuestionUserLikeResponseDto(accountId)
                .ToListAsync(cancellationToken);
    }
}
