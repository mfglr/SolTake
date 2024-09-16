using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class AppUserQueryableMappers
    {
        public static IQueryable<AppUserResponseDto> ToUserResponseDto(this IQueryable<QuestionUserLike> queryable, int accountId)
            => queryable
                .Select(x => new AppUserResponseDto(
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
                    x.AppUser.Followeds.Any(f => f.FollowedId == accountId),
                    x.AppUser.Followers.Any(f => f.FollowerId == accountId)
                ));

        public static IQueryable<AppUserResponseDto> ToUserResponseDto(this IQueryable<AppUser> query, int accountId)
            => query
                .Select(x => new AppUserResponseDto(
                    x.Id,
                    x.CreatedAt,
                    x.UpdatedAt,
                    x.Account.UserName!,
                    x.Name,
                    x.Biography.Value,
                    x.HasImage,
                    x.Questions.Count,
                    x.Followers.Count,
                    x.Followeds.Count,
                    x.Followeds.Any(x => x.FollowedId == accountId),
                    x.Followers.Any(x => x.FollowerId == accountId)
                ));

        public static IQueryable<AppUserResponseDto> ToUserResponseDto(this IQueryable<UserSearch> queryable, int accountId)
            => queryable
                .Select(x => new AppUserResponseDto(
                    x.Searched.Id,
                    x.Searched.CreatedAt,
                    x.Searched.UpdatedAt,
                    x.Searched.Account.UserName!,
                    x.Searched.Name,
                    x.Searched.Biography.Value,
                    x.Searched.HasImage,
                    x.Searched.Questions.Count,
                    x.Searched.Followers.Count,
                    x.Searched.Followeds.Count,
                    x.Searched.Followeds.Any(x => x.FollowedId == accountId),
                    x.Searched.Followers.Any(x => x.FollowerId == accountId)
                ));

    }
}
