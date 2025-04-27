using MySocailApp.Application.Queries.StoryDomain;
using MySocailApp.Domain.StoryUserViewAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class StoryUserViewQueryableMapper
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
