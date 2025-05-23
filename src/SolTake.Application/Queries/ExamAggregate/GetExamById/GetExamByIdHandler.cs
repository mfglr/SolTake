using AutoMapper;
using MediatR;
using SolTake.Domain.ExamAggregate.Exceptions;
using SolTake.Domain.ExamAggregate.Interfaces;

namespace SolTake.Application.Queries.ExamAggregate.GetExamById
{
    public class GetExamByIdHandler(IExamReadRepository examReadRepository, IMapper mapper) : IRequestHandler<GetExamByIdDto, ExamResponseDto>
    {
        private readonly IExamReadRepository _examReadRepository = examReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<ExamResponseDto> Handle(GetExamByIdDto request, CancellationToken cancellationToken)
        {
            var exam =
                await _examReadRepository.GetByIdAsync(request.ExamId, cancellationToken) ??
                throw new ExamNotFoundException();
            return _mapper.Map<ExamResponseDto>(exam);
        }
    }
}
