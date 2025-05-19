using AutoMapper;
using MediatR;
using SolTake.Domain.ExamAggregate.Interfaces;

namespace MySocailApp.Application.Queries.ExamAggregate.GetExams
{
    public class GetExamsHandler(IMapper mapper, IExamReadRepository repository) : IRequestHandler<GetExamsDto, List<ExamResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly IExamReadRepository _repository = repository;

        public async Task<List<ExamResponseDto>> Handle(GetExamsDto request, CancellationToken cancellationToken)
            => _mapper.Map<List<ExamResponseDto>>(await _repository.GetAllAsync(cancellationToken));
    }
}
