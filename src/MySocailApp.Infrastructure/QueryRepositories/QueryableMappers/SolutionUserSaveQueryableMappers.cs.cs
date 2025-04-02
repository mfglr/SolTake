using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionUserSaveQueryableMappers
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
                    context.Questions,
                    join1 => join1.solution.QuestionId,
                    question => question.Id,
                    (join1, question) => new SolutionUserSaveResponseDto(
                        join1.join.sus.Id,
                        new(
                            join1.solution.Id,
                            join1.solution.CreatedAt,
                            join1.solution.UpdatedAt,
                            join1.solution.QuestionId,
                            join1.join.user.UserName.Value,
                            join1.solution.UserId,
                            join1.solution.Content.Value,
                            context.SolutionUserVotes.Any(v => v.SolutionId == join1.solution.Id && v.UserId == accountId && v.Type == SolutionVoteType.Upvote),
                            context.SolutionUserVotes.Count(v => v.SolutionId == join1.solution.Id && v.Type == SolutionVoteType.Upvote),
                            context.SolutionUserVotes.Any(v => v.SolutionId == join1.solution.Id && v.UserId == accountId && v.Type == SolutionVoteType.Downvote),
                            context.SolutionUserVotes.Count(v => v.SolutionId == join1.solution.Id && v.Type == SolutionVoteType.Downvote),
                            context.Comments.Count(c => c.SolutionId == join1.solution.Id),
                            join1.solution.State,
                            join1.solution.UserId == accountId,
                            context.SolutionUserSaves.Any(sus => sus.UserId == accountId && sus.SolutionId == join1.solution.Id),
                            question.UserId == accountId,
                            join1.solution.Medias,
                            join1.join.user.Image,
                            join1.solution.IsCreatedByAI,
                            join1.solution.Model.Name
                        )
                    )
                );
    }
}
