using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
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

        public async Task<Question?> GetQuestionByIdAsync(int id, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Question>> GetQuestionsByUserIdAsync(int userId, IPagination pagination, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.AppUserId == userId)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetQuestionsByTopicIdAsync(int topicId, IPagination pagination, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.Topics.Any(x => x.TopicId == topicId))
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetQuestionsBySubjectIdAsync(int subjectId, IPagination pagination, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.SubjectId == subjectId)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetQuestionsByExamIdAsync(int examId, IPagination pagination, CancellationToken cancellationToken)
           => await _context
               .Questions
               .AsNoTracking()
               .IncludeForQuestion()
               .Where(x => x.ExamId == examId)
               .ToPage(pagination)
               .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetHomePageQuestionsAsync(int userId, IPagination pagination, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.AppUserId != userId)
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> SearchQuestions(string? key, int? examId, int? subjectId, int? topicId, IPagination pagination, CancellationToken cancellationToken)
            => await _context.Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(
                    x => 
                        (key == null || (x.Content != null && x.Content.ToLower().Contains(key.ToLower()))) &&
                        (examId == null || x.ExamId == examId) &&
                        (subjectId == null || x.SubjectId == subjectId) &&
                        (topicId == null || x.Topics.Any(x => x.TopicId == topicId))
                )
                .ToPage(pagination)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetSolvedQuestionsByUserIdAsync(int userId, IPagination pagination, CancellationToken cancellationToken)
            => await _context.Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.AppUserId == userId && x.Solutions.Any(x => x.State == SolutionState.Correct))
                .ToPage(pagination)
                .ToListAsync (cancellationToken);
        
        public async Task<List<Question>> GetUnsolvedQuestionsByUserIdAsync(int userId, IPagination pagination, CancellationToken cancellationToken)
          => await _context.Questions
              .AsNoTracking()
              .IncludeForQuestion()
              .Where(x => x.AppUserId == userId && !x.Solutions.Any(x => x.State == SolutionState.Correct))
              .ToPage(pagination)
              .ToListAsync(cancellationToken);
    }
}
