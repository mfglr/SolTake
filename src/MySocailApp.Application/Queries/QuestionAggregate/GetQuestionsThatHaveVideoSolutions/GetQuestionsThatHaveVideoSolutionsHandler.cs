using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsThatHaveVideoSolutions
{
    public class GetQuestionsThatHaveVideoSolutionsHandler(IQuestionQueryRepository questionQueryRepository, IAccessTokenReader accessTokenReader) : IRequestHandler<GetQuestionsThatHaveVideoSolutionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public Task<List<QuestionResponseDto>> Handle(GetQuestionsThatHaveVideoSolutionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository
                .GetQuestionsThatHasSolutionVideoAsync(
                    _accessTokenReader.GetRequiredAccountId(),
                    request,
                    request.ExamId,
                    request.SubjectId,
                    request.TopicId,
                    cancellationToken
                );
    }
}
