using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.TopicAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserSaveQueryableMappers
    {
        public static IQueryable<QuestionUserSaveResponseDto> ToQuestionUserSaveResponseDto(this IQueryable<QuestionUserSave> query, AppDbContext context, int accountId) =>
            query
                .Join(context.Users, qus => qus.AppUserId, account => account.Id, (qus, account) => new { qus, account.UserName })
                .Join(
                    context.Questions,
                    join => join.qus.QuestionId,
                    question => question.Id,
                    (join,question) => new QuestionUserSaveResponseDto(
                        join.qus.Id,
                        join.qus.CreatedAt,
                        join.qus.QuestionId,
                        join.qus.AppUserId,
                        new QuestionResponseDto(
                            question.Id,
                            question.CreatedAt,
                            question.UpdatedAt,
                            question.State,
                            question.AppUserId == accountId,
                            question.AppUserId,
                            join.UserName!,
                            question.Content.Value,
                            question.Likes.Any(x => x.AppUserId == accountId),
                            question.Savers.Any(x => x.AppUserId == accountId),
                            question.Likes.Count,
                            context.Comments.Count(c => c.QuestionId == question.Id),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.State == SolutionState.Correct),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.HasVideo),
                            question.Exam,
                            question.Subject,
                            question.Topic,
                            question.Images.Select(i => new QuestionImageResponseDto(i.Id, i.QuestionId, i.BlobName, i.Height, i.Width))
                        )
                    )
                );
                
    }




}
