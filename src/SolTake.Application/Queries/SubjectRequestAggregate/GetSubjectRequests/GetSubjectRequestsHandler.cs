using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.SubjectRequestAggregate.GetSubjectRequests
{
    public class GetSubjectRequestsHandler(ISubjectRequestQueryRepository subjectRequestQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSubjectRequestsDto, List<SubjectRequestResponseDto>>
    {
        private readonly ISubjectRequestQueryRepository _subjectRequestQueryRepository = subjectRequestQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<SubjectRequestResponseDto>> Handle(GetSubjectRequestsDto request, CancellationToken cancellationToken)
            => _subjectRequestQueryRepository
                .GetByUserId(_accessTokenReader.GetRequiredAccountId(), request, cancellationToken);
    }
}
