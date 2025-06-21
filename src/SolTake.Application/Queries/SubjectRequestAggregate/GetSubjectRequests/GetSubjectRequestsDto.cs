using MediatR;
using SolTake.Core;

namespace SolTake.Application.Queries.SubjectRequestAggregate.GetSubjectRequests
{
    public record GetSubjectRequestsDto(int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<SubjectRequestResponseDto>>;
}
