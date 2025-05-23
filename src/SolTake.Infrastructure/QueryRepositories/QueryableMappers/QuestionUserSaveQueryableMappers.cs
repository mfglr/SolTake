using SolTake.Application.Queries.QuestionDomain;
using SolTake.Domain.QuestionAggregate.ValueObjects;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;
using SolTake.Core;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserSaveQueryableMappers
    {
        public static IQueryable<QuestionUserSaveResponseDto> ToQuestionUserSaveResponseDto(this IQueryable<QuestionUserSave> query, AppDbContext context, int userId) =>
            query
                .Join(
                    context.Users,
                    qus => qus.UserId,
                    user => user.Id,
                    (qus, user) => new { qus, UserName = user.UserName.Value, user.Image }
                )
                .Join(
                    context.Questions,
                    join => join.qus.QuestionId,
                    question => question.Id,
                    (join, question) => new QuestionUserSaveResponseDto(
                        join.qus.Id,
                        new QuestionResponseDto(
                            question.Id,
                            question.CreatedAt,
                            question.UpdatedAt,
                            context.Solutions.Any(s => s.QuestionId == question.Id && s.State == SolutionState.Correct) 
                                ? QuestionState.Solved
                                : QuestionState.Unsolved,
                            question.UserId == userId,
                            question.UserId,
                            join.UserName,
                            question.Content.Value,
                            context.QuestionUserLikes.Any(x => x.UserId == userId && x.QuestionId == question.Id),
                            context.QuestionUserSaves.Any(x => x.QuestionId == x.QuestionId && x.UserId == userId),
                            context.QuestionUserLikes.Count(x => x.QuestionId == question.Id),
                            context.Comments.Count(c => c.QuestionId == question.Id),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.State == SolutionState.Correct),
                            context.Solutions.Count(solution => solution.QuestionId == question.Id && solution.Medias.Any(x => x.MultimediaType == MultimediaType.Video)),
                            question.Exam,
                            question.Subject,
                            question.Topic,
                            question.Medias,
                            join.Image
                        )
                    )
                );
    }

}
