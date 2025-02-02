using AccountDomain.AccountAggregate.ValueObjects;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserSaveQueryableMappers
    {
        public static IQueryable<SolutionUserSaveResponseDto> ToSolutionUserSaveResponseDto(this IQueryable<SolutionUserSave> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    sus => sus.UserId,
                    account => account.Id,
                    (sus, account) => new { sus, account }
                )
                .Join(
                    context.Users,
                    join => join.sus.UserId,
                    user => user.Id,
                    (join,user) => new { join, user }
                )
                .Join(
                    context.Solutions,
                    join1 => join1.join.sus.SolutionId,
                    solution => solution.Id,
                    (join1, solution) => new { join1, solution }
                )
                .Join(
                    context.Questions,
                    join2 => join2.solution.QuestionId,
                    question => question.Id,
                    (join2, question) => new SolutionUserSaveResponseDto(
                        join2.join1.join.sus.Id,
                        join2.join1.join.sus.CreatedAt,
                        join2.join1.join.sus.SolutionId,
                        join2.join1.join.sus.UserId,
                        new(
                            join2.solution.Id,
                            join2.solution.CreatedAt,
                            join2.solution.UpdatedAt,
                            join2.solution.QuestionId,
                            join2.join1.join.account.UserName.Value,
                            join2.solution.UserId,
                            join2.solution.Content.Value,
                            join2.solution.Votes.Any(v => v.UserId == accountId && v.Type == SolutionVoteType.Upvote),
                            join2.solution.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                            join2.solution.Votes.Any(v => v.UserId == accountId && v.Type == SolutionVoteType.Downvote),
                            join2.solution.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                            context.Comments.Count(c => c.SolutionId == join2.solution.Id),
                            join2.solution.State,
                            join2.solution.UserId == accountId,
                            join2.solution.Savers.Any(s => s.UserId == accountId),
                            question.UserId == accountId,
                            join2.solution.Medias.Select(
                                i => new SolutionMediaResponseDto(
                                    i.Id,
                                    i.SolutionId,
                                    i.ContainerName,
                                    i.BlobName,
                                    i.BlobNameOfFrame,
                                    i.Size,
                                    i.Height,
                                    i.Width,
                                    i.Duration,
                                    i.MultimediaType
                                )
                            ),
                            join2.join1.user.Image,
                            join2.join1.join.account.AccountType == AccountType.AI
                        )
                    )
                );
    }
}
