using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.GetAllNotPublishedQuestions
{
    public class GetAllNotPublishedQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetAllNotPublishedQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        public Task<List<QuestionResponseDto>> Handle(GetAllNotPublishedQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetAllNotPublishedQuestionsAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
