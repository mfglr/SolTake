using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Domain.StoryDomain.StoryAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class StoryQueryableMapper
    {
        public static IQueryable<StoryResponseDto> ToStoryResponseSto(this IQueryable<Story> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    s => s.UserId,
                    u => u.Id,
                    (s, u) => new StoryResponseDto(
                        s.Id,
                        u.Id,
                        u.UserName.Value,
                        u.Image,
                        s.Media
                    )
                );

    }
}
