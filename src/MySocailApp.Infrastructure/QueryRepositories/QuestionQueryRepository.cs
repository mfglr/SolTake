using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extetions;
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

        private Task<List<QuestionResponseDto>> GetListAsync(int accountId, IPage page, Expression<Func<Question, bool>> predicate, CancellationToken cancellationToken)
            => _context.Questions
                .AsNoTracking()
                .Where(predicate)
                .ToPage(page)
                .ToQuestionResponseDto(_context, accountId)
                .ToListAsync(cancellationToken);

        public Task<QuestionResponseDto?> GetQuestionByIdAsync(int id, int accountId, CancellationToken cancellationToken)
            => GetFirstAsync(accountId, x => x.Id == id && !x.IsRemoved, cancellationToken);

        public Task<List<QuestionResponseDto>> GetHomePageQuestionsAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.AppUserId != accountId && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetUserQuestionsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.AppUserId == userId && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetTopicQuestionsAsync(int topicId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.Topic.Id == topicId && x.AppUserId != accountId && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetSubjectQuestionsAsync(int subjectId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.Subject.Id == subjectId && x.AppUserId != accountId && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetExamQuestionsAsync(int examId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.Exam.Id == examId && x.AppUserId != accountId && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> SearchQuestionsAsync(int accountId, IPage page, int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                x =>
                    (examId == null || x.Exam.Id == examId) &&
                    (subjectId == null || x.Subject.Id == subjectId) &&
                    (topicId == null || x.Topic.Id == topicId) &&
                    !x.IsRemoved &&
                    x.AppUserId != accountId,
                cancellationToken
            );

        public Task<List<QuestionResponseDto>> GetQuestionsThatHasSolutionVideoAsync(int accountId, IPage page, int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                x =>
                    (examId == null || x.Exam.Id == examId) &&
                    (subjectId == null || x.Subject.Id == subjectId) &&
                    (topicId == null || x.Topic.Id == topicId) &&
                    x.Solutions.Any(x => x.Video != null) &&
                    !x.IsRemoved &&
                    x.AppUserId != accountId,
                cancellationToken
            );


        public Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.AppUserId == userId && x.Solutions.Any(x => x.State == SolutionState.Correct) && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken)
           => GetListAsync(accountId, page, x => x.AppUserId == userId && !x.Solutions.Any(x => x.State == SolutionState.Correct) && !x.IsRemoved, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetFollowedsQuestionsAsync(int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(accountId, page, x => x.AppUser.Followers.Any(x => x.FollowerId == accountId) && !x.IsRemoved, cancellationToken);
    }
}
