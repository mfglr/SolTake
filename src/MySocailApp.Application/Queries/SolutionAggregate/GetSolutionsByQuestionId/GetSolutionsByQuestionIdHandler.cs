using AutoMapper;
using MediatR;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionsByQuestionId
{
    public class GetSolutionsByQuestionIdHandler(IMapper mapper, ISolutionReadRepository repository) : IRequestHandler<GetSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ISolutionReadRepository _repository = repository;

        public async Task<List<SolutionResponseDto>> Handle(GetSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var solutions = await _repository.GetSolutionsByQuestionIdAsync(request.QuestionId, request, cancellationToken);
            return _mapper.Map<List<SolutionResponseDto>>(solutions);
        }
    }
}
