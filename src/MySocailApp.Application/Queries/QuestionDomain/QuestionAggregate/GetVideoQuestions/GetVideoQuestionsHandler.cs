using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionDomain.QuestionAggregate.GetVideoQuestions
{
    public class GetVideoQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IUserAccessor userAccessor) : IRequestHandler<GetVideoQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;

        public Task<List<QuestionResponseDto>> Handle(GetVideoQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository.GetVideoQuestionsAsync(_userAccessor.User.Id, request, cancellationToken);
    }
}
