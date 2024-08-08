using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GerAllQuestions
{
    public class GetAllQuestionsHandler(IQuestionReadRepository repository, IMapper mapper) : IRequestHandler<GetAllQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<QuestionResponseDto>> Handle(GetAllQuestionsDto request, CancellationToken cancellationToken)
        {
            var questions = await _repository.GetAllQuestionsAsync(request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
