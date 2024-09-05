using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionUserLikeQueryRepository(AppDbContext context) : IQuestionUserLikeQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<QuestionUserLikeResponseDto?> GetQuestionLikeAsync(int accountId, int likeId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes
                .AsNoTracking()
                .Where(x => x.Id == likeId)
                .ToQuestionUserLikeResponseDto(accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<QuestionUserLikeResponseDto>> GetQuestionLikesAsync(int questionId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserLikes
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId)
                .ToPage(page)
                .ToQuestionUserLikeResponseDto(accountId)
                .ToListAsync(cancellationToken);
    }
}
