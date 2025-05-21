using MediatR;
using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.DomainEvents;
using SolTake.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.DeleteSolution
{
    public class DeleteSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository, IPublisher publisher) : IRequestHandler<DeleteSolutionDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(DeleteSolutionDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionWriteRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            _solutionWriteRepository.Delete(solution);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SolutionDeletedDomainEvent(solution), cancellationToken);
        }
    }
}
