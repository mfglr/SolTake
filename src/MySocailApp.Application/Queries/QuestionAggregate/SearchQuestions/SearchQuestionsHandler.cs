using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.SearchQuestions
{
    public class SearchQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<SearchQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;

        public Task<List<QuestionResponseDto>> Handle(SearchQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository.SearchQuestionsAsync(_accessTokenReader.GetRequiredAccountId(), request, request.ExamId, request.SubjectId, request.TopicId, cancellationToken);
    }
}
