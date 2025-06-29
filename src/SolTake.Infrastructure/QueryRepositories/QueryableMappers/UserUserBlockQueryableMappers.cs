﻿using SolTake.Application.Queries.UserDomain;
using SolTake.Domain.UserUserBlockAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class UserUserBlockQueryableMappers
    {
        public static IQueryable<UserUserBlockResponseDto> ToUserUserBlockResponseDto(this IQueryable<UserUserBlock> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    userUserBlock => userUserBlock.BlockedId,
                    user => user.Id,
                    (userUserBlock, user) => new UserUserBlockResponseDto(
                        userUserBlock.Id,
                        userUserBlock.BlockedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );
    }
}
