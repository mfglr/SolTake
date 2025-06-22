using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.QuestionDomain;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class QuestionUserLikeQueryRepository(AppDbContext context) : IQuestionUserLikeQueryRepository
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
