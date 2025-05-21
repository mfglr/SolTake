using MySocailApp.Application.Queries.UserUserConversation;
using SolTake.Domain.UserUserConversationAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserUserConversationQueryableMapper
    {
        public static IQueryable<UserUserConversationResponseDto> ToUserUserConversationResponseDto(this IQueryable<UserUserConversation> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    uuc => uuc.ListenerId,
                    u => u.Id,
                    (uuc, u) => new UserUserConversationResponseDto(
                        uuc.Id,
                        u.Id,
                        u.UserName.Value,
                        u.Name,
                        u.Image
                    )
                );
    }
}
