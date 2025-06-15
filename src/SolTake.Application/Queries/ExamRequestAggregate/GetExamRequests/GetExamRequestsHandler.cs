using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.ExamRequestAggregate.GetExamRequests
{
    public class GetExamRequestsHandler(IAccessTokenReader accessTokenReader, IExamRequestQueryRepository examRequestQueryRepository) : IRequestHandler<GetExamRequestsDto, List<ExamRequestResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IExamRequestQueryRepository _examRequestQueryRepository = examRequestQueryRepository;

        public Task<List<ExamRequestResponseDto>> Handle(GetExamRequestsDto request, CancellationToken cancellationToken)
            => _examRequestQueryRepository.GetExamRequestsByUserIdAsync(_accessTokenReader.GetRequiredAccountId(),request, cancellationToken);
    }
}
