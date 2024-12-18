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
                    sus => sus.AppUserId,
                    account => account.Id,
                    (sus, account) => new { sus, account.UserName }
                )
                .Join(
                    context.Solutions,
                    join0 => join0.sus.SolutionId,
                    solution => solution.Id,
                    (join0, solution) => new { join0, solution }
                )
                .Join(
                    context.Questions,
                    join1 => join1.solution.QuestionId,
                    question => question.Id,
                    (join1, question) => new SolutionUserSaveResponseDto(
                        join1.join0.sus.Id,
                        join1.join0.sus.CreatedAt,
                        join1.join0.sus.SolutionId,
                        join1.join0.sus.AppUserId,
                        new(
                            join1.solution.Id,
                            join1.solution.CreatedAt,
                            join1.solution.UpdatedAt,
                            join1.solution.QuestionId,
                            join1.join0.UserName.Value,
                            join1.solution.AppUserId,
                            join1.solution.Content.Value,
                            join1.solution.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Upvote),
                            join1.solution.Votes.Count(v => v.Type == SolutionVoteType.Upvote),
                            join1.solution.Votes.Any(v => v.AppUserId == accountId && v.Type == SolutionVoteType.Downvote),
                            join1.solution.Votes.Count(v => v.Type == SolutionVoteType.Downvote),
                            context.Comments.Count(c => c.SolutionId == join1.solution.Id),
                            join1.solution.State,
                            join1.solution.AppUserId == accountId,
                            join1.solution.Savers.Any(s => s.AppUserId == accountId),
                            join1.solution.HasVideo,
                            question.UserId == accountId,
                            join1.solution.Medias.Select(
                                i => new SolutionMediaResponseDto(
                                    i.Id,
                                    i.SolutionId,
                                    i.BlobName,
                                    i.Size,
                                    i.Height,
                                    i.Width,
                                    i.Duration,
                                    i.MediaType
                                )
                            )
                        )
                    )
                );



    }
}
