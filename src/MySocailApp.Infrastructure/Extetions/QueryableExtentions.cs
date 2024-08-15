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
        public static IQueryable<T> ToPage<T>(this IQueryable<T> query, int? offset, int? take, bool isDescending = true) where T : IPaginableAggregateRoot
        {
            if (isDescending)
                return query
                    .Where(x => offset == null || x.Id < offset)
                    .OrderByDescending(x => x.Id).Take(take ?? 20);
            return query
                .Where(x => offset == null || x.Id > offset)
                .OrderBy(x => x.Id)
                .Take(take ?? 20);
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
                .Include(x => x.Question)
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
