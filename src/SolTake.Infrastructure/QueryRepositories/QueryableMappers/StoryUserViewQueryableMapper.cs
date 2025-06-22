using SolTake.Application.Queries.StoryDomain;
using SolTake.Domain.StoryUserViewAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class StoryUserViewQueryableMapper
    {
        public static IQueryable<StoryUserViewResponseDto> ToStoryUserViewResponseDto(this IQueryable<StoryUserView> query, AppDbContext _context)
            => query
                .Join(
                    _context.Users,
                    story => story.UserId,
                    user => user.Id,
                    (story,user) => new StoryUserViewResponseDto(
                        story.Id,
                        story.CreatedAt,
                        story.UserId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );

    }
}
