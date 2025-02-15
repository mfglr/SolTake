using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserSaveQueryableMappers
    {
        public static IQueryable<QuestionUserSaveResponseDto> ToQuestionUserSaveResponseDto(this IQueryable<QuestionUserSave> query, AppDbContext context, int accountId) =>
            query
                .Join(
                    context.Accounts,
                    qus => qus.UserId,
                    account => account.Id,
                    (qus, account) => new { qus, UserName = account.UserName.Value }
                )
                .Join(
                    context.Users,
                    join => join.qus.UserId,
                    user => user.Id,
                    (join, user) => new { join, user }
                )
                .Join(
                    context.Questions,
                    join1 => join1.join.qus.QuestionId,
                    question => question.Id,
                    (join1, question) => new QuestionUserSaveResponseDto(
                        join1.join.qus.Id,
                        join1.join.qus.CreatedAt,
                        join1.join.qus.QuestionId,
                        join1.join.qus.UserId,
                        new QuestionResponseDto(
                            question.Id,
                            question.CreatedAt,
                            question.UpdatedAt,
                            context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct) 
                                ? QuestionState.Solved
                                : QuestionState.Unsolved,
                            question.UserId == accountId,
                            question.UserId,
                            join1.join.UserName,
                            question.Content.Value,
                            question.Likes.Any(x => x.UserId == accountId),
                            question.Savers.Any(x => x.UserId == accountId),
                            question.Likes.Count,
                            context.Comments.Count(c => c.QuestionId == question.Id),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.State == SolutionState.Correct),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.Medias.Any(x => x.MultimediaType == Core.MultimediaType.Video)),
                            question.Exam,
                            question.Subject,
                            question.Topic,
                            question.Medias.Select(
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
                            join1.user.Image
                        )
                    )
                );
                
    }




}
