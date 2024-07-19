using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Repositories;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SolutionAggregate
{
    public class QuestionRepositorySA(AppDbContext context) : IQuestionRepositorySA
    {
        private readonly AppDbContext _context = context;

        public async Task<Question?> GetByIdAsync(int id, CancellationToken cancellationToken)
            => await _context.Questions.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id,cancellationToken);
    }
}
