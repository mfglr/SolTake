using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.CommentAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class CommentUserLikeQueryableMappers
    {
        public static IQueryable<CommentUserLikeResponseDto> ToCommentUserLikeResponseDto(this IQueryable<CommentUserLike> query, int accountId)
            => query
                .Select(
                    x => new CommentUserLikeResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.CommentId,
                        x.AppUserId,
                        new AppUserResponseDto(
                            x.AppUser.Id,
                            x.AppUser.CreatedAt,
                            x.AppUser.UpdatedAt,
                            x.AppUser.Account.UserName!,
                            x.AppUser.Name,
                            x.AppUser.BirthDate,
                            x.AppUser.HasImage,
                            x.AppUser.Questions.Count,
                            x.AppUser.Followers.Count,
                            x.AppUser.Followeds.Count,
                            x.AppUser.Followeds.Any(x => x.FollowedId == accountId),
                            x.AppUser.Followers.Any(x => x.FollowerId == accountId)
                        )
                    )
                );

    }
}
