using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Domain.NotificationDomain.NotificationAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class NotificationQuerableMapper
    {
        public static IQueryable<NotificationResponseDto> ToNotificationResponseDto(this IQueryable<Notification> query, AppDbContext context)
            =>
                from n in query
                join a in context.Accounts on n.AppUserId equals a.Id
                join c in context.Comments on n.CommentId equals c.Id into cList from c in cList.DefaultIfEmpty()
                select new NotificationResponseDto(
                     n.Id,
                     n.CreatedAt,
                     n.OwnerId,
                     n.AppUserId,
                     a.UserName.Value,
                     n.IsViewed,
                     n.Type,
                     n.ParentId,
                     n.RepliedId,
                     n.CommentId,
                     c.Content.Value,
                     n.QuestionId,
                     n.SolutionId
                 );
    }
}
