using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.QuestionDomain.GetRejecetedQuestions
{
    public class GetRejectedQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetRejectedQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetRejectedQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetRejectedQuestionsByUserId(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
