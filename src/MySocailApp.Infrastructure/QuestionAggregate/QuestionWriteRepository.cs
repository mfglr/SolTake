using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionWriteRepository(AppDbContext context) : IQuestionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Question question, CancellationToken cancellationToken)
            => await _context.AddAsync(question,cancellationToken);

        public async Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken)
            => await _context.Questions.FindAsync(id);

        public async Task<Question?> GetWithLikeByIdAsync(int id,int userId,CancellationToken cancellationToken)
            => await _context.Questions
                .Include(x => x.Likes.Where(x => x.AppUserId == userId))
                .FirstOrDefaultAsync(x => x.Id == id,cancellationToken);
    }
}
