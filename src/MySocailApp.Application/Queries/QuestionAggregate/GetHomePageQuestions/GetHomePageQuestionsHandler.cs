using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetHomePageQuestions
{
    public class GetHomePageQuestionsHandler(IQuestionReadRepository repository, IMapper mapper, IAccessTokenReader accessTokenReader) : IRequestHandler<GetHomePageQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<List<QuestionResponseDto>> Handle(GetHomePageQuestionsDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();
            var questions = await _repository.GetHomePageQuestionsAsync(userId, request.LastValue, request.Take, request.IsDescending, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
