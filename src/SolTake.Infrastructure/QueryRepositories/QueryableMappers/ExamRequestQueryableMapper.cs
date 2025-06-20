using SolTake.Application.Queries.ExamRequestAggregate;
using SolTake.Domain.ExamRequestAggregate.Entities;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class ExamRequestQueryableMapper
    {
        public static IQueryable<ExamRequestResponseDto> ToExamRequestResponseDto(this IQueryable<ExamRequest> examRequests)
            => examRequests
                .Select(
                    x => new ExamRequestResponseDto(
                        x.Id,
                        x.CreatedAt,
                        x.Name.Value,
                        x.Initialism.Value,
                        x.State,
                        x.Reason
                    )
                );
    }
}
