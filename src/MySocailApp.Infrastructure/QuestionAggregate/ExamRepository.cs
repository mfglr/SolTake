using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.ExamAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class ExamRepository(AppDbContext context) : IExamRepository
    {
        private readonly AppDbContext _context = context;
        public async Task<Exam?> GetAsync(int id,int subjectId,IEnumerable<int> topicIds,CancellationToken cancellationToken) => 
            await _context.Exams
                .AsNoTracking()
                .Include(x => x.Subjects.Where(x => x.Id == subjectId))
                .ThenInclude(x => x.Topics.Where(x => topicIds.Contains(x.Id)))
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
    }
}
