using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> ToSolutionResponseDto(this IQueryable<Solution> query, AppDbContext context, int userId)
            => query
                .Join(
                    context.AIModels,
                    solution => solution.AIModelId,
                    aiModels => aiModels.Id,
                    (solution, aiModel) => new { solution, aiModel }
                )
                .Join(
                    context.Users,
                    join => join.solution.UserId,
                    user => user.Id,
                    (join, user) => new { join.solution, join.aiModel, user }
                )
                .Join(
                    context.Questions,
                    join1 => join1.solution.QuestionId,
                    question => question.Id,
                    (join1, question) => new SolutionResponseDto(
                        join1.solution.Id,
                        join1.solution.CreatedAt,
                        join1.solution.UpdatedAt,
                        join1.solution.QuestionId,
                        join1.user.UserName.Value,
                        join1.solution.UserId,
                        join1.solution.Content.Value,
                        context.SolutionUserVotes.Any(v => v.SolutionId == join1.solution.Id && v.UserId == userId && v.Type == SolutionVoteType.Upvote),
                        context.SolutionUserVotes.Count(v => v.SolutionId == join1.solution.Id && v.Type == SolutionVoteType.Upvote),
                        context.SolutionUserVotes.Any(v => v.SolutionId == join1.solution.Id && v.UserId == userId && v.Type == SolutionVoteType.Downvote),
                        context.SolutionUserVotes.Count(v => v.SolutionId == join1.solution.Id && v.Type == SolutionVoteType.Downvote),
                        context.Comments.Count(c => c.SolutionId == join1.solution.Id),
                        join1.solution.State,
                        join1.solution.UserId == userId,
                        context.SolutionUserSaves.Any(sus => sus.UserId == userId && sus.SolutionId == join1.solution.Id),
                        question.UserId == userId,
                        join1.solution.Medias,
                        join1.user.Image,
                        join1.solution.IsCreatedByAI,
                        join1.aiModel.Name.Value,
                        join1.aiModel.Image
                    )
                );




    }
}
