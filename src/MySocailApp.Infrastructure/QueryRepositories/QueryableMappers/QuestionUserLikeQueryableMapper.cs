﻿using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserLikeQueryableMapper
    {
        public static IQueryable<QuestionUserLikeResponseDto> ToQuestionUserLikeResponseDto(this IQueryable<QuestionUserLike> query, AppDbContext context, int accountId)
            => query
                .Join(
                    context.Users,
                    qul => qul.AppUserId,
                    account => account.Id,
                    (qul, account) => new { qul, account.UserName }
                )
                .Join(
                    context.AppUsers,
                    join => join.qul.AppUserId,
                    user => user.Id,
                    (join, user) => new QuestionUserLikeResponseDto(
                        join.qul.Id,
                        join.qul.CreatedAt,
                        join.qul.QuestionId,
                        join.qul.AppUserId,
                        new AppUserResponseDto(
                            user.Id,
                            user.CreatedAt,
                            user.UpdatedAt,
                            join.UserName!,
                            user.Name,
                            user.Biography.Value,
                            user.HasImage,
                            context.Questions.Count(q => q.AppUserId == user.Id),
                            context.Follows.Count(f => f.FollowedId == user.Id),
                            context.Follows.Count(f => f.FollowerId == user.Id),
                            context.Follows.Any(f => f.FollowerId == user.Id && f.FollowedId == accountId),
                            context.Follows.Any(f => f.FollowerId == accountId && f.FollowedId == user.Id)
                        )
                    )
                );


    }
}
