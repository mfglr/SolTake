using Microsoft.EntityFrameworkCore;
using SolTake.Domain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeAggregate
{
    public class QuestionUserLikeReadRepository(AppDbContext context) : IQuestionUserLikeReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<bool> IsLikedAsync(int questionId, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes.AnyAsync(x => x.QuestionId == questionId && x.UserId == userId, cancellationToken);
    }
}
