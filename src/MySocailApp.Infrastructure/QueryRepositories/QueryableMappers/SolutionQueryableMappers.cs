using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> Join(this IQueryable<Solution> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    s => s.AppUserId,
                    a => a.Id,
                    (s, a) => new { s, a }
                )
                .Join(
                    context.Questions,
                    j => j.s.QuestionId,
                    q => q.Id,
                    (j, q) => new SolutionResponseDto(
                        j.s.Id,
                        j.s.CreatedAt,
                        j.s.UpdatedAt,
                        j.s.QuestionId,
                        j.a.UserName!,
                        j.s.AppUserId,
                        j.s.Content.Value,
                        j.s.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Upvote),
                        j.s.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                        j.s.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Downvote),
                        j.s.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                        context.Comments.Count(c => c.SolutionId == j.s.Id),
                        j.s.State,
                        j.s.AppUserId == accountId,
                        q.AppUserId == accountId,
                        j.s.Images.Select(
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
