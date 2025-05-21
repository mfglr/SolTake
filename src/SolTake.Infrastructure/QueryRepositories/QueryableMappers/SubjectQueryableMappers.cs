using MySocailApp.Application.Queries.SubjectAggregate;
using SolTake.Domain.SubjectAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class SubjectQueryableMappers
    {
        public static IQueryable<SubjectResponseDto> ToSubjectResponseDto(this IQueryable<Subject> query)
            => query.Select(x => new SubjectResponseDto(x.Id,x.Name));
    }
}
