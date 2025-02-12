using AccountDomain.AccountAggregate.ValueObjects;
using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> ToSolutionResponseDto(this IQueryable<Solution> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Accounts,
                    solution => solution.UserId,
                    account => account.Id,
                    (solution, account) => new { solution, account }
                )
                .Join(
                    context.Users,
                    join => join.solution.UserId,
                    user => user.Id,
                    (join,user) => new { join, user }
                )
                .Join(
                    context.Questions,
                    join1 => join1.join.solution.QuestionId,
                    question => question.Id,
                    (join1, question) => new SolutionResponseDto(
                        join1.join.solution.Id,
                        join1.join.solution.CreatedAt,
                        join1.join.solution.UpdatedAt,
                        join1.join.solution.QuestionId,
                        join1.join.account.UserName.Value,
                        join1.join.solution.UserId,
                        join1.join.solution.Content.Value,
                        join1.join.solution.Votes.Any(v => v.UserId == accountId && v.Type == SolutionVoteType.Upvote),
                        join1.join.solution.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                        join1.join.solution.Votes.Any(v => v.UserId == accountId && v.Type == SolutionVoteType.Downvote),
                        join1.join.solution.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                        context.Comments.Count(c => c.SolutionId == join1.join.solution.Id),
                        join1.join.solution.State,
                        join1.join.solution.UserId == accountId,
                        join1.join.solution.Savers.Any(x => x.UserId == accountId),
                        question.UserId == accountId,
                        join1.join.solution.Medias.Select(
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
                        join1.user.Image,
                        join1.join.solution.IsCreatedByAI,
                        join1.join.solution.Model.Name
                    )
                );




    }
}
