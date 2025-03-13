using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using System.Linq.Expressions;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionQueryRepository(AppDbContext context) : IQuestionQueryRepository
    {
        private readonly AppDbContext _context = context;

        private Task<QuestionResponseDto?> GetFirstAsync(int accountId, Expression<Func<Question, bool>> predicate, CancellationToken cancellationToken)
            => _context.Questions
                .AsNoTracking()
                .Where(predicate)
                .ToQuestionResponseDto(_context, accountId)
                .FirstOrDefaultAsync(cancellationToken);

        private Task<List<QuestionResponseDto>> GetListAsync(int? userId, IPage page, Expression<Func<Question, bool>> predicate, CancellationToken cancellationToken)
            => _context.Questions
                .AsNoTracking()
                .Where(predicate)
                .ToPage(page)
                .ToQuestionResponseDto(_context, userId)
                .ToListAsync(cancellationToken);

        public Task<QuestionResponseDto?> GetQuestionByIdAsync(int id, int accountId, CancellationToken cancellationToken)
            => GetFirstAsync(accountId, x => x.Id == id, cancellationToken);

        public Task<List<QuestionResponseDto>> GetHomePageQuestionsAsync(int? accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.UserId != accountId, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetUserQuestionsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.UserId == userId, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetTopicQuestionsAsync(int topicId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.Topic.Id == topicId && x.UserId != accountId, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetSubjectQuestionsAsync(int subjectId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.Subject.Id == subjectId && x.UserId != accountId, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetExamQuestionsAsync(int examId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.Exam.Id == examId && x.UserId != accountId, cancellationToken);

        public Task<List<QuestionResponseDto>> GetVideoQuestionsAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.UserId != accountId && x.Medias.Any(x => x.MultimediaType == MultimediaType.Video), cancellationToken);

        public Task<List<QuestionResponseDto>> SearchQuestionsAsync(int accountId, IPage page, int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                x =>
                    (examId == null || x.Exam.Id == examId) &&
                    (subjectId == null || x.Subject.Id == subjectId) &&
                    (topicId == null || x.Topic.Id == topicId) &&
                    x.UserId != accountId,
                cancellationToken
            );

        public Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                q => 
                    q.UserId == userId && 
                    _context.Solutions.Any(s => s.QuestionId == q.Id && s.State == SolutionState.Correct),
                cancellationToken
            );
        
        public Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                q => q.UserId == userId &&
                !_context.Solutions.Any(s => s.QuestionId == q.Id && s.State == SolutionState.Correct),
                cancellationToken
            );
    }
}
