using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionReadRepository(AppDbContext context) : IQuestionReadRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<bool> Exist(int id, CancellationToken cancellationToken)
            => await _context.Questions.AnyAsync(x => x.Id == id, cancellationToken);

        public async Task<Question?> GetAsync(int questionId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == questionId, cancellationToken);

        public async Task<Question?> GetQuestionWithImagesById(int id, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .Include(x => x.Images)
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
