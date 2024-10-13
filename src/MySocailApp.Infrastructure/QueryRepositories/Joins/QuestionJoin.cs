using MySocailApp.Domain.QuestionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.Joins
{
    public static class QuestionJoin
    {
        public static void JoinQuestion(this IQueryable<Question> query,AppDbContext context)
        {
            //query
            //    .Join(context.Users, q => q.AppUserId, a => a.Id, (q, a) => new { q, a })
            //    .Join(context.Exams, j0 => j0.q.ExamId, e => e.Id, (j0, e) => new { j0, e })
            //    .Join(context.Subjects, j1 => j1.j0.q.SubjectId, s => s.Id, (j1, s) => new { j1, s })
            //    .Join(context.Topics, j2 => j2.j1.j0.q.Topics)

                
        }
    }
}
