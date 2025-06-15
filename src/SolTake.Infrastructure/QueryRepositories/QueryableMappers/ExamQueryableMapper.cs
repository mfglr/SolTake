using SolTake.Application.Queries.ExamAggregate;
using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class ExamQueryableMapper
    {
        public static IQueryable<ExamResponseDto> ToExamResponseDto(this IQueryable<Exam> exams)
            => exams
                .Select(
                    x => new ExamResponseDto(
                        x.Id,
                        x.Name.Value,
                        x.Initialism.Value
                    )
                );
        
    }
}
