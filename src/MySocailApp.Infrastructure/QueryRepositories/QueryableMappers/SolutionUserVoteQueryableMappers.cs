using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserVoteQueryableMappers
    {

        public static IQueryable<SolutionUserVoteResponseDto> Join(this IQueryable<SolutionUserVote> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    suv => suv.AppUserId,
                    a => a.Id,
                    (suv, a) => new { suv, a }
                )
                .Join(
                    context.AppUsers,
                    j => j.suv.AppUserId,
                    u => u.Id,
                    (j, u) => new SolutionUserVoteResponseDto(
                        j.suv.Id,
                        j.suv.CreatedAt,
                        j.suv.SolutionId,
                        j.suv.AppUserId,
                        j.suv.Type,
                        new(
                             u.Id,
                             u.CreatedAt,
                             u.UpdatedAt,
                             j.a.UserName!,
                             u.Name,
                             u.Biography.Value,
                             u.HasImage,
                             context.Questions.Count(q => q.AppUserId == u.Id),
                             u.Followers.Count,
                             u.Followeds.Count,
                             u.Followeds.Any(f => f.FollowedId == accountId),
                             u.Followers.Any(f => f.FollowerId == accountId)
                        )
                    )
                );
    }
}
