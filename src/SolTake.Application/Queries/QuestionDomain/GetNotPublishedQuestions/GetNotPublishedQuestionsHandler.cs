using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.GetNotPublishedQuestions
{
    public class GetNotPublishedQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetNotPublishedQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetNotPublishedQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetNotPublishedQuestionsByUserId(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
