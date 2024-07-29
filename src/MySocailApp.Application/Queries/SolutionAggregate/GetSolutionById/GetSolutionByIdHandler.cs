using AutoMapper;
using MediatR;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.SolutionAggregate.GetSolutionById
{
    public class GetSolutionByIdHandler(IMapper mapper, ISolutionReadRepository repository) : IRequestHandler<GetSolutionByIdDto, SolutionResponseDto>
    {
        private readonly IMapper _mapper = mapper;
        private readonly ISolutionReadRepository _repository = repository;

        public async Task<SolutionResponseDto> Handle(GetSolutionByIdDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _repository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            return _mapper.Map<SolutionResponseDto>(solution);
        }
    }
}
