using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.GetQuestionsByExamId
{
    public class GetQuestionsByExamIdHandler(IQuestionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionsByExamIdDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _repository = repository;

        public Task<List<QuestionResponseDto>> Handle(GetQuestionsByExamIdDto request, CancellationToken cancellationToken)
            => _repository.GetExamQuestionsAsync(
                    request.ExamId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
