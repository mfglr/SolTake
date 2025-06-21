using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.SubjectRequestAggregate.GetPendingSubjectRequests
{
    public class GetPendingSubejctRequestsHandler(ISubjectRequestQueryRepository subjectRequestQueryRepository) : IRequestHandler<GetPendingSubjectRequestsDto, List<SubjectRequestResponseDto>>
    {
        private readonly ISubjectRequestQueryRepository _subjectRequestQueryRepository = subjectRequestQueryRepository;

        public Task<List<SubjectRequestResponseDto>> Handle(GetPendingSubjectRequestsDto request, CancellationToken cancellationToken) => _subjectRequestQueryRepository.GetPendingsAsync(request, cancellationToken);
    }
}
