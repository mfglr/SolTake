using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Infrastructure.Extetions
{
    public static class QueryableExtentions
    {
        public static IQueryable<Question> IncludeForQuestion(this IQueryable<Question> query)
            => query
                .Include(x => x.Exam)
                .Include(x => x.Subject)
                .Include(x => x.Images)
                .Include(x => x.Topics)
                .ThenInclude(x => x.Topic)
                .Include(x => x.AppUser)
                .ThenInclude(x => x.Account)
                .Include(x => x.Likes);
    }
}
