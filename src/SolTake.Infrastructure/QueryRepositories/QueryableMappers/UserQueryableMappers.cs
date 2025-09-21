using SolTake.Application.Queries.UserDomain;
using SolTake.Domain.QuestionAggregate.ValueObjects;
using SolTake.Domain.UserAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class UserQueryableMappers
    {
        public static IQueryable<UserResponseDto> ToUserResponseDto(this IQueryable<User> query, AppDbContext context, int? forUserId)
            => query
                .GroupJoin(
                    context.Stories,
                    user => user.Id,
                    story => story.UserId,
                    (user,stories) => new UserResponseDto(
                        user.Id,
                        user.CreatedAt,
                        user.UpdatedAt,
                        user.UserName.Value,
                        user.Name,
                        user.Biography.Value,
                        context.Questions.Count(
                            question =>
                                question.UserId == user.Id &&
                                (
                                    question.PublishingState == QuestionPublishingState.Published ||
                                    question.UserId == forUserId
                                )
                        ),
                        context.UserUserFollows.Count(follow => follow.FollowedId == user.Id),
                        context.UserUserFollows.Count(follow => follow.FollowerId == user.Id),
                        context.UserUserFollows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == forUserId),
                        context.UserUserFollows.Any(follow => follow.FollowerId == forUserId && follow.FollowedId == user.Id),
                        forUserId == user.Id,
                        user.Image,
                        stories
                            .Where(story => DateTime.UtcNow <= story.CreatedAt.AddDays(1))
                            .Select(
                                (story) => new UserStoryResponseDto(
                                    story.Id,
                                    story.CreatedAt,
                                    context.StoryUserViews.Any(suv => suv.StoryId == story.Id && suv.UserId == forUserId),
                                    story.Media
                                )
                            )
                    )
                );
    }
}
