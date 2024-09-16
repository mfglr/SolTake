using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserVoteQueryableMappers
    {
        public static IQueryable<SolutionUserVoteResponseDto> ToSolutionUserVoteDto(this IQueryable<SolutionUserVote> query,int accountId)
            => query
                .Select(
                    x => new SolutionUserVoteResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.SolutionId,
                        x.AppUserId,
                        x.Type,
                        new AppUserResponseDto(
                            x.AppUser.Id,
                            x.AppUser.CreatedAt,
                            x.AppUser.UpdatedAt,
                            x.AppUser.Account.UserName!,
                            x.AppUser.Name,
                            x.AppUser.Biography.Value,
                            x.AppUser.HasImage,
                            x.AppUser.Questions.Count,
                            x.AppUser.Followers.Count,
                            x.AppUser.Followeds.Count,
                            x.AppUser.Followeds.Any(v => v.FollowedId == accountId),
                            x.AppUser.Followers.Any(v => v.FollowerId == accountId)
                        )
                    )
                );
    }
}
