using AutoMapper;
using MediatR;
using MySocailApp.Domain.QuestionAggregate.Repositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsByExamId
{
    public class GetQuestionsByExamIdHandler(IMapper mapper, IQuestionReadRepository repository) : IRequestHandler<GetQuestionsByExamIdDto, List<QuestionResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IQuestionReadRepository _repository = repository;

        public async Task<List<QuestionResponseDto>> Handle(GetQuestionsByExamIdDto request, CancellationToken cancellationToken)
        {
            var questions = await _repository.GetByExamIdAsync(request.ExamId,request.LastId,cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
