using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.ExamRequestAggregate.GetExamRequests
{
    public record GetExamRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<ExamRequestResponseDto>>;
}
