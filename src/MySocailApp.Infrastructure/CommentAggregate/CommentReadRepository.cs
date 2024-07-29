using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

namespace MySocailApp.Infrastructure.CommentAggregate
{
    public class CommentReadRepository(AppDbContext context) : ICommentReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Comments.AnyAsync(x => x.Id == id, cancellationToken);

        public async Task<Comment?> GetAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<Comment?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Comment>> GetByParentIdAsync(int parentId,int? lastId,int? take,CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.ParentId == parentId)
                .ToPage(lastId,take ?? 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetByQuestionIdAsync(int questionId, int? lastId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.QuestionId == questionId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Comment>> GetBySolutoinIdAsync(int solutionId, int? lastId, CancellationToken cancellationToken)
            => await _context.Comments
                .AsNoTracking()
                .IncludeForComment()
                .Where(x => x.SolutionId == solutionId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);
    }
}
