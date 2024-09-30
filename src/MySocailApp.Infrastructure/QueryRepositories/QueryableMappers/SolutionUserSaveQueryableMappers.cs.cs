using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserSaveQueryableMappers
    {
        public static IQueryable<SolutionUserSaveResponseDto> ToSolutionUserSaveResponseDto(this IQueryable<SolutionUserSave> query, int accountId)
            => query
                .Select(
                    x => new SolutionUserSaveResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.SolutionId,
                        x.AppUserId,
                        new(
                            x.Solution.Id,
                            x.Solution.CreatedAt,
                            x.Solution.UpdatedAt,
                            x.Solution.QuestionId,
                            x.Solution.AppUser.Account.UserName!,
                            x.Solution.AppUserId,
                            x.Solution.Content.Value,
                            x.Solution.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Upvote),
                            x.Solution.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                            x.Solution.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Downvote),
                            x.Solution.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                            x.Solution.Comments.Count,
                            x.Solution.State,
                            x.Solution.AppUserId == accountId,
                            x.Solution.Savers.Any(s => s.AppUserId == accountId),
                            x.Solution.Video != null,
                            x.Solution.Question.AppUserId == accountId,
                            x.Solution.Images.Select(
                                i => new SolutionImageResponseDto(
                                    i.Id,
                                    i.SolutionId,
                                    i.BlobName,
                                    i.Height,
                                    i.Width
                                )
                            )
                        )
                    )
                );
    }
}
