using SolTake.Application.Queries.SolutionDomain;
using SolTake.Domain.SolutionUserVoteAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserVoteQueryableMappers
    {
        public static IQueryable<SolutionUserVoteResponseDto> ToSolutionUserVoteDto(this IQueryable<SolutionUserVote> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    suv => suv.UserId,
                    user => user.Id,
                    (suv,user) => new SolutionUserVoteResponseDto(
                        suv.Id,
                        suv.UserId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );
    }
}
