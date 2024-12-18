using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserVoteQueryableMappers
    {
        public static IQueryable<SolutionUserVoteResponseDto> ToSolutionUserVoteDto(this IQueryable<SolutionUserVote> query,AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    suv => suv.AppUserId,
                    account => account.Id,
                    (suv,account) => new {suv, account.UserName }
                )
                .Join(
                    context.Users,
                    join => join.suv.AppUserId,
                    user => user.Id,
                    (join,user) => new SolutionUserVoteResponseDto(
                        join.suv.Id,
                        join.suv.CreatedAt,
                        join.suv.SolutionId,
                        join.suv.AppUserId,
                        join.suv.Type,
                        new AppUserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName.Value,
                            user.Name,
                            user.Biography.Value,
                            user.HasImage,
                            context.Questions.Count(q => q.UserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(x => x.FollowerId == user.Id && x.FollowedId == accountId),
                            context.Follows.Any(x => x.FollowerId == accountId && x.FollowedId == user.Id)
                        )
                    )
                );
    }
}
