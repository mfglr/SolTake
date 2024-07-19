using MediatR;
using MySocailApp.Application.Services;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionAggregate.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Repositories;

namespace MySocailApp.Application.Commands.SolutionAggregate.ApproveSolution
{
    public class ApproveSolutionHandler(IAccessTokenReader tokenReader, ISolutionWriteRepository repository, SolutionApproverDomainService approver, IUnitOfWork unitOfWork) : IRequestHandler<ApproveSolutionDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly ISolutionWriteRepository _repository = repository;
        private readonly SolutionApproverDomainService _approver = approver;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(ApproveSolutionDto request, CancellationToken cancellationToken)
        {
            var approverId = _tokenReader.GetRequiredAccountId();

            var solution =
                await _repository.GetByIdAsync(request.SolutionId, cancellationToken) ??
                throw new SolutionIsNotFoundException();

            await _approver.Approve(solution, approverId, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
