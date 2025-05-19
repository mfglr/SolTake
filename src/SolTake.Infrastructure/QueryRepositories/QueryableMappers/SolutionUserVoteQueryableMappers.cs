using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Domain.SolutionUserVoteAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
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
