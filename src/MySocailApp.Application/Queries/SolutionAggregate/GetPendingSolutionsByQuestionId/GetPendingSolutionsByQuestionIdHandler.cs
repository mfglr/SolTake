using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetPendingSolutionsByQuestionId
{
    public class GetPendingSolutionsByQuestionIdHandler(ISolutionQueryRepository solutionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetPendingSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public Task<List<SolutionResponseDto>> Handle(GetPendingSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
            => _solutionQueryRepository
                .GetPendingSolutionsByQuestionId(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
