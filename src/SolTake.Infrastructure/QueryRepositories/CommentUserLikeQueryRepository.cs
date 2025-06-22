using Microsoft.EntityFrameworkCore;
using SolTake.Application.Queries.CommentAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.DbContexts;
using SolTake.Infrastructure.Extentions;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories
{
    internal class CommentUserLikeQueryRepository(AppDbContext context) : ICommentUserLikeQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<CommentUserLikeResponseDto?> GetLikeAsync(int likeId, CancellationToken cancellationToken)
            => _context.CommentUserLikes
                .AsNoTracking()
                .Where(x => x.Id == likeId)
                .ToCommentUserLikeResponseDto(_context)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<CommentUserLikeResponseDto>> GetLikesAsync(int commentId, IPage page, CancellationToken cancellationToken)
            => _context.CommentUserLikes
                .AsNoTracking()
                .Where(x => x.CommentId == commentId)
                .ToPage(page)
                .ToCommentUserLikeResponseDto(_context)
                .ToListAsync(cancellationToken);


    }
}
