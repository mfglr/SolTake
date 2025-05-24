using SolTake.Application.Queries.StoryDomain;
using SolTake.Domain.StoryAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
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
