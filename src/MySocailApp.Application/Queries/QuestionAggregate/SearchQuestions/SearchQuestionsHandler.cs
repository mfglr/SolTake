using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.SearchQuestions
{
    public class SearchQuestionsHandler(IQuestionReadRepository questionReadRepository, IMapper mapper) : IRequestHandler<SearchQuestionsDto, List<QuestionResponseDto>>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<QuestionResponseDto>> Handle(SearchQuestionsDto request, CancellationToken cancellationToken)
        {
            var questions = await _questionReadRepository.SearchQuestions(request.Key, request.ExamId, request.SubjectId, request.TopicId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
