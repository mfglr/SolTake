using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.SubjectAggregate.Entities;
using MySocailApp.Domain.SubjectAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.SubjectAggregate
{
    public class SubjectReadRepository(AppDbContext context) : ISubjectReadRepository
    {
        private readonly AppDbContext _context = context;

        public Task<Subject?> GetByIdAsync(int subjectId, CancellationToken cancellationToken) =>
            _context.Subjects
                .AsNoTracking()
                .FirstOrDefaultAsync(x => x.Id == subjectId, cancellationToken);

        public Task<Subject?> GetSubjectWithTopicByIdAsync(int subjectId, int topicId, CancellationToken cancellationToken) =>
            _context.Subjects
                .AsNoTracking()
                .Include(x => x.Topics.Where(x => x.TopicId == topicId))
                .FirstOrDefaultAsync(x => x.Id == subjectId, cancellationToken);
    }
}
