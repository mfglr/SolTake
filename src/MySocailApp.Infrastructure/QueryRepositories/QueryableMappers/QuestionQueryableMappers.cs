using MySocailApp.Application.Queries.QuestionDomain;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionQueryableMappers
    {
        public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query, AppDbContext context, int? userId)
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
                        question.UserId == userId,
                        question.UserId,
                        user.UserName.Value,
                        question.Content.Value,
                        context.QuestionUserLikes.Any(x => x.UserId == userId && x.QuestionId == question.Id),
                        context.QuestionUserSaves.Any(x => x.UserId == userId && x.QuestionId == question.Id),
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
