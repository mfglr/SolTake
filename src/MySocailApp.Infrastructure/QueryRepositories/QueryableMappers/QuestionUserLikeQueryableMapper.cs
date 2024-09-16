using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.QuestionAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class QuestionUserLikeQueryableMapper
    {
        public static IQueryable<QuestionUserLikeResponseDto> ToQuestionUserLikeResponseDto(this IQueryable<QuestionUserLike> query, int accountId)
            => query
                .Select(
                    x => new QuestionUserLikeResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.QuestionId,
                        x.AppUserId,
                        new AppUserResponseDto(
                            x.AppUser.Id,
                            x.AppUser.CreatedAt,
                            x.AppUser.UpdatedAt,
                            x.AppUser.Account.UserName!,
                            x.AppUser.Name,
                            x.AppUser.Biography.Value,
                            x.AppUser.HasImage,
                            x.AppUser.Questions.Count,
                            x.AppUser.Followers.Count,
                            x.AppUser.Followeds.Count,
                            x.AppUser.Followeds.Any(x => x.FollowedId == accountId),
                            x.AppUser.Followers.Any(x => x.FollowerId == accountId)
                        )
                    )
                );
    }
}
