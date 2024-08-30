using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.QuestionAggregate.Get;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestions
{
    public class GetQuestionsByUserIdHandler(IQuestionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionsByUserIdDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _repository = repository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetQuestionsByUserIdDto request, CancellationToken cancellationToken)
            => _repository.GetUserQuestionsAsync(
                    request.UserId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
