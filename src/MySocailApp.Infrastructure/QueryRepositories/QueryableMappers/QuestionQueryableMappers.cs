using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
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
                    (question, user) => new QuestionResponseDto(
                        question.Id,
                        question.CreatedAt,
                        question.UpdatedAt,
                        context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct)
                            ? QuestionState.Solved
                            : QuestionState.Unsolved,
                        question.UserId == accountId,
                        question.UserId,
                        user.UserName.Value,
                        question.Content.Value,
                        question.Likes.Any(x => x.UserId == accountId),
                        question.Savers.Any(x => x.UserId == accountId),
                        question.Likes.Count,
                        context.Comments.Count(c => c.QuestionId == question.Id),
                        context.Solutions.Count(solution => solution.QuestionId == question.Id),
                        context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.State == SolutionState.Correct),
                        context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.Medias.Any(x => x.MultimediaType == MultimediaType.Video)),
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
                        user.Image
                    )
                );
    }
}
