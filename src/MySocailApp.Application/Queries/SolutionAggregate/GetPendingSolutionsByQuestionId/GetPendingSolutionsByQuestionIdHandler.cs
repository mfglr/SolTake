using AutoMapper;
using MediatR;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetPendingSolutionsByQuestionId
{
    public class GetPendingSolutionsByQuestionIdHandler(ISolutionReadRepository solutionReadRepository, IMapper mapper) : IRequestHandler<GetPendingSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<SolutionResponseDto>> Handle(GetPendingSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var solutions = await _solutionReadRepository.GetPendingSolutionsByQuestionId(request.QuestionId, request, cancellationToken);
            return _mapper.Map<List<SolutionResponseDto>>(solutions);
        }
    }
}
