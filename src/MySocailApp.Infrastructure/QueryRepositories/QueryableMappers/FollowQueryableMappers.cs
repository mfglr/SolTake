﻿using MySocailApp.Application.Queries.UserDomain.GetFollowedsByUserId;
using MySocailApp.Application.Queries.UserDomain.GetFollowersByUserId;
using MySocailApp.Domain.UserUserFollowAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class FollowQueryableMappers
    {
        public static IQueryable<FollowResponseDto> ToFollowerResponseDto(this IQueryable<UserUserFollow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowerId,
                    user => user.Id,
                    (follow, user) => new FollowResponseDto(
                        follow.Id,
                        follow.FollowerId,
                        user.UserName.Value,
                        user.Name,
                        user.Image,
                        context.UserUserFollows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == accountId),
                        context.UserUserFollows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id)
                    )
                );

        public static IQueryable<FollowResponseDto> ToFollowedResponseDto(this IQueryable<UserUserFollow> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    follow => follow.FollowedId,
                    user => user.Id,
                    (follow, user) => new FollowResponseDto(
                        follow.Id,
                        follow.FollowedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image,
                        context.UserUserFollows.Any(follow => follow.FollowerId == user.Id && follow.FollowedId == accountId),
                        context.UserUserFollows.Any(follow => follow.FollowerId == accountId && follow.FollowedId == user.Id)
                    )
                );
    }
}
