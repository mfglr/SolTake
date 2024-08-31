using Microsoft.EntityFrameworkCore;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.AppUserAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;

namespace MySocailApp.Infrastructure.Extetions
{
    public static class QueryableExtentions
    {
        public static IQueryable<T> ToPage<T>(this IQueryable<T> query, IPage pagination) where T : IEntity
        {
            if (pagination.IsDescending)
                return query
                    .Where(x => pagination.Offset == null || x.Id < pagination.Offset)
                    .OrderByDescending(x => x.Id)
                    .Take(pagination.Take);
            return query
                .Where(x => pagination.Offset == null || x.Id > pagination.Offset)
                .OrderBy(x => x.Id)
                .Take(pagination.Take);
        }

        public static IQueryable<Message> IncludeForMessage(this IQueryable<Message> query)
            => query
                .Include(x => x.Images)
                .Include(x => x.Viewers)
                .Include(x => x.Receivers)
                .Include(x => x.Sender)
                .ThenInclude(x => x.Account)
                .Include(x => x.Receiver)
                .ThenInclude(x => x.Account);
    }
}
