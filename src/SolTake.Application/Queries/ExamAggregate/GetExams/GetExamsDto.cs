using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.ExamAggregate.GetExams
{
    public record GetExamsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<ExamResponseDto>>;
}
