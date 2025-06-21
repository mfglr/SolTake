using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SubjectRequestAggregate.GetPendingSubjectRequests
{
    public record GetPendingSubjectRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset,Take,IsDescending), IRequest<List<SubjectRequestResponseDto>>;
}
