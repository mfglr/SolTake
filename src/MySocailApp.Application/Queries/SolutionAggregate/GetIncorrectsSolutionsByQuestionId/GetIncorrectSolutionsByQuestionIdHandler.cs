using AutoMapper;
using MediatR;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetIncorrectsSolutionsByQuestionId
{
    public class GetIncorrectSolutionsByQuestionIdHandler(ISolutionReadRepository solutionReadRepository, IMapper mapper) : IRequestHandler<GetIncorrectSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly ISolutionReadRepository _solutionReadRepository = solutionReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<SolutionResponseDto>> Handle(GetIncorrectSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var solutions = await _solutionReadRepository.GetIncorrectSolutionsByQuestionId(request.QuestionId, request, cancellationToken);
            return _mapper.Map<List<SolutionResponseDto>>(solutions);
        }
    }
}
