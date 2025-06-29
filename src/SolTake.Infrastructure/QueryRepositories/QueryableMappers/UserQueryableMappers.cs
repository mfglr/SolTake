﻿using SolTake.Application.Queries.UserDomain;
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
                    (user,stories) => new { user, stories }
                )
                .Select(
                    join => new UserResponseDto(
                        join.user.Id,
                        join.user.CreatedAt,
                        join.user.UpdatedAt,
                        join.user.UserName.Value,
                        join.user.Name,
                        join.user.Biography.Value,
                        context.Questions.Count(question => question.UserId == join.user.Id),
                        context.UserUserFollows.Count(follow => follow.FollowedId == join.user.Id),
                        context.UserUserFollows.Count(follow => follow.FollowerId == join.user.Id),
                        context.UserUserFollows.Any(follow => follow.FollowerId == join.user.Id && follow.FollowedId == forUserId),
                        context.UserUserFollows.Any(follow => follow.FollowerId == forUserId && follow.FollowedId == join.user.Id),
                        join.user.Image,
                        join.stories
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
