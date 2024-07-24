using Microsoft.EntityFrameworkCore;
using MySocailApp.Core;
using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Domain.QuestionCommentAggregate.Entities;

namespace MySocailApp.Infrastructure.Extetions
{
    public static class QueryableExtentions
    {
        public static IQueryable<T> ToPage<T>(this IQueryable<T> query, int? lastId, int take) where T : IAggregateRoot
            => query
                .Where(x => lastId == null || x.Id < lastId)
                .OrderByDescending(x => x.Id)
                .Take(take);

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

        public static IQueryable<QuestionComment> IncludeForQuestionComment(this IQueryable<QuestionComment> query)
            => query
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes);

    }
}
