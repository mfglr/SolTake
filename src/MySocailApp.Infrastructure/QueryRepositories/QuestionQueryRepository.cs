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
            => GetFirstAsync(
                accountId,
                question => 
                    question.Id == id &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );

        public Task<List<QuestionResponseDto>> GetHomePageQuestionsAsync(int? accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.UserId != accountId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );
        
        public Task<List<QuestionResponseDto>> GetUserQuestionsAsync(int userId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.UserId == userId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );
        
        public Task<List<QuestionResponseDto>> GetTopicQuestionsAsync(int topicId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.Topic.Id == topicId &&
                    question.UserId != accountId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );
        
        public Task<List<QuestionResponseDto>> GetSubjectQuestionsAsync(int subjectId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.Subject.Id == subjectId &&
                    question.UserId != accountId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );
        
        public Task<List<QuestionResponseDto>> GetExamQuestionsAsync(int examId, int accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.Exam.Id == examId &&
                    question.UserId != accountId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );

        public Task<List<QuestionResponseDto>> GetVideoQuestionsAsync(int? accountId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.UserId != accountId &&
                    question.Medias.Any(x => x.MultimediaType == MultimediaType.Video) &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );

        public Task<List<QuestionResponseDto>> SearchQuestionsAsync(int accountId, IPage page, int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question =>
                    (examId == null || question.Exam.Id == examId) &&
                    (subjectId == null || question.Subject.Id == subjectId) &&
                    (topicId == null || question.Topic.Id == topicId) &&
                    question.UserId != accountId &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );

        public Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question =>
                    question.UserId == userId && 
                    _context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct) &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );
        
        public Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserIdAsync(int accountId, IPage page, int userId, CancellationToken cancellationToken)
            => GetListAsync(
                accountId,
                page,
                question => 
                    question.UserId == userId &&
                    !_context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct) &&
                    !_context.UserUserBlocks.Any(uub => uub.BlockerId == question.UserId && uub.BlockedId == accountId),
                cancellationToken
            );
    }
}
