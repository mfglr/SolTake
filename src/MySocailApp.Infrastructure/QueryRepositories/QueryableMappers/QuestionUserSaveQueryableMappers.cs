using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserSaveQueryableMappers
    {
        public static IQueryable<QuestionUserSaveResponseDto> ToQuestionUserSaveResponseDto(this IQueryable<QuestionUserSave> query, AppDbContext context, int accountId) =>
            query
                .Join(context.Accounts, qus => qus.AppUserId, account => account.Id, (qus, account) => new { qus, account.UserName })
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
                            context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct) 
                                ? QuestionState.Solved
                                : QuestionState.Unsolved,
                            question.UserId == accountId,
                            question.UserId,
                            join.UserName.Value,
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
                            question.Medias.Select(
                                i => new QuestionMultimediaResponseDto(
                                    i.Id,
                                    i.QuestionId,
                                    i.BlobName,
                                    i.Size,
                                    i.Height,
                                    i.Width,
                                    i.Duration,
                                    i.MediaType
                                )
                            )
                        )
                    )
                );
                
    }




}
