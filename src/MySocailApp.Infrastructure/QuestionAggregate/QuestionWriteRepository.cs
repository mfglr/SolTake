using MySocailApp.Domain.PostAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionWriteRepository(AppDbContext context) : IQuestionWriteRepository
    {
        private readonly AppDbContext _context = context;

        public async Task CreateAsync(Question question, CancellationToken cancellationToken)
            => await _context.AddAsync(question,cancellationToken);

        public async Task<Question?> GetByIdAsync(int id) => await _context.Questions.FindAsync(id);
    }
}
