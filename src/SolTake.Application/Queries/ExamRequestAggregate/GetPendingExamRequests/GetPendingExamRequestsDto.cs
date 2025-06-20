using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.ExamRequestAggregate.GetPendingExamRequests
{
    public record GetPendingExamRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<ExamRequestResponseDto>>;
}
