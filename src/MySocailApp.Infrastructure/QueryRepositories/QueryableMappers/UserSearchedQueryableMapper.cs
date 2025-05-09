﻿using MySocailApp.Application.Queries.UserDomain;
using MySocailApp.Domain.UserUserSearchAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class UserSearchedQueryableMapper
    {
        public static IQueryable<UserUserSearchResponseDto> ToUserVisitedResponseDto(this IQueryable<UserUserSearch> query, AppDbContext context)
            => query
                .Join(
                    context.Users,
                    uuv => uuv.SearchedId,
                    user => user.Id,
                    (uuv, user) => new UserUserSearchResponseDto(
                        uuv.Id,
                        uuv.SearchedId,
                        user.UserName.Value,
                        user.Name,
                        user.Image
                    )
                );
    }
}
