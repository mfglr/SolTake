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
                join u in context.Users on n.UserId equals u.Id
                join c in context.Comments on n.CommentId equals c.Id into cList from c in cList.DefaultIfEmpty()
                select new NotificationResponseDto(
                     n.Id,
                     n.CreatedAt,
                     n.OwnerId,
                     n.UserId,
                     u.UserName.Value,
                     n.IsViewed,
                     n.Type,
                     n.ParentId,
                     n.RepliedId,
                     n.CommentId,
                     c.Content.Value,
                     n.QuestionId,
                     n.SolutionId,
                     u.Image
                 );
    }
}
