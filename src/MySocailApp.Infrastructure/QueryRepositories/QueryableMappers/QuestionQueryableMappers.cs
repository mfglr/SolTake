using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionQueryableMappers
    {
        public static IQueryable<QuestionResponseDto> ToQuestionResponseDto(this IQueryable<Question> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    question => question.UserId,
                    user => user.Id,
                    (question,user) => new { question, user }
                )
                .Join(
                    context.Accounts,
                    join => join.question.UserId,
                    account => account.Id,
                    (join, account) => new QuestionResponseDto(
                        join.question.Id,
                        join.question.CreatedAt,
                        join.question.UpdatedAt,
                        context.Solutions.Any(s => s.QuestionId == join.question.Id && s.State == SolutionState.Correct)
                                ? QuestionState.Solved
                                : QuestionState.Unsolved,
                        join.question.UserId == accountId,
                        join.question.UserId,
                        account.UserName.Value,
                        join.question.Content.Value,
                        join.question.Likes.Any(x => x.AppUserId == accountId),
                        join.question.Savers.Any(x => x.UserId == accountId),
                        join.question.Likes.Count,
                        context.Comments.Count(c => c.QuestionId == join.question.Id),
                        context.Solutions.Count(solution => solution.QuestionId == join.question.Id),
                        context.Solutions.Count(solution => solution.QuestionId == join.question.Id && solution.State == SolutionState.Correct),
                        context.Solutions.Count(solution => solution.QuestionId == join.question.Id && solution.Medias.Any(x => x.MultimediaType == MultimediaType.Video)),
                        join.question.Exam,
                        join.question.Subject,
                        join.question.Topic,
                        join.question.Medias.Select(
                            i => new QuestionMultimediaResponseDto(
                                i.Id,
                                i.QuestionId,
                                i.ContainerName,
                                i.BlobName,
                                i.BlobNameOfFrame,
                                i.Size,
                                i.Height,
                                i.Width,
                                i.Duration,
                                i.MultimediaType
                            )
                        ),
                        join.user.Image
                    )
                );
    }
}
