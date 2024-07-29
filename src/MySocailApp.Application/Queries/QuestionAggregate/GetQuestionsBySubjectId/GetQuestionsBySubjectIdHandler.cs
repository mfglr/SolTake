using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.QuestionAggregate.GetQuestionsBySubjectId;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionBySubjectId
{
    public class GetQuestionsBySubjectIdHandler(IMapper mapper, IQuestionReadRepository repository) : IRequestHandler<GetQuestionsBySubjectIdDto, List<QuestionResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IQuestionReadRepository _repository = repository;

        public async Task<List<QuestionResponseDto>> Handle(GetQuestionsBySubjectIdDto request, CancellationToken cancellationToken)
        {
            var questions = await _repository.GetBySubjectIdAsync(request.SubjectId, request.LastId, cancellationToken);
            return _mapper.Map<List<QuestionResponseDto>>(questions);
        }
    }
}
