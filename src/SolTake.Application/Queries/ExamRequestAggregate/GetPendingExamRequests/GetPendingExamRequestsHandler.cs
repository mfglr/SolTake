using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.ExamRequestAggregate.GetPendingExamRequests
{
    public class GetPendingExamRequestsHandler(IExamRequestQueryRepository examRequestQueryRepository) : IRequestHandler<GetPendingExamRequestsDto, List<ExamRequestResponseDto>>
    {
        private readonly IExamRequestQueryRepository _examRequestQueryRepository = examRequestQueryRepository;

        public Task<List<ExamRequestResponseDto>> Handle(GetPendingExamRequestsDto request, CancellationToken cancellationToken)
            => _examRequestQueryRepository.GetPendingExamRequestsAsync(request, cancellationToken);
    }
}
