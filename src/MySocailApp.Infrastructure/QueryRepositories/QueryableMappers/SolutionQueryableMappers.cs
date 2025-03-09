using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> ToSolutionResponseDto(this IQueryable<Solution> query, AppDbContext context, int userId)
            => query
                .Join(
                    context.Users,
                    solution => solution.UserId,
                    user => user.Id,
                    (solution, user) => new { solution, UserName = user.UserName.Value, user.Image }
                )
                .Join(
                    context.Questions,
                    join => join.solution.QuestionId,
                    question => question.Id,
                    (join, question) => new SolutionResponseDto(
                        join.solution.Id,
                        join.solution.CreatedAt,
                        join.solution.UpdatedAt,
                        join.solution.QuestionId,
                        join.UserName,
                        join.solution.UserId,
                        join.solution.Content.Value,
                        context.SolutionUserVotes.Any(v => v.SolutionId == join.solution.Id && v.UserId == userId && v.Type == SolutionVoteType.Upvote),
                        context.SolutionUserVotes.Count(v => v.SolutionId == join.solution.Id && v.Type == SolutionVoteType.Upvote),
                        context.SolutionUserVotes.Any(v => v.SolutionId == join.solution.Id && v.UserId == userId && v.Type == SolutionVoteType.Downvote),
                        context.SolutionUserVotes.Count(v => v.SolutionId == join.solution.Id && v.Type == SolutionVoteType.Downvote),
                        context.Comments.Count(c => c.SolutionId == join.solution.Id),
                        join.solution.State,
                        join.solution.UserId == userId,
                        context.SolutionUserSaves.Any(sus => sus.UserId == userId && sus.SolutionId == join.solution.Id),
                        question.UserId == userId,
                        join.solution.Medias.Select(
                            i => new SolutionMediaResponseDto(
                                i.Id,
                                i.SolutionId,
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
                        join.Image,
                        join.solution.IsCreatedByAI,
                        join.solution.Model.Name
                    )
                );




    }
}
