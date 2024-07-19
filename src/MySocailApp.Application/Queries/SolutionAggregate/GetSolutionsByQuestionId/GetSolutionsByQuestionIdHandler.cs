using AutoMapper;
using MediatR;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionsByQuestionId
{
    public class GetSolutionsByQuestionIdHandler(IMapper mapper, ISolutionReadRepository repository) : IRequestHandler<GetSolutionsByQuestionIdDto, List<SolutionResponseDto>>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ISolutionReadRepository _repository = repository;

        public async Task<List<SolutionResponseDto>> Handle(GetSolutionsByQuestionIdDto request, CancellationToken cancellationToken)
        {
            var solutions = await _repository.GetByQuestionIdAsync(request.QuestionId,request.LastId,cancellationToken);
            return _mapper.Map<List<SolutionResponseDto>>(solutions);
        }
    }
}
