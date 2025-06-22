using SolTake.Application.Queries.QuestionDomain;
using SolTake.Domain.QuestionAggregate.Entities;
using SolTake.Domain.QuestionAggregate.ValueObjects;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;
using SolTake.Core;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class QuestionQueryableMappers
    {
        public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query, AppDbContext context, int? forUserId)
            => query
                .Join(
                    context.Users,
                    question => question.UserId,
                    user => user.Id,
                    (question, user) => new QuestionResponseDto(
                        question.Id,
                        question.CreatedAt,
                        question.UpdatedAt,
                        context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct)
                            ? QuestionState.Solved
                            : QuestionState.Unsolved,
                        question.UserId == forUserId,
                        question.UserId,
                        user.UserName.Value,
                        question.Content.Value,
                        context.QuestionUserLikes.Any(x => x.UserId == forUserId && x.QuestionId == question.Id),
                        context.QuestionUserSaves.Any(x => x.UserId == forUserId && x.QuestionId == question.Id),
                        question.PublishingState,
                        context.QuestionUserLikes.Count(x => x.QuestionId == question.Id),
                        context.Comments.Count(c => c.QuestionId == question.Id),
                        context.Solutions.Count(solution => solution.QuestionId == question.Id),
                        context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.State == SolutionState.Correct),
                        context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.Medias.Any(x => x.MultimediaType == MultimediaType.Video)),
                        question.Exam,
                        question.Subject,
                        question.Topic,
                        question.Medias,
                        user.Image
                    )
                );
    }
}
