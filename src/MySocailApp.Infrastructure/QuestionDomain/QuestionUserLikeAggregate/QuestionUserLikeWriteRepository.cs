using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionUserLikeAggregate
{
    public class QuestionUserLikeWriteRepository(AppDbContext context) : IQuestionUserLikeWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(QuestionUserLike like, CancellationToken cancellationToken)
            => await _context.QuestionUserLikes.AddAsync(like, cancellationToken);

        public void Delete(QuestionUserLike like)
            => _context.QuestionUserLikes.Remove(like);

        public Task<QuestionUserLike?> GetAsync(int questionId, int userId, CancellationToken cancellationToken)
            => _context.QuestionUserLikes.FirstOrDefaultAsync(x => x.QuestionId == questionId && x.UserId == userId, cancellationToken: cancellationToken);

    }
}
