using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.ApplicationServices.QueryRepositories;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsBySubjectId;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionBySubjectId
{
    public class GetQuestionsBySubjectIdHandler(IQuestionQueryRepository repository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionsBySubjectIdDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IQuestionQueryRepository _repository = repository;

        public Task<List<QuestionResponseDto>> Handle(GetQuestionsBySubjectIdDto request, CancellationToken cancellationToken)
            => _repository.GetSubjectQuestionsAsync(
                    request.SubjectId,
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    cancellationToken
                );
    }
}
