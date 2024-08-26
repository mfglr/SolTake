using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.Extetions.QueryableMappers
{
    public static class AppUserQueryableMappers
    {
        public static IQueryable<AppUserResponseDto> ToUserResponseDto(this IQueryable<QuestionUserLike> queryable, int userId)
            => queryable
                .Select(x => new AppUserResponseDto(
                    x.AppUser.Id,
                    x.AppUser.CreatedAt,
                    x.AppUser.UpdatedAt,
                    x.AppUser.Account.UserName!,
                    x.AppUser.Name,
                    x.AppUser.BirthDate,
                    x.AppUser.Gender,
                    x.AppUser.HasImage,
                    x.AppUser.Questions.Count,
                    x.AppUser.Followers.Count,
                    x.AppUser.Followeds.Count,
                    x.AppUser.Followeds.Any(x => x.FollowedId == userId),
                    x.AppUser.Followers.Any(x => x.FollowerId == userId),
                    x.Id
                ));

        public static IQueryable<AppUserResponseDto> ToUserResponseDto(this IQueryable<AppUser> query, int accountId)
            => query
                .Select(x => new AppUserResponseDto(
                    x.Id,
                    x.CreatedAt,
                    x.UpdatedAt,
                    x.Account.UserName!,
                    x.Name,
                    x.BirthDate,
                    x.Gender,
                    x.HasImage,
                    x.Questions.Count,
                    x.Followers.Count,
                    x.Followeds.Count,
                    x.Followeds.Any(x => x.FollowedId == accountId),
                    x.Followers.Any(x => x.FollowerId == accountId),
                    0
                ));
    }
}
