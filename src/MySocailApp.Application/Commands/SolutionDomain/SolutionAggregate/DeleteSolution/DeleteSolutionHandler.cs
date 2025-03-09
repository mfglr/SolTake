using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Abstracts;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

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
                await _solutionWriteRepository.GetWithImagesByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();
            _solutionWriteRepository.Delete(solution);
            await _unitOfWork.CommitAsync(cancellationToken);
            await _publisher.Publish(new SolutionDeletedDomainEvent(solution), cancellationToken);
        }
    }
}
