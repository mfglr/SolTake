using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowResponseDto> ToFollowerResponseDto(this IQueryable<Follow> query, int accountId)
            => query
                .Select(
                    x => new FollowResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.FollowerId,
                        x.FollowedId,
                        new AppUserResponseDto(
                            x.Follower.Id,
                            x.Follower.CreatedAt,
                            x.Follower.UpdatedAt,
                            x.Follower.Account.UserName!,
                            x.Follower.Name,
                            x.Follower.Biography.Value,
                            x.Follower.HasImage,
                            x.Follower.Questions.Count,
                            x.Follower.Followers.Count,
                            x.Follower.Followeds.Count,
                            x.Follower.Followeds.Any(x => x.FollowedId == accountId),
                            x.Follower.Followers.Any(x => x.FollowerId == accountId)
                        ),
                        null
                    )
                );
        public static IQueryable<FollowResponseDto> ToFollowedResponseDto(this IQueryable<Follow> query, int accountId)
            => query
                .Select(
                    x => new FollowResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.FollowerId,
                        x.FollowedId,
                        null,
                        new AppUserResponseDto(
                            x.Followed.Id,
                            x.Followed.CreatedAt,
                            x.Followed.UpdatedAt,
                            x.Followed.Account.UserName!,
                            x.Followed.Name,
                            x.Followed.Biography.Value,
                            x.Followed.HasImage,
                            x.Followed.Questions.Count,
                            x.Followed.Followers.Count,
                            x.Followed.Followeds.Count,
                            x.Followed.Followeds.Any(x => x.FollowedId == accountId),
                            x.Followed.Followers.Any(x => x.FollowerId == accountId)
                        )
                    )
                );



    }
}
