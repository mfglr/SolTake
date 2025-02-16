using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetSavedQuestions
{
    public class GetSavedQuestionsHandler(IQuestionUserSaveQueryRepository questionUserSaveQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetSavedQuestionsDto, List<QuestionUserSaveResponseDto>>
    {
        private readonly IQuestionUserSaveQueryRepository _questionUserSaveQueryRepository = questionUserSaveQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionUserSaveResponseDto>> Handle(GetSavedQuestionsDto request, CancellationToken cancellationToken)
            => _questionUserSaveQueryRepository
                .GetSavesAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
