using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.QuestionAggregate.Get;
using MySocailApp.Application.Services;
using MySocailApp.Domain.QuestionAggregate;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestions
{
    public class GetQuestionsHandler(IAccessTokenReader reader, IQuestionReadRepository repository, IMapper mapper) : IRequestHandler<GetQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IAccessTokenReader _reader = reader;
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<QuestionResponseDto>> Handle(GetQuestionsDto request, CancellationToken cancellationToken)
        {
            var accountId = _reader.GetRequiredAccountId();
            var questions = await _repository.GetByUserIdAsync(accountId, request.LastId, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
