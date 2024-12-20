using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetVideoQuestions
{
    public class GetVideoQuestionsHandler(IQuestionQueryRepository questionQueryRepository, IAccountAccessor accountAccessor) : IRequestHandler<GetVideoQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IQuestionQueryRepository _questionQueryRepository = questionQueryRepository;

        public Task<List<QuestionResponseDto>> Handle(GetVideoQuestionsDto request, CancellationToken cancellationToken)
            => _questionQueryRepository.GetVideoQuestionsAsync(_accountAccessor.Account.Id, request, cancellationToken);

    }
}
