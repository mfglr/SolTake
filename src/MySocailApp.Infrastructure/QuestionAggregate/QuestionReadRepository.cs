using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
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

        public async Task<Question?> GetQuestionByIdAsync(int id, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .FirstOrDefaultAsync(x => x.Id == id, cancellationToken);

        public async Task<List<Question>> GetQuestionsByUserIdAsync(int userId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.AppUserId == userId)
                .ToPage(lastId, take ?? RecordsPerPage.QuestionsPerPage)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetQuestionsByTopicIdAsync(int topicId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.Topics.Any(x => x.TopicId == topicId))
                .ToPage(lastId, take ?? RecordsPerPage.QuestionsPerPage)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetQuestionsBySubjectIdAsync(int subjectId, int? lastId, int? take, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.SubjectId == subjectId)
                .ToPage(lastId, take ?? RecordsPerPage.QuestionsPerPage)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetQuestionsByExamIdAsync(int examId, int? lastId, int? take, CancellationToken cancellationToken)
           => await _context
               .Questions
               .AsNoTracking()
               .IncludeForQuestion()
               .Where(x => x.ExamId == examId)
               .ToPage(lastId, take ?? RecordsPerPage.QuestionsPerPage)
               .ToListAsync(cancellationToken);

        public async Task<List<Question>> GetHomePageQuestionsAsync(int userId, int? offset, int? take, bool isDescending, CancellationToken cancellationToken)
            => await _context
                .Questions
                .AsNoTracking()
                .IncludeForQuestion()
                .Where(x => x.AppUserId != userId)
                .ToPage(offset, take ?? RecordsPerPage.QuestionsPerPage,isDescending)
                .ToListAsync(cancellationToken);

        public async Task<List<Question>> SearchQuestions(string? key, int? examId, int? subjectId, int? topicId,int? lastId,int? take, CancellationToken cancellationToken)
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
                .ToPage(lastId,take ?? RecordsPerPage.QuestionsPerPage)
                .ToListAsync(cancellationToken);
    }
}
