using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> ToSolutionResponseDto(this IQueryable<Solution> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    solution => solution.AppUserId,
                    account => account.Id,
                    (solution, account) => new { solution, account.UserName }
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
                        join.UserName!,
                        join.solution.AppUserId,
                        join.solution.Content.Value,
                        join.solution.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Upvote),
                        join.solution.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                        join.solution.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Downvote),
                        join.solution.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                        context.Comments.Count(c => c.SolutionId == join.solution.Id),
                        join.solution.State,
                        join.solution.AppUserId == accountId,
                        join.solution.Savers.Any(x => x.AppUserId == accountId),
                        join.solution.HasVideo,
                        question.AppUserId == accountId,
                        join.solution.Images.Select(
                            i => new SolutionImageResponseDto(
                                i.Id,
                                i.SolutionId,
                                i.BlobName,
                                i.Height,
                                i.Width
                            )
                        )
                    )
                );




    }
}
