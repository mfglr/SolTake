using AutoMapper;
using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Application.Commands.SolutionAggregate.ApproveSolution
{
    public class ApproveSolutionHandler(IAccountAccessor accountAccessor, ISolutionWriteRepository repository, IMapper mapper) : IRequestHandler<ApproveSolutionDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly ISolutionWriteRepository _repository = repository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(ApproveSolutionDto request, CancellationToken cancellationToken)
        {
            var solution = 
                await _repository.GetByIdAsync(request.SolutionId,cancellationToken) ?? 
                throw new SolutionIsNotFoundException();
        }
    }
}
