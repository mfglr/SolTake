using SolTake.Application.Queries.SolutionDomain;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Domain.SolutionUserSaveAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class SolutionUserSaveQueryableMappers
    {
        public static IQueryable<SolutionUserSaveResponseDto> ToSolutionUserSaveResponseDto(this IQueryable<SolutionUserSave> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    sus => sus.UserId,
                    user => user.Id,
                    (sus,user) => new { sus, user }
                )
                .Join(
                    context.Solutions,
                    join => join.sus.SolutionId,
                    solution => solution.Id,
                    (join, solution) => new { join, solution }
                )
                .Join(
                    context.AIModels,
                    join1 => join1.solution.AIModelId,
                    aIModel => aIModel.Id,
                    (join1, aIModel) => new {join1, aIModel}
                )
                .Join(
                    context.Questions,
                    join2 => join2.join1.solution.QuestionId,
                    question => question.Id,
                    (join2, question) => new SolutionUserSaveResponseDto(
                        join2.join1.join.sus.Id,
                        new(
                            join2.join1.solution.Id,
                            join2.join1.solution.CreatedAt,
                            join2.join1.solution.UpdatedAt,
                            join2.join1.solution.QuestionId,
                            join2.join1.join.user.UserName.Value,
                            join2.join1.solution.UserId,
                            join2.join1.solution.Content.Value,
                            context.SolutionUserVotes.Any(v => v.SolutionId == join2.join1.solution.Id && v.UserId == accountId && v.Type == SolutionVoteType.Upvote),
                            context.SolutionUserVotes.Count(v => v.SolutionId == join2.join1.solution.Id && v.Type == SolutionVoteType.Upvote),
                            context.SolutionUserVotes.Any(v => v.SolutionId == join2.join1.solution.Id && v.UserId == accountId && v.Type == SolutionVoteType.Downvote),
                            context.SolutionUserVotes.Count(v => v.SolutionId == join2.join1.solution.Id && v.Type == SolutionVoteType.Downvote),
                            context.Comments.Count(c => c.SolutionId == join2.join1.solution.Id),
                            join2.join1.solution.State,
                            join2.join1.solution.UserId == accountId,
                            context.SolutionUserSaves.Any(sus => sus.UserId == accountId && sus.SolutionId == join2.join1.solution.Id),
                            question.UserId == accountId,
                            join2.join1.solution.Medias,
                            join2.join1.join.user.Image,
                            join2.join1.solution.IsCreatedByAI,
                            join2.aIModel.Id,
                            join2.aIModel.Name.Value,
                            join2.aIModel.Image
                        )
                    )
                );
    }
}
