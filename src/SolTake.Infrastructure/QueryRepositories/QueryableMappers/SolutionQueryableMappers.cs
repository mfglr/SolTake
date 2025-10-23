using SolTake.Application.Queries.SolutionDomain;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class SolutionQueryableMappers
    {
        public static IQueryable<SolutionResponseDto> ToSolutionResponseDto(this IQueryable<Solution> query, AppDbContext context, int userId)
            => 
                (
                    from s in query
                    join a in context.AIModels
                    on s.AIModelId equals a.Id into gj
                    from aiModel in gj.DefaultIfEmpty()
                    select new { solution = s, aiModel }
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
                        join1.aiModel.Id,
                        join1.aiModel.Name.Value,
                        join1.aiModel.Image
                    )
                );




    }
}
