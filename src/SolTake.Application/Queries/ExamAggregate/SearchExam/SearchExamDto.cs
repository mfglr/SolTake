using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.ExamAggregate.SearchExam
{
    public record SearchExamDto(string? Key, int? Offset, int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<ExamResponseDto>>;
}
