using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.SolutionAggregate.DeleteSolution
{
    public class DeleteSolutionHandler(IUnitOfWork unitOfWork, ISolutionWriteRepository solutionWriteRepository, SolutionDeleterDomainService solutionDeleter) : IRequestHandler<DeleteSolutionDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly SolutionDeleterDomainService _solutionDeleter = solutionDeleter;

        public async Task Handle(DeleteSolutionDto request, CancellationToken cancellationToken)
        {
            var solution =
                await _solutionWriteRepository.GetWithCommentsByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionNotFoundException();

            await _solutionDeleter.DeleteAsync(solution, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
