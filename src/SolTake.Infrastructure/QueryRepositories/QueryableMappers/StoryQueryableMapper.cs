using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Domain.StoryAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class StoryQueryableMapper
    {
        public static IQueryable<StoryResponseDto> ToStoryResponseSto(this IQueryable<Story> query, int? forUserId, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    s => s.UserId,
                    u => u.Id,
                    (s, u) => new StoryResponseDto(
                        s.Id,
                        s.CreatedAt,
                        context.StoryUserViews.Any(suv => suv.StoryId == s.Id && suv.UserId == forUserId),
                        u.Id,
                        u.UserName.Value,
                        u.Image,
                        s.Media,
                        s.UserId == forUserId ? context.StoryUserViews.Count(x => x.StoryId == s.Id) : 0
                    )
                );
    }
}
