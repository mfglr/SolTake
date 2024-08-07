using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;

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

        public async Task<Question?> GetByIdAsync(int id,CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Question>> GetByUserIdAsync(int userId, int? lastId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.AppUserId == userId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetByTopicIdAsync(int topicId, int? lastId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.Topics.Any(x => x.TopicId == topicId))
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetBySubjectIdAsync(int subjectId, int? lastId, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.SubjectId == subjectId)
                .ToPage(lastId, 20)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetByExamIdAsync(int examId, int? lastId, CancellationToken cancellationToken)
           => await _context
               .Questions
               .AsNoTracking()
               .IncludeForQuestion()
               .Where(x => x.ExamId == examId)
               .ToPage(lastId, 20)
               .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetAllAsync(int? lastId,CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .ToPage(lastId,20)
                .ToListAsync(cancellationToken);
                
    }
}
