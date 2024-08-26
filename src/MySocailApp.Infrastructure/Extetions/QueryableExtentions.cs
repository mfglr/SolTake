using Microsoft.EntityFrameworkCore;
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
        public static IQueryable<T> ToPage<T>(this IQueryable<T> query, IPagination pagination) where T : IPaginableAggregateRoot
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

        public static IQueryable<Question> IncludeForQuestion(this IQueryable<Question> query)
            => query
                .Include(x => x.Exam)
                .Include(x => x.Subject)
                .Include(x => x.Images)
                .Include(x => x.Topics)
                .ThenInclude(x => x.Topic)
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes)
                .Include(x => x.Solutions)
                .Include(x => x.Comments);

        public static IQueryable<Comment> IncludeForComment(this IQueryable<Comment> query)
            => query
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes)
                .Include(x => x.Children)
                .Include(x => x.Tags)
                .ThenInclude(x => x.AppUser)
                .ThenInclude(x => x.Account);

        public static IQueryable<Solution> IncludeForSolution(this IQueryable<Solution> query)
            => query
                .Include(x => x.Images)
                .Include(x => x.Votes)
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Comments);

        public static IQueryable<AppUser> IncludeForUser(this IQueryable<AppUser> query)
            => query
                .Include(x => x.Account)
                .Include(x => x.Questions)
                .Include(x => x.Followers)
                .Include(x => x.Followeds);

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
