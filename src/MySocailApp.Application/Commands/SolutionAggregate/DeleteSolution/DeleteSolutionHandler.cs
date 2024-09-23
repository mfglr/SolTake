using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.DeleteSolution
{
    public class DeleteSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository) : IRequestHandler<DeleteSolutionDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;

        public async Task Handle(DeleteSolutionDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionWriteRepository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            solution.Remove();
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
