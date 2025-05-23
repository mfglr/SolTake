using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.GetVideoQuestions
{
    public class GetVideoQuestionsHandler(IQuestionQueryRepository questionQueryRepository,IAccessTokenReader accessTokenReader) : IRequestHandler<GetVideoQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;

        public Task<List<QuestionResponseDto>> Handle(GetVideoQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository.GetVideoQuestionsAsync(_accessTokenReader.GetAccountId(), request, cancellationToken);
    }
}
