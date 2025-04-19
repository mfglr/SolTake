using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using MySocailApp.Infrastructure.Extentions;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using System.Linq.Expressions;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class QuestionQueryRepository(AppDbContext context) : IQuestionQueryRepository
    {
        private readonly AppDbContext _context = context;

        private Task<QuestionResponseDto?> GetFirstAsync(int? forUserId, Expression<Func<Question, bool>> predicate, CancellationToken cancellationToken)
            => _context.Questions
                .AsNoTracking()
                .Where(predicate)
                .Where(
                    question => 
                        !_context.UserUserBlocks.Any(
                            uub =>
                                (uub.BlockerId == question.UserId && uub.BlockedId == forUserId) ||
                                (uub.BlockerId == forUserId && uub.BlockedId == question.UserId)
                        )
                )
                .ToQuestionResponseDto(_context, forUserId)
                .FirstOrDefaultAsync(cancellationToken);

        private Task<List<QuestionResponseDto>> GetListAsync(int? forUserId, IPage page, Expression<Func<Question, bool>> predicate, CancellationToken cancellationToken)
            => _context.Questions
                .AsNoTracking()
                .Where(predicate)
                .Where(
                    question =>
                        !_context.UserUserBlocks.Any(
                            uub =>
                                (uub.BlockerId == question.UserId && uub.BlockedId == forUserId) ||
                                (uub.BlockerId == forUserId && uub.BlockedId == question.UserId)
                        )
                )
                .ToPage(page)
                .ToQuestionResponseDto(_context, forUserId)
                .ToListAsync(cancellationToken);

        public Task<QuestionResponseDto?> GetQuestionByIdAsync(int id, int? forUserId, CancellationToken cancellationToken)
            => GetFirstAsync(forUserId, question => question.Id == id, cancellationToken);

        public Task<List<QuestionResponseDto>> GetHomePageQuestionsAsync(int? forUserId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(forUserId, page, question => question.UserId != forUserId, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetUserQuestionsAsync(int userId, int? forUserId, IPage page, CancellationToken cancellationToken)
            => GetListAsync(forUserId, page, question => question.UserId == userId, cancellationToken);
        
        public Task<List<QuestionResponseDto>> GetTopicQuestionsAsync(int topicId, int? forUserId, IPage page, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question => question.Topic.Id == topicId && question.UserId != forUserId,
                    cancellationToken
                );
        
        public Task<List<QuestionResponseDto>> GetSubjectQuestionsAsync(int subjectId, int? forUserId, IPage page, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question => 
                        question.Subject.Id == subjectId &&
                        question.UserId != forUserId,
                    cancellationToken
                );
        
        public Task<List<QuestionResponseDto>> GetExamQuestionsAsync(int examId, int? forUserId, IPage page, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question => question.Exam.Id == examId && question.UserId != forUserId,
                    cancellationToken
                );

        public Task<List<QuestionResponseDto>> GetVideoQuestionsAsync(int? forUserId, IPage page, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question => question.UserId != forUserId && question.Medias.Any(x => x.MultimediaType == MultimediaType.Video),
                    cancellationToken
                );

        public Task<List<QuestionResponseDto>> SearchQuestionsAsync(int? forUserId, IPage page, int? examId, int? subjectId, int? topicId, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question =>
                        (examId == null || question.Exam.Id == examId) &&
                        (subjectId == null || question.Subject.Id == subjectId) &&
                        (topicId == null || question.Topic.Id == topicId) &&
                        question.UserId != forUserId,
                    cancellationToken
                );

        public Task<List<QuestionResponseDto>> GetSolvedQuestionsByUserIdAsync(int? forUserId, IPage page, int userId, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question =>
                        question.UserId == userId && 
                        _context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct),
                    cancellationToken
                );
        
        public Task<List<QuestionResponseDto>> GetUnsolvedQuestionsByUserIdAsync(int? forUserId, IPage page, int userId, CancellationToken cancellationToken)
            => 
                GetListAsync(
                    forUserId,
                    page,
                    question => 
                        question.UserId == userId &&
                        !_context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct),
                    cancellationToken
                );
    }
}
