using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.DeleteSolution
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
            await _publisher.Publish(new SolutionDeletedDomainEvent(solution),cancellationToken);
        }
    }
}
