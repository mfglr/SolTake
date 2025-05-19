using MediatR;
using SolTake.Core;

namespace MySocailApp.Application.Queries.ExamAggregate.GetExams
{
    public record GetExamsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<ExamResponseDto>>;
}
