using AutoMapper;
using MediatR;
using MySocailApp.Domain.SubjectAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SubjectAggregate.GetByExamId
{
    public class GetSubjectsByExamIdHandler(IMapper mapper, ISubjectReadRepository repository) : IRequestHandler<GetSubjectsByExamIdDto, List<SubjectResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ISubjectReadRepository _repository = repository;

        public async Task<List<SubjectResponseDto>> Handle(GetSubjectsByExamIdDto request, CancellationToken cancellationToken)
        {
            var subjects = await _repository.GetByExamIdAsync(request.ExamId, cancellationToken);
            return _mapper.Map<List<SubjectResponseDto>>(subjects);
        }
    }
}
