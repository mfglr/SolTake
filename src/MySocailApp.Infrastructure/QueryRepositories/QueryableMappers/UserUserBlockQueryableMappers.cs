using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Domain.UserUserBlockAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserUserBlockQueryableMappers
    {
        public static IQueryable<UserUserBlockResponseDto> ToUserUserBlockResponseDto(this IQueryable<UserUserBlock> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    userUserBlock => userUserBlock.BlockedId,
                    user => user.Id,
                    (userUserBlock, user) => new UserUserBlockResponseDto(
                        userUserBlock.Id,
                        userUserBlock.BlockedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );
    }
}
