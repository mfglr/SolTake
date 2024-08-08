using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByTopicId
{
    public class GetQuestionsByTopicIdHandler(IMapper mapper, IQuestionReadRepository repository) : IRequestHandler<GetQuestionsByTopicIdDto, List<QuestionResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IQuestionReadRepository _repository = repository;

        public async Task<List<QuestionResponseDto>> Handle(GetQuestionsByTopicIdDto request, CancellationToken cancellationToken)
        {
            var questions = await _repository.GetQuestionsByTopicIdAsync(request.TopicId, request.LastValue, request.Take, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
