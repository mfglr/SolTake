using AutoMapper;
using MediatR;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetCorrectSolutionsByQuestionId
{
    public class GetCorrectSolutionsByQuestionIdHandler(ISolutionReadRepository solutionReadRepsository, IMapper mapper) : IRequestHandler<GetCorrectSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly ISolutionReadRepository _solutionReadRepsository = solutionReadRepsository;
        private readonly IMapper _mapper = mapper;

        public async Task<List<SolutionResponseDto>> Handle(GetCorrectSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var solutions = await _solutionReadRepsository.GetCorrectSolutionsByQuestionId(
                request.QuestionId, request, cancellationToken
            );
            return _mapper.Map<List<SolutionResponseDto>>(solutions);
        }
    }
}
