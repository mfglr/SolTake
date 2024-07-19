using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Repositories;
using MySocailApp.Domain.SubjectAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class SubjectRepositoryQA(AppDbContext context) : ISubjectRepositoryQA
    {
        private readonly AppDbContext _context = context;

        public async Task<Subject?> GetByIdAsync(int id, CancellationToken cancellationToken) =>
            await _context.Subjects.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
