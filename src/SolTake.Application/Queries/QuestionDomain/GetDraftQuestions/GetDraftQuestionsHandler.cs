using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.GetDraftQuestions
{
    public class GetDraftQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetDraftQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetDraftQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetDraftQuestionsByUserId(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
