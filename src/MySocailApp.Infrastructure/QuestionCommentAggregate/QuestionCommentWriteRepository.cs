using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;
using MySocailApp.Domain.QuestionCommentAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionCommentAggregate
{
    public class QuestionCommentWriteRepository(AppDbContext context) : IQuestionCommentWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(QuestionComment comment, CancellationToken cancellationToken)
            => await _context.AddAsync(comment,cancellationToken);

        public async Task<QuestionComment?> GetWithLikeByIdAsync(int id, int userId, CancellationToken cancellationToken)
            => await _context.QuestionComments
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);
    }
}
