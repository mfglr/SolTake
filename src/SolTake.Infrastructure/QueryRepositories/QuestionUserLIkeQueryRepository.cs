using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionUserLikeQueryRepository(AppDbContext context) : IQuestionUserLikeQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<QuestionUserLikeResponseDto?> GetLikeAsync(int likeId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes
                .AsNoTracking()
                .Where(x => x.Id == likeId)
                .ToQuestionUserLikeResponseDto(_context)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<QuestionUserLikeResponseDto>> GetLikesAsync(int questionId, IPage page, CancellationToken cancellationToken)
            => _context.QuestionUserLikes
                .AsNoTracking()
                .Where(x => x.QuestionId == questionId)
                .ToPage(page)
                .ToQuestionUserLikeResponseDto(_context)
                .ToListAsync(cancellationToken);
    }
}
