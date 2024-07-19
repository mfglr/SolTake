using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Domain.QuestionAggregate.Repositories;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class ExamRepositoryQA(AppDbContext context) : IExamRepositoryQA
    {
        private readonly AppDbContext _context = context;
        public async Task<Exam?> GetAsync(int id,CancellationToken cancellationToken) => 
            await _context.Exams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
