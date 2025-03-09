using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserVoteQueryableMappers
    {
        public static IQueryable<SolutionUserVoteResponseDto> ToSolutionUserVoteDto(this IQueryable<SolutionUserVote> query,AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    suv => suv.UserId,
                    user => user.Id,
                    (suv,user) => new SolutionUserVoteResponseDto(
                        suv.Id,
                        suv.CreatedAt,
                        suv.SolutionId,
                        suv.UserId,
                        suv.Type,
                        new UserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            user.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            context.Questions.Count(q => q.UserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id),
                            user.Image
                        )
                    )
                );
    }
}
