using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetFollowedsQuestions
{
    public class GetFollowedsQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetFollowedsQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetFollowedsQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetFollowedsQuestionsAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
