using MySocailApp.Application.Queries.MessageDomain;
using MySocailApp.Domain.MessageDomain.MessageConnectionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class MessageConnectionQueryableMappers
    {
        public static IQueryable<MessageConnectionResponseDto> ToMessageConnectionResponseDto(this IQueryable<MessageConnection> querable, AppDbContext context)
            => querable
                .Join(
                    context.Users,
                    mc => mc.Id,
                    u => u.Id,
                    (mc, u) =>
                        new MessageConnectionResponseDto(
                            mc.Id,
                            mc.UpdatedAt,
                            u.UserName.Value,
                            u.Image,
                            mc.State,
                            mc.TypingId
                        )

                );
    }
}
