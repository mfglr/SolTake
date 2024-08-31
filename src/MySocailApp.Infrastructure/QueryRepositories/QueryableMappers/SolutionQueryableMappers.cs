using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using System.Linq;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> ToSolutionResponseDto(this IQueryable<Solution> query, int accountId)
            => query
                .Select(
                    x => new SolutionResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.UpdatedAt,
                        x.QuestionId,
                        x.AppUser.Account.UserName!,
                        x.AppUserId,
                        x.Content != null ? x.Content.Value : null,
                        x.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Upvote),
                        x.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                        x.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Downvote),
                        x.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                        x.Comments.Count,
                        x.State,
                        x.AppUserId == accountId,
                        x.Question.AppUserId == accountId,
                        x.Images.Select(
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
