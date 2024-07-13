using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.SubjectAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class SubjectRepository(AppDbContext context) : ISubjectRepository
    {
        private readonly AppDbContext _context = context;

        public async Task<Subject> GetAsync(int id, IEnumerable<int> topicIds, CancellationToken cancellationToken) =>
            await _context.Subjects
                .AsNoTracking()
                .Include(x => x.Topics.Where(x => topicIds.Contains(x.Id)))
                .FirstAsync(x => x.Id == id, cancellationToken);
    }
}
