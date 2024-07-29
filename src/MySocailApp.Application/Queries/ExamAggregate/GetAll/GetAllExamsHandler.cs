using AutoMapper;
using MediatR;
using MySocailApp.Domain.ExamAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ExamAggregate.GetAll
{
    public class GetAllExamsHandler(IMapper mapper, IExamReadRepository repository) : IRequestHandler<GetAllExamsDto, List<ExamResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IExamReadRepository _repository = repository;

        public async Task<List<ExamResponseDto>> Handle(GetAllExamsDto request, CancellationToken cancellationToken)
            => _mapper.Map<List<ExamResponseDto>>(await _repository.GetAllAsync(cancellationToken));
    }
}
