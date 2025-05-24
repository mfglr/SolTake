using SolTake.Application.Queries.NotificationAggregate;
using SolTake.Domain.NotificationDomain.NotificationAggregate.Entities;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class NotificationQuerableMapper
    {
        public static IQueryable<NotificationResponseDto> ToNotificationResponseDto(this IQueryable<Notification> query)
            => query
                .Select(
                    x =>
                        new NotificationResponseDto(
                            x.Id,
                            x.CreatedAt,
                            x.OwnerId,
                            x.Type,
                            x.IsViewed,
                            x.UserId,
                            x.UserName,
                            x.Image,
                            x.QuestionId,
                            x.QuestionContent,
                            x.QuestionMedia,
                            x.CommentId,
                            x.CommentContent,
                            x.SolutionId,
                            x.SolutionContent,
                            x.SolutionMedia,
                            x.RepliedId,
                            x.RepliedContent,
                            x.SolutionVoteType
                        )
                );
    }
}
