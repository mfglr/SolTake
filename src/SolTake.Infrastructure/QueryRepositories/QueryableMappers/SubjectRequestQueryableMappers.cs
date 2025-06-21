using SolTake.Application.Queries.SubjectRequestAggregate;
using SolTake.Domain.SubjectRequestAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class SubjectRequestQueryableMappers
    {
        public static IQueryable<SubjectRequestResponseDto> ToSubjectRequestResponseDto(this IQueryable<SubjectRequest> query, AppDbContext context)
            => query
                .Join(
                    context.Exams,
                    sr => sr.ExamId,
                    e => e.Id,
                    (sr, e) => new SubjectRequestResponseDto(
                        sr.Id,
                        sr.CreatedAt,
                        sr.SubjectName.Value,
                        sr.ExamId,
                        e.Name.Value,
                        sr.State,
                        sr.Reason
                    )
                );
    }
}
