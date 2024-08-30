using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetIncorrectsSolutionsByQuestionId
{
    public class GetIncorrectSolutionsByQuestionIdHandler(ISolutionQueryRepository solutionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetIncorrectSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly ISolutionQueryRepository _solutionQueryRepository = solutionQueryRepository;

        public Task<List<SolutionResponseDto>> Handle(GetIncorrectSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
            => _solutionQueryRepository
                .GetIncorrectSolutionsByQuestionId(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.QuestionId,
                    cancellationToken
                );
    }
}
