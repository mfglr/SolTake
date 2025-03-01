using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class CommentUserLikeQueryRepository(AppDbContext context) : ICommentUserLikeQueryRepository
    {
        private readonly AppDbContext _context = context;

        public Task<CommentUserLikeResponseDto?> GetLikeAsync(int likeId, int accountId, CancellationToken cancellationToken)
            => _context.CommentUserLikes
                .AsNoTracking()
                .Where(x => x.Id == likeId)
                .ToCommentUserLikeResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        public Task<List<CommentUserLikeResponseDto>> GetLikesAsync(int commentId, int accountId, IPage page, CancellationToken cancellationToken)
            => _context.CommentUserLikes
                .AsNoTracking()
                .Where(x => x.CommentId == commentId)
                .ToPage(page)
                .ToCommentUserLikeResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);


    }
}
