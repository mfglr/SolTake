using MySocailApp.Application.Queries.UserDomain.GetUsersSearched;
using MySocailApp.Domain.UserDomain.UserSearchAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserSearchedQueryableMapper
    {
        public static IQueryable<UserSearchedResponseDto> ToUserSearchedResponseDto(this IQueryable<UserSearch> query, AppDbContext context, int userId)
            => query
                .Join(
                    context.Users,
                    us => us.SearchedId,
                    user => user.Id,
                    (us, user) => new UserSearchedResponseDto(
                        us.Id,
                        us.SearchedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );
    }
}
